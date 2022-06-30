package com.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.service.MemberService;
import com.model.RoomAnswerBean;
import com.model.MemberBean;
import com.service.RoomAnswerService;

@Controller
public class RoomAnswerController {

	@Autowired
	private RoomAnswerService service;

	@Autowired
	private MemberService memberService;

	// 목록
	@RequestMapping("roomAnswerList")
	public String answerList(@RequestParam("room_qna_id") int room_qna_id, @RequestParam("room_id") int room_id,
			@RequestParam("page") int page, Model model) throws Exception {

		List<RoomAnswerBean> roomAnswerList = new ArrayList<RoomAnswerBean>();

		int listCount = service.getAnswerCount(room_qna_id);
		if (listCount == 0) {
			return "alert/answer_alert";
		}
		roomAnswerList = service.getAnswerList(room_qna_id);

		model.addAttribute("roomAnswerList", roomAnswerList);
		model.addAttribute("page", page);
		model.addAttribute("room_qna_id", room_qna_id);
		model.addAttribute("room_id", room_id);

		return "room_answer/room_answer_list";
	}

	// 작성 모달
	@RequestMapping("roomAnswerWriteModal")
	public String answerWriteModal(@RequestParam("room_qna_id") int room_qna_id, @RequestParam("room_id") int room_id,
			@RequestParam("page") int page, Model model) throws Exception {

		model.addAttribute("room_qna_id", room_qna_id);
		model.addAttribute("room_id", room_id);
		model.addAttribute("page", page);

		return "room_answer/room_answer_write_modal";
	}

	// 작성
	@RequestMapping("roomAnswerWrite")
	public String answerWrite(@RequestParam("room_qna_id") int room_qna_id, @RequestParam("page") int page,
			@RequestParam("room_id") int room_id, RoomAnswerBean roomAnswer, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);
		String userphoto = member.getProfile();

		roomAnswer.setUserphoto(userphoto);
		roomAnswer.setId(id);
		service.insertAnswer(roomAnswer);

		return "redirect:/roomDetail?room_id=" + room_id + "&page=" + page + "&state=cont";
	}

	// 수정
	@RequestMapping("roomAnswerModify")
	public String answerModify(@RequestParam("room_answer_id") int room_answer_id, @RequestParam("room_id") int room_id,
			@RequestParam("page") int page, @RequestParam("answer_content") String answer_content,
			RoomAnswerBean answerBean) throws Exception {

		RoomAnswerBean answer = service.getAnswerDetail(room_answer_id);
		answer.setAnswer_content(answer_content);

		service.modifyAnswer(answerBean);

		return "redirect:/roomDetail?room_id=" + room_id + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping("roomAnswerDelete")
	public String answerDelete(@RequestParam("room_id") int room_id, @RequestParam("room_answer_id") int room_answer_id,
			@RequestParam("page") int page) throws Exception {

		service.deleteAnswer(room_answer_id);

		return "redirect:/roomDetail?room_id=" + room_id + "&page=" + page + "&state=cont";
	}

}
