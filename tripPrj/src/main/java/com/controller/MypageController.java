package com.controller;

import java.io.File;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.model.FoodBookmarkBean;
import com.model.FoodQnaBean;
import com.model.FoodReviewBean;
import com.model.MemberBean;
import com.model.PlaceBookmarkBean;
import com.model.PlaceQnaBean;
import com.model.PlaceReviewBean;
import com.model.RoomBookmarkBean;
import com.model.RoomQnaBean;
import com.model.RoomReviewBean;
import com.service.MemberService;
import com.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	private MypageService service;

	@Autowired
	private MemberService memberService;

	// 마이 페이지
	@RequestMapping("myPage")
	public String myPage(HttpSession session, Model model) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);

		String tel = member.getTel();
		StringBuilder sb = new StringBuilder();
		char[] arr = tel.toCharArray();
		for (int i = 0; i < arr.length; i++) {
			sb.append(arr[i]);
			if (i == 2 || i == 6)
				sb.append('-');
		}
		member.setTel(sb.toString());

		int len = member.getPw().length();
		String encrypt = "";
		for (int i = 0; i < len; i++) {
			encrypt += "*";
		}

		model.addAttribute("member", member);
		model.addAttribute("id", id);
		model.addAttribute("encrypt", encrypt);

		return "mypage/mypage";
	}

	// 수정
	@RequestMapping(value = "memberModify", method = RequestMethod.POST)
	public String modify(@RequestParam("profiles") MultipartFile mf, MemberBean member, HttpServletRequest request,
			HttpSession session, Model model) throws Exception {

		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize();
		String path = request.getSession().getServletContext().getRealPath("upload");

		int result = 0;
		String file[] = new String[2];
		String newfilename = "";

		if (size > 0) {
			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();
			file[1] = st.nextToken();

			UUID uuid = UUID.randomUUID();
			newfilename = uuid.toString() + "." + file[1];

			if (size > 10000000) {
				result = 1;
				model.addAttribute("result", result);

				return "alert/upload_alert";
			} else if (!file[1].equals("jpg") && !file[1].equals("jpeg") && !file[1].equals("gif")
					&& !file[1].equals("png")) {
				result = 2;
				model.addAttribute("result", result);

				return "alert/upload_alert";
			}
		}

		if (size > 0) {
			mf.transferTo(new File(path + "/" + newfilename));
		}

		String id = (String) session.getAttribute("id");
		MemberBean old = memberService.getMember(id);

		if (size > 0) {
			member.setProfile(newfilename);

			String profile = old.getProfile();
			File photoFile = new File(path + "/" + profile);
			if (photoFile.exists()) {
				photoFile.delete();
			}
		} else {
			member.setProfile(old.getProfile());
		}

		member.setId(id);
		service.modify(member);

		model.addAttribute("name", member.getName());
		model.addAttribute("profiles", member.getProfile());

		return "redirect:myPage";
	}

	// 탈퇴 폼
	@RequestMapping("memberQuitForm")
	public String quitForm(HttpSession session, Model model) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);

		model.addAttribute("id", id);
		model.addAttribute("name", member.getName());

		return "mypage/mypage_quit";
	}

	// 탈퇴
	@RequestMapping(value = "/memberQuit", method = RequestMethod.POST)
	public String quit(@RequestParam("pw") String pw, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);

		if (!member.getPw().equals(pw)) {
			return "mypage/mypage_pwresult";
		} else {
			String path = session.getServletContext().getRealPath("upload");
			String name = member.getProfile();

			File file = new File(path + "/" + name);
			if (file.exists()) {
				file.delete();
			}

			service.quit(id);

			session.invalidate();

			return "redirect:main";
		}
	}

	// 북마크 목록
	@RequestMapping("myBookmarkList")
	public String myBookmarklist(Model model, HttpServletRequest request, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);

		String tel = member.getTel();
		StringBuilder sb = new StringBuilder();
		char[] arr = tel.toCharArray();
		for (int i = 0; i < arr.length; i++) {
			sb.append(arr[i]);
			if (i == 2 || i == 6)
				sb.append('-');
		}
		member.setTel(sb.toString());

		List<FoodBookmarkBean> foodBookmarkList = service.getFoodmark(id);
		List<PlaceBookmarkBean> placeBookmarkList = service.getPlacemark(id);
		List<RoomBookmarkBean> roomBookmarkList = service.getRoommark(id);

		model.addAttribute("foodBookmarkList", foodBookmarkList);
		model.addAttribute("placeBookmarkList", placeBookmarkList);
		model.addAttribute("roomBookmarkList", roomBookmarkList);
		model.addAttribute("member", member);
		model.addAttribute("id", id);

		return "mypage/mypage_bookmark";
	}

	// 북마크 삭제
	@RequestMapping("myBookmarkDelete")
	public String myBookmarkDelete(HttpServletRequest request, HttpSession session, FoodBookmarkBean foodbookmark,
			PlaceBookmarkBean placebookmark, RoomBookmarkBean roombookmark) throws Exception {

		String id = (String) session.getAttribute("id");

		foodbookmark.setId(id);
		service.deleteFoodMark(foodbookmark);

		placebookmark.setId(id);
		service.deletePlaceMark(placebookmark);

		roombookmark.setId(id);
		service.deleteRoomMark(roombookmark);

		return "redirect:myBookmarkList";
	}

	// 리뷰 목록
	@RequestMapping("myReviewList")
	public String myReviewList(Model model, HttpServletRequest request, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);

		String tel = member.getTel();
		StringBuilder sb = new StringBuilder();
		char[] arr = tel.toCharArray();
		for (int i = 0; i < arr.length; i++) {
			sb.append(arr[i]);
			if (i == 2 || i == 6)
				sb.append('-');
		}
		member.setTel(sb.toString());

		List<FoodReviewBean> foodReviewList = service.getFoodReview(id);
		List<PlaceReviewBean> placeReviewList = service.getPlaceReview(id);
		List<RoomReviewBean> roomReviewList = service.getRoomReview(id);

		model.addAttribute("member", member);
		model.addAttribute("id", id);
		model.addAttribute("foodReviewList", foodReviewList);
		model.addAttribute("placeReviewList", placeReviewList);
		model.addAttribute("roomReviewList", roomReviewList);

		return "mypage/mypage_reviewlist";
	}

	// 문의 목록
	@RequestMapping("myQnaList")
	public String myQnaList(Model model, HttpServletRequest request, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);

		String tel = member.getTel();
		StringBuilder sb = new StringBuilder();
		char[] arr = tel.toCharArray();
		for (int i = 0; i < arr.length; i++) {
			sb.append(arr[i]);
			if (i == 2 || i == 6)
				sb.append('-');
		}
		member.setTel(sb.toString());

		List<FoodQnaBean> foodQnaList = service.getFoodQna(id);
		List<PlaceQnaBean> placeQnaList = service.getPlaceQna(id);
		List<RoomQnaBean> roomQnaList = service.getRoomQna(id);

		model.addAttribute("member", member);
		model.addAttribute("id", id);
		model.addAttribute("foodQnaList", foodQnaList);
		model.addAttribute("placeQnaList", placeQnaList);
		model.addAttribute("roomQnaList", roomQnaList);

		return "mypage/mypage_qnalist";
	}

}
