package com.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.model.RoomQnaBean;
import com.model.MemberBean;
import com.service.RoomQnaService;
import com.service.MemberService;

@Controller
public class RoomQnaController {

	@Autowired
	private RoomQnaService service;

	@Autowired
	private MemberService memberService;

	// 상세
	@RequestMapping("roomQnaDetail")
	public void qnaDetail(@RequestParam("room_qna_id") int room_qna_id, Model model) throws Exception {

		RoomQnaBean roomQnaDetail = service.getQnaDetail(room_qna_id);

		model.addAttribute("roomQnaDetail", roomQnaDetail);
	}

	// 작성 모달
	@RequestMapping("roomQnaWriteModal")
	public String qnaWriteModal(@RequestParam("room_id") int room_id, @RequestParam("page") int page, Model model)
			throws Exception {

		model.addAttribute("room_id", room_id);
		model.addAttribute("page", page);

		return "room_qna/room_qna_write_modal";
	}

	// 작성
	@RequestMapping("roomQnaWrite")
	public String qnaWrite(@RequestParam("room_id") int room_id, @RequestParam("page") int page, RoomQnaBean roomqna,
			HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);
		String userphoto = member.getProfile();

		roomqna.setUserphoto(userphoto);
		roomqna.setId(id);
		service.insertQna(roomqna);

		return "redirect:/roomDetail?room_id=" + room_id + "&page=" + page + "&state=cont";
	}

	// 수정 모달
	@RequestMapping("roomQnaModifyModal")
	public String qnaModifyModal(@RequestParam("room_qna_id") int room_qna_id, @RequestParam("room_id") int room_id,
			@RequestParam("page") int page, Model model) throws Exception {

		RoomQnaBean roomQnaDetail = service.getQnaDetail(room_qna_id);

		model.addAttribute("roomQnaDetail", roomQnaDetail);
		model.addAttribute("room_qna_id", room_qna_id);
		model.addAttribute("room_id", room_id);
		model.addAttribute("page", page);

		return "room_qna/room_qna_modify_modal";
	}

	// 수정
	@RequestMapping("roomQnaModify")
	public String qnaModify(@RequestParam("room_qna_id") int room_qna_id, @RequestParam("room_id") int room_id,
			@RequestParam("page") int page, RoomQnaBean roomqna) throws Exception {

		roomqna.setRoom_qna_id(room_qna_id);
		service.modifyQna(roomqna);

		return "redirect:/roomDetail?room_id=" + room_id + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping("roomQnaDelete")
	public String qnaDelete(@RequestParam("room_qna_id") int room_qna_id, @RequestParam("room_id") int room_id,
			@RequestParam("page") int page) throws Exception {

		service.deleteQna(room_qna_id);

		return "redirect:/roomDetail?room_id=" + room_id + "&page=" + page + "&state=cont";
	}

}
