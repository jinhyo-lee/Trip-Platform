package com.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.model.FoodQnaBean;
import com.model.MemberBean;
import com.service.FoodQnaService;
import com.service.MemberService;

@Controller
public class FoodQnaController {

	@Autowired
	private FoodQnaService service;

	@Autowired
	private MemberService memberService;

	// 상세
	@RequestMapping("foodQnaDetail")
	public void qnaDetail(@RequestParam("food_qna_id") int food_qna_id, Model model) throws Exception {

		FoodQnaBean foodQnaDetail = service.getQnaDetail(food_qna_id);

		model.addAttribute("foodQnaDetail", foodQnaDetail);
	}

	// 작성 모달
	@RequestMapping("foodQnaWriteModal")
	public String qnaWriteModal(@RequestParam("food_id") int food_id, @RequestParam("page") int page, Model model)
			throws Exception {

		model.addAttribute("food_id", food_id);
		model.addAttribute("page", page);

		return "food_qna/food_qna_write_modal";
	}

	// 작성
	@RequestMapping("foodQnaWrite")
	public String qnaWrite(@RequestParam("food_id") int food_id, @RequestParam("page") int page, FoodQnaBean foodqna,
			HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);
		String userphoto = member.getProfile();

		foodqna.setUserphoto(userphoto);
		foodqna.setId(id);
		service.insertQna(foodqna);

		return "redirect:/foodDetail?food_id=" + food_id + "&page=" + page + "&state=cont";
	}

	// 수정 모달
	@RequestMapping("foodQnaModifyModal")
	public String qnaModifyModal(@RequestParam("food_qna_id") int food_qna_id, @RequestParam("food_id") int food_id,
			@RequestParam("page") int page, Model model) throws Exception {

		FoodQnaBean foodQnaDetail = service.getQnaDetail(food_qna_id);

		model.addAttribute("foodQnaDetail", foodQnaDetail);
		model.addAttribute("food_qna_id", food_qna_id);
		model.addAttribute("food_id", food_id);
		model.addAttribute("page", page);

		return "food_qna/food_qna_modify_modal";
	}

	// 수정
	@RequestMapping("foodQnaModify")
	public String qnaModify(@RequestParam("food_qna_id") int food_qna_id, @RequestParam("food_id") int food_id,
			@RequestParam("page") int page, FoodQnaBean foodqna) throws Exception {

		foodqna.setFood_qna_id(food_qna_id);
		service.modifyQna(foodqna);

		return "redirect:/foodDetail?food_id=" + food_id + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping("foodQnaDelete")
	public String qnaDelete(@RequestParam("food_qna_id") int food_qna_id, @RequestParam("food_id") int food_id,
			@RequestParam("page") int page) throws Exception {

		service.deleteQna(food_qna_id);

		return "redirect:/foodDetail?food_id=" + food_id + "&page=" + page + "&state=cont";
	}

}
