package com.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.model.PlaceQnaBean;
import com.model.MemberBean;
import com.service.PlaceQnaService;
import com.service.MemberService;

@Controller
public class PlaceQnaController {

	@Autowired
	private PlaceQnaService service;

	@Autowired
	private MemberService memberService;

	// 상세
	@RequestMapping("placeQnaDetail")
	public void qnaDetail(@RequestParam("place_qna_id") int place_qna_id, Model model) throws Exception {

		PlaceQnaBean placeQnaDetail = service.getQnaDetail(place_qna_id);

		model.addAttribute("placeQnaDetail", placeQnaDetail);
	}

	// 작성 모달
	@RequestMapping("placeQnaWriteModal")
	public String qnaWriteModal(@RequestParam("place_id") int place_id, @RequestParam("page") int page, Model model)
			throws Exception {

		model.addAttribute("place_id", place_id);
		model.addAttribute("page", page);

		return "place_qna/place_qna_write_modal";
	}

	// 작성
	@RequestMapping("placeQnaWrite")
	public String qnaWrite(@RequestParam("place_id") int place_id, @RequestParam("page") int page,
			PlaceQnaBean placeqna, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);
		String userphoto = member.getProfile();

		placeqna.setUserphoto(userphoto);
		placeqna.setId(id);
		service.insertQna(placeqna);

		return "redirect:/placeDetail?place_id=" + place_id + "&page=" + page + "&state=cont";
	}

	// 수정 모달
	@RequestMapping("placeQnaModifyModal")
	public String qnaModifyModal(@RequestParam("place_qna_id") int place_qna_id, @RequestParam("place_id") int place_id,
			@RequestParam("page") int page, Model model) throws Exception {

		PlaceQnaBean placeQnaDetail = service.getQnaDetail(place_qna_id);

		model.addAttribute("placeQnaDetail", placeQnaDetail);
		model.addAttribute("place_qna_id", place_qna_id);
		model.addAttribute("place_id", place_id);
		model.addAttribute("page", page);

		return "place_qna/place_qna_modify_modal";
	}

	// 수정
	@RequestMapping("placeQnaModify")
	public String qnaModify(@RequestParam("place_qna_id") int place_qna_id, @RequestParam("place_id") int place_id,
			@RequestParam("page") int page, PlaceQnaBean placeqna) throws Exception {

		placeqna.setPlace_qna_id(place_qna_id);
		service.modifyQna(placeqna);

		return "redirect:/placeDetail?place_id=" + place_id + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping("placeQnaDelete")
	public String qnaDelete(@RequestParam("place_qna_id") int place_qna_id, @RequestParam("place_id") int place_id,
			@RequestParam("page") int page) throws Exception {

		service.deleteQna(place_qna_id);

		return "redirect:/placeDetail?place_id=" + place_id + "&page=" + page + "&state=cont";
	}

}
