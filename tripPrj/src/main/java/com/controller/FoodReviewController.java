package com.controller;

import java.io.File;
import java.util.List;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.model.FoodLikeBean;
import com.model.FoodReviewBean;
import com.model.MemberBean;
import com.service.FoodReviewService;
import com.service.MemberService;

@Controller
public class FoodReviewController {

	@Autowired
	private FoodReviewService service;

	@Autowired
	private MemberService memberService;

	// 상세
	@RequestMapping("foodReviewDetail")
	public void reviewDetail(@RequestParam("food_rev_id") int food_rev_id, Model model) throws Exception {

		FoodReviewBean foodReviewDetail = service.getReviewDetail(food_rev_id);

		model.addAttribute("foodReviewDetail", foodReviewDetail);
	}

	// 작성 모달
	@RequestMapping("foodReviewWriteModal")
	public String reviewWriteModal(@RequestParam("food_id") int food_id, @RequestParam("page") int page, Model model)
			throws Exception {

		model.addAttribute("food_id", food_id);
		model.addAttribute("page", page);

		return "food_review/food_review_write_modal";
	}

	// 작성
	@RequestMapping("foodReviewWrite")
	public String reviewWrite(@RequestParam(value = "starpoint") double rev_rate, @RequestParam("food_id") int food_id,
			@RequestParam("page") int page, FoodReviewBean foodreview, MultipartHttpServletRequest mtf, Model model,
			HttpServletRequest request, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");

		List<MultipartFile> fileList = mtf.getFiles("rev_photos");
		String path = request.getSession().getServletContext().getRealPath("upload");

		StringBuilder files = new StringBuilder();
		int size = 0;
		for (MultipartFile mf : fileList) {
			int result = 0;
			size = (int) mf.getSize();
			if (size > 0) {
				String originFileName = mf.getOriginalFilename();
				StringTokenizer st = new StringTokenizer(originFileName, ".");

				String file[] = new String[2];
				file[0] = st.nextToken();
				file[1] = st.nextToken();

				if (size > 10000000) {
					result = 1;
					model.addAttribute("result", result);

					return "alert/upload_alert";

				} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")
						&& !file[1].equals("jpeg")) {
					result = 2;
					model.addAttribute("result", result);

					return "alert/upload_alert";
				}
				String safeFile = System.currentTimeMillis() + originFileName;
				files.append(safeFile + ",");

				mf.transferTo(new File(path + "/" + safeFile));
			}

		}

		if (size > 0) {
			foodreview.setRev_photo(files.toString());
		} else {
			foodreview.setRev_photo(null);
		}

		MemberBean member = memberService.getMember(id);
		String userphoto = member.getProfile();

		foodreview.setUserphoto(userphoto);
		foodreview.setId(id);
		foodreview.setRev_rate(rev_rate);

		service.insertReview(foodreview);

		return "redirect:/foodDetail?food_id=" + food_id + "&page=" + page + "&state=cont";
	}

	// 수정 모달
	@RequestMapping("foodReviewModifyModal")
	public String reviewModifyModal(@RequestParam("food_rev_id") int food_rev_id, @RequestParam("food_id") int food_id,
			@RequestParam("page") int page, Model model) throws Exception {

		FoodReviewBean foodReviewDetail = service.getReviewDetail(food_rev_id);

		model.addAttribute("foodReviewDetail", foodReviewDetail);
		model.addAttribute("food_rev_id", food_rev_id);
		model.addAttribute("food_id", food_id);
		model.addAttribute("page", page);

		return "food_review/food_review_modify_modal";
	}

	// 수정
	@RequestMapping("foodReviewModify")
	public String reviewModify(@RequestParam("food_rev_id") int food_rev_id, @RequestParam("food_id") int food_id,
			@RequestParam("starpoint") double rev_rate, @RequestParam("page") int page, FoodReviewBean foodreview,
			MultipartHttpServletRequest mtf, Model model, HttpServletRequest request, HttpSession session)
			throws Exception {

		FoodReviewBean oldreview = service.getReviewDetail(food_rev_id);
		if (Math.abs(rev_rate) > 0) {
			foodreview.setRev_rate(rev_rate);
		} else {
			foodreview.setRev_rate(oldreview.getRev_rate());
		}
		foodreview.setFood_rev_id(food_rev_id);

		List<MultipartFile> fileList = mtf.getFiles("rev_photos1");
		String path = request.getSession().getServletContext().getRealPath("upload");

		StringBuilder files = new StringBuilder();
		int size = 0;
		for (MultipartFile mf : fileList) {
			int result = 0;

			String originFileName = mf.getOriginalFilename();
			size = (int) mf.getSize();
			if (size > 0) {
				StringTokenizer st = new StringTokenizer(originFileName, ".");
				String file[] = new String[2];
				file[0] = st.nextToken();
				file[1] = st.nextToken();

				if (size > 10000000) {
					result = 1;
					model.addAttribute("result", result);

					return "alert/upload_alert";

				} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")
						&& !file[1].equals("jpeg")) {
					result = 2;
					model.addAttribute("result", result);

					return "alert/upload_alert";
				}
			}
			String safeFile = System.currentTimeMillis() + originFileName;
			files.append(safeFile + ",");

			mf.transferTo(new File(path + "/" + safeFile));
		}

		if (size > 0) {
			foodreview.setRev_photo(files.toString());

			String[] photos = oldreview.getRev_photo().split(",");
			for (String photoName : photos) {
				File photoFile = new File(path + "/" + photoName);
				if (photoFile.exists()) {
					photoFile.delete();
				}
			}
		} else {
			foodreview.setRev_photo(oldreview.getRev_photo());
		}

		service.modifyReview(foodreview);

		return "redirect:/foodDetail?food_id=" + food_id + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping("foodReviewDelete")
	public String reviewDelete(@RequestParam("food_rev_id") int food_rev_id, @RequestParam("food_id") int food_id,
			@RequestParam("page") int page, HttpServletRequest request) throws Exception {

		String path = request.getSession().getServletContext().getRealPath("upload");
		FoodReviewBean review = service.getReviewDetail(food_rev_id);

		String[] photos = review.getRev_photo().split(",");
		for (String photoName : photos) {
			File photoFile = new File(path + "/" + photoName);
			if (photoFile.exists()) {
				photoFile.delete();
			}
		}

		service.deleteReview(food_rev_id);

		return "redirect:/foodDetail?food_id=" + food_id + "&page=" + page + "&state=cont";
	}

	// 좋아요
	@RequestMapping("foodReviewLike")
	public String reviewLike(@RequestParam("food_rev_id") int food_rev_id, @RequestParam("food_id") int food_id,
			@RequestParam("page") int page, FoodLikeBean foodlike, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		foodlike.setId(id);
		foodlike.setFood_rev_id(food_rev_id);

		int likeCount = service.getLikeCount(foodlike);
		if (likeCount == 0) {
			service.addLike(foodlike);
		} else {
			service.delLike(foodlike);
		}

		return "redirect:/foodDetail?food_id=" + food_id + "&page=" + page + "&state=cont";
	}

}
