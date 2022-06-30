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
import com.model.FoodAnswerBean;
import com.model.MemberBean;
import com.service.FoodAnswerService;

@Controller
public class FoodAnswerController {

	@Autowired
	private FoodAnswerService service;

	@Autowired
	private MemberService memberService;

	// 목록
	@RequestMapping("foodAnswerList")
	public String answerList(@RequestParam("food_qna_id") int food_qna_id, @RequestParam("food_id") int food_id,
			@RequestParam("page") int page, Model model) throws Exception {

		List<FoodAnswerBean> foodAnswerList = new ArrayList<FoodAnswerBean>();

		int listCount = service.getAnswerCount(food_qna_id);
		if (listCount == 0) {
			return "alert/answer_alert";
		}
		foodAnswerList = service.getAnswerList(food_qna_id);

		model.addAttribute("foodAnswerList", foodAnswerList);
		model.addAttribute("page", page);
		model.addAttribute("food_qna_id", food_qna_id);
		model.addAttribute("food_id", food_id);

		return "food_answer/food_answer_list";
	}

	// 작성 모달
	@RequestMapping("foodAnswerWriteModal")
	public String answerWriteModal(@RequestParam("food_qna_id") int food_qna_id, @RequestParam("food_id") int food_id,
			@RequestParam("page") int page, Model model) throws Exception {

		model.addAttribute("food_qna_id", food_qna_id);
		model.addAttribute("food_id", food_id);
		model.addAttribute("page", page);

		return "food_answer/food_answer_write_modal";
	}

	// 작성
	@RequestMapping("foodAnswerWrite")
	public String answerWrite(@RequestParam("food_qna_id") int food_qna_id, @RequestParam("page") int page,
			@RequestParam("food_id") int food_id, FoodAnswerBean foodAnswer, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);
		String userphoto = member.getProfile();

		foodAnswer.setUserphoto(userphoto);
		foodAnswer.setId(id);
		service.insertAnswer(foodAnswer);

		return "redirect:/foodDetail?food_id=" + food_id + "&page=" + page + "&state=cont";
	}

	// 수정
	@RequestMapping("foodAnswerModify")
	public String answerModify(@RequestParam("food_answer_id") int food_answer_id, @RequestParam("food_id") int food_id,
			@RequestParam("page") int page, @RequestParam("answer_content") String answer_content,
			FoodAnswerBean answerBean) throws Exception {

		FoodAnswerBean answer = service.getAnswerDetail(food_answer_id);
		answer.setAnswer_content(answer_content);

		service.modifyAnswer(answerBean);

		return "redirect:/foodDetail?food_id=" + food_id + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping("foodAnswerDelete")
	public String answerDelete(@RequestParam("food_answer_id") int food_answer_id, @RequestParam("food_id") int food_id,
			@RequestParam("page") int page) throws Exception {

		service.deleteAnswer(food_answer_id);

		return "redirect:/foodDetail?food_id=" + food_id + "&page=" + page + "&state=cont";
	}

}
