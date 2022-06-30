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
import com.model.PlaceLikeBean;
import com.model.PlaceReviewBean;
import com.model.MemberBean;
import com.service.PlaceReviewService;
import com.service.MemberService;

@Controller
public class PlaceReviewController {

	@Autowired
	private PlaceReviewService service;

	@Autowired
	private MemberService memberService;

	// 상세
	@RequestMapping("placeReviewDetail")
	public void placeReviewDetail(@RequestParam("place_rev_id") int place_rev_id, Model model) throws Exception {

		PlaceReviewBean placeReviewDetail = service.getReviewDetail(place_rev_id);

		model.addAttribute("placeReviewDetail", placeReviewDetail);
	}

	// 작성 모달
	@RequestMapping("placeReviewWriteModal")
	public String placeReviewWriteModal(@RequestParam("place_id") int place_id, @RequestParam("page") int page,
			Model model) throws Exception {

		model.addAttribute("place_id", place_id);
		model.addAttribute("page", page);

		return "place_review/place_review_write_modal";
	}

	// 작성
	@RequestMapping("placeReviewWrite")
	public String reviewWrite(@RequestParam(value = "starpoint") double rev_rate,
			@RequestParam("place_id") int place_id, @RequestParam("page") int page, PlaceReviewBean placereview,
			MultipartHttpServletRequest mtf, Model model, HttpServletRequest request, HttpSession session)
			throws Exception {

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
			placereview.setRev_photo(files.toString());
		} else {
			placereview.setRev_photo(null);
		}

		MemberBean member = memberService.getMember(id);
		String userphoto = member.getProfile();

		placereview.setUserphoto(userphoto);
		placereview.setId(id);
		placereview.setRev_rate(rev_rate);

		service.insertReview(placereview);

		return "redirect:/placeDetail?place_id=" + place_id + "&page=" + page + "&state=cont";
	}

	// 수정 모달
	@RequestMapping(value = "/placeReviewModifyModal")
	public String modal(@RequestParam("place_rev_id") int place_rev_id, @RequestParam("place_id") int place_id,
			@RequestParam("page") int page, Model model) throws Exception {

		PlaceReviewBean placeReviewDetail = service.getReviewDetail(place_rev_id);

		model.addAttribute("placeReviewDetail", placeReviewDetail);
		model.addAttribute("place_rev_id", place_rev_id);
		model.addAttribute("place_id", place_id);
		model.addAttribute("page", page);

		return "place_review/place_review_modify_modal";
	}

	// 수정
	@RequestMapping("placeReviewModify")
	public String reviewModifyForm(@RequestParam("place_rev_id") int place_rev_id,
			@RequestParam("place_id") int place_id, @RequestParam("starpoint") double rev_rate,
			@RequestParam("page") int page, PlaceReviewBean placereview, MultipartHttpServletRequest mtf, Model model,
			HttpServletRequest request, HttpSession session) throws Exception {

		PlaceReviewBean oldreview = service.getReviewDetail(place_rev_id);
		if (Math.abs(rev_rate) > 0) {
			placereview.setRev_rate(rev_rate);
		} else {
			placereview.setRev_rate(oldreview.getRev_rate());
		}
		placereview.setPlace_rev_id(place_rev_id);

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

					return "place_review/review_upload_result";

				} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")
						&& !file[1].equals("jpeg")) {
					result = 2;
					model.addAttribute("result", result);

					return "place_review/review_upload_result";
				}
			}
			String safeFile = System.currentTimeMillis() + originFileName;
			files.append(safeFile + ",");

			mf.transferTo(new File(path + "/" + safeFile));
		}

		if (size > 0) {
			placereview.setRev_photo(files.toString());

			String[] photos = oldreview.getRev_photo().split(",");
			for (String photoName : photos) {
				File photoFile = new File(path + "/" + photoName);
				if (photoFile.exists()) {
					photoFile.delete();
				}
			}
		} else {
			placereview.setRev_photo(oldreview.getRev_photo());
		}

		service.modifyReview(placereview);

		return "redirect:/placeDetail?place_id=" + place_id + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping(value = "/placeReviewDelete")
	public String placeReviewDelete(@RequestParam("place_rev_id") int place_rev_id,
			@RequestParam("place_id") int place_id, @RequestParam("page") int page, HttpServletRequest request)
			throws Exception {

		String path = request.getSession().getServletContext().getRealPath("upload");
		PlaceReviewBean review = service.getReviewDetail(place_rev_id);

		String[] photos = review.getRev_photo().split(",");
		for (String photoName : photos) {
			File photoFile = new File(path + "/" + photoName);
			if (photoFile.exists()) {
				photoFile.delete();
			}
		}

		service.deleteReview(place_rev_id);

		return "redirect:/placeDetail?place_id=" + place_id + "&page=" + page + "&state=cont";
	}

	// 좋아요
	@RequestMapping("placeReviewLike")
	public String addPlaceMark(@RequestParam("place_rev_id") int place_rev_id, @RequestParam("place_id") int place_id,
			@RequestParam("page") int page, PlaceLikeBean placelike, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		placelike.setId(id);
		placelike.setPlace_rev_id(place_rev_id);

		int likeCount = service.getLikeCount(placelike);
		if (likeCount == 0) {
			service.addLike(placelike);
		} else {
			service.delLike(placelike);
		}

		return "redirect:/placeDetail?place_id=" + place_id + "&page=" + page + "&state=cont";
	}

}
