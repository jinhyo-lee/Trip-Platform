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
import com.model.RoomLikeBean;
import com.model.RoomReviewBean;
import com.model.MemberBean;
import com.service.RoomReviewService;
import com.service.MemberService;

@Controller
public class RoomReviewController {

	@Autowired
	private RoomReviewService service;

	@Autowired
	private MemberService memberService;

	// 상세
	@RequestMapping("roomReviewDetail")
	public void roomReviewDetail(@RequestParam("room_rev_id") int room_rev_id, Model model) throws Exception {

		RoomReviewBean roomReviewDetail = service.getReviewDetail(room_rev_id);

		model.addAttribute("roomReviewDetail", roomReviewDetail);
	}

	// 작성 모달
	@RequestMapping("roomReviewWriteModal")
	public String roomReviewWriteModal(@RequestParam("room_id") int room_id, @RequestParam("page") int page,
			Model model) throws Exception {

		model.addAttribute("room_id", room_id);
		model.addAttribute("page", page);

		return "room_review/room_review_write_modal";
	}

	// 작성
	@RequestMapping("roomReviewWrite")
	public String reviewWrite(@RequestParam(value = "starpoint") double rev_rate, @RequestParam("room_id") int room_id,
			@RequestParam("page") int page, RoomReviewBean roomreview, MultipartHttpServletRequest mtf, Model model,
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
			roomreview.setRev_photo(files.toString());
		} else {
			roomreview.setRev_photo(null);
		}

		MemberBean member = memberService.getMember(id);
		String userphoto = member.getProfile();

		roomreview.setUserphoto(userphoto);
		roomreview.setId(id);
		roomreview.setRev_rate(rev_rate);

		service.insertReview(roomreview);

		return "redirect:/roomDetail?room_id=" + room_id + "&page=" + page + "&state=cont";
	}

	// 수정 모달
	@RequestMapping(value = "/roomReviewModifyModal")
	public String modal(@RequestParam("room_rev_id") int room_rev_id, @RequestParam("room_id") int room_id,
			@RequestParam("page") int page, Model model) throws Exception {

		RoomReviewBean roomReviewDetail = service.getReviewDetail(room_rev_id);

		model.addAttribute("roomReviewDetail", roomReviewDetail);
		model.addAttribute("room_rev_id", room_rev_id);
		model.addAttribute("room_id", room_id);
		model.addAttribute("page", page);

		return "room_review/room_review_modify_modal";
	}

	// 수정
	@RequestMapping("roomReviewModify")
	public String reviewModifyForm(@RequestParam("room_rev_id") int room_rev_id, @RequestParam("room_id") int room_id,
			@RequestParam("starpoint") double rev_rate, @RequestParam("page") int page, RoomReviewBean roomreview,
			MultipartHttpServletRequest mtf, Model model, HttpServletRequest request, HttpSession session)
			throws Exception {

		RoomReviewBean oldreview = service.getReviewDetail(room_rev_id);
		if (Math.abs(rev_rate) > 0) {
			roomreview.setRev_rate(rev_rate);
		} else {
			roomreview.setRev_rate(oldreview.getRev_rate());
		}
		roomreview.setRoom_rev_id(room_rev_id);

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
			roomreview.setRev_photo(files.toString());

			String[] photos = oldreview.getRev_photo().split(",");
			for (String photoName : photos) {
				File photoFile = new File(path + "/" + photoName);
				if (photoFile.exists()) {
					photoFile.delete();
				}
			}
		} else {
			roomreview.setRev_photo(oldreview.getRev_photo());
		}

		service.modifyReview(roomreview);

		return "redirect:/roomDetail?room_id=" + room_id + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping(value = "/roomReviewDelete")
	public String roomReviewDelete(@RequestParam("room_rev_id") int room_rev_id, @RequestParam("room_id") int room_id,
			@RequestParam("page") int page, HttpServletRequest request) throws Exception {

		String path = request.getSession().getServletContext().getRealPath("upload");
		RoomReviewBean review = service.getReviewDetail(room_rev_id);

		String[] photos = review.getRev_photo().split(",");
		for (String photoName : photos) {
			File photoFile = new File(path + "/" + photoName);
			if (photoFile.exists()) {
				photoFile.delete();
			}
		}

		service.deleteReview(room_rev_id);

		return "redirect:/roomDetail?room_id=" + room_id + "&page=" + page + "&state=cont";
	}

	// 좋아요
	@RequestMapping("roomReviewLike")
	public String addRoomMark(@RequestParam("room_rev_id") int room_rev_id, @RequestParam("room_id") int room_id,
			@RequestParam("page") int page, RoomLikeBean roomlike, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		roomlike.setId(id);
		roomlike.setRoom_rev_id(room_rev_id);

		int likeCount = service.getLikeCount(roomlike);
		if (likeCount == 0) {
			service.addLike(roomlike);
		} else {
			service.delLike(roomlike);
		}

		return "redirect:/roomDetail?room_id=" + room_id + "&page=" + page + "&state=cont";
	}

}
