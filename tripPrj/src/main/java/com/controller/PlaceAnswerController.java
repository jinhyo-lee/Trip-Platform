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
import com.model.PlaceAnswerBean;
import com.model.MemberBean;
import com.service.PlaceAnswerService;

@Controller
public class PlaceAnswerController {

	@Autowired
	private PlaceAnswerService service;

	@Autowired
	private MemberService memberService;

	// 목록
	@RequestMapping("placeAnswerList")
	public String answerList(@RequestParam("place_qna_id") int place_qna_id, @RequestParam("place_id") int place_id,
			@RequestParam("page") int page, Model model) throws Exception {

		List<PlaceAnswerBean> placeAnswerList = new ArrayList<PlaceAnswerBean>();

		int listCount = service.getAnswerCount(place_qna_id);
		if (listCount == 0) {
			return "alert/answer_alert";
		}
		placeAnswerList = service.getAnswerList(place_qna_id);

		model.addAttribute("placeAnswerList", placeAnswerList);
		model.addAttribute("page", page);
		model.addAttribute("place_qna_id", place_qna_id);
		model.addAttribute("place_id", place_id);

		return "place_answer/place_answer_list";
	}

	// 작성 모달
	@RequestMapping("placeAnswerWriteModal")
	public String answerWriteModal(@RequestParam("place_qna_id") int place_qna_id,
			@RequestParam("place_id") int place_id, @RequestParam("page") int page, Model model) throws Exception {

		model.addAttribute("place_qna_id", place_qna_id);
		model.addAttribute("place_id", place_id);
		model.addAttribute("page", page);

		return "place_answer/place_answer_write_modal";
	}

	// 작성
	@RequestMapping("placeAnswerWrite")
	public String answerWrite(@RequestParam("place_qna_id") int place_qna_id, @RequestParam("page") int page,
			@RequestParam("place_id") int place_id, PlaceAnswerBean placeAnswer, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);
		String userphoto = member.getProfile();

		placeAnswer.setUserphoto(userphoto);
		placeAnswer.setId(id);
		service.insertAnswer(placeAnswer);

		return "redirect:/placeDetail?place_id=" + place_id + "&page=" + page + "&state=cont";
	}

	// 수정
	@RequestMapping("placeAnswerModify")
	public String answerModify(@RequestParam("place_answer_id") int place_answer_id,
			@RequestParam("place_id") int place_id, @RequestParam("page") int page,
			@RequestParam("answer_content") String answer_content, PlaceAnswerBean answerBean) throws Exception {

		PlaceAnswerBean answer = service.getAnswerDetail(place_answer_id);
		answer.setAnswer_content(answer_content);

		service.modifyAnswer(answerBean);

		return "redirect:/placeDetail?place_id=" + place_id + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping("placeAnswerDelete")
	public String answerDelete(@RequestParam("place_id") int place_id,
			@RequestParam("place_answer_id") int place_answer_id, @RequestParam("page") int page) throws Exception {

		service.deleteAnswer(place_answer_id);

		return "redirect:/placeDetail?place_id=" + place_id + "&page=" + page + "&state=cont";
	}

}
