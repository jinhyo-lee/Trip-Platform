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
import com.model.FoodReplyBean;
import com.model.MemberBean;
import com.service.FoodReplyService;

@Controller
public class FoodReplyController {

	@Autowired
	private FoodReplyService service;

	@Autowired
	private MemberService memberService;

	// 목록
	@RequestMapping("foodReplyList")
	public String replyList(@RequestParam("food_rev_id") int food_rev_id, @RequestParam("food_id") int food_id,
			@RequestParam("page") int page, Model model) throws Exception {

		List<FoodReplyBean> foodReplyList = new ArrayList<FoodReplyBean>();

		int listCount = service.getReplyCount(food_rev_id);
		if (listCount == 0) {
			return "alert/reply_alert";
		}
		foodReplyList = service.getReplyList(food_rev_id);

		model.addAttribute("foodReplyList", foodReplyList);
		model.addAttribute("page", page);
		model.addAttribute("food_rev_id", food_rev_id);
		model.addAttribute("food_id", food_id);

		return "food_reply/food_reply_list";
	}

	// 작성 모달
	@RequestMapping("foodReplyWriteModal")
	public String replyWriteModal(@RequestParam("food_rev_id") int food_rev_id, @RequestParam("food_id") int food_id,
			@RequestParam("page") int page, Model model) throws Exception {

		model.addAttribute("food_rev_id", food_rev_id);
		model.addAttribute("food_id", food_id);
		model.addAttribute("page", page);

		return "food_reply/food_reply_write_modal";
	}

	// 작성
	@RequestMapping("foodReplyWrite")
	public String replyWrite(@RequestParam("food_rev_id") int food_rev_id, @RequestParam("page") int page,
			@RequestParam("food_id") int food_id, FoodReplyBean foodReply, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);
		String userphoto = member.getProfile();

		foodReply.setUserphoto(userphoto);
		foodReply.setId(id);
		service.insertReply(foodReply);

		return "redirect:/foodDetail?food_id=" + food_id + "&page=" + page + "&state=cont";
	}

	// 수정
	@RequestMapping("foodReplywModify")
	public String replyModify(@RequestParam("food_reply_id") int food_reply_id, @RequestParam("food_id") int food_id,
			@RequestParam("page") int page, @RequestParam("reply_content") String reply_content,
			FoodReplyBean replyBean) throws Exception {

		FoodReplyBean reply = service.getReplyDetail(food_reply_id);
		reply.setReply_content(reply_content);

		service.modifyReply(replyBean);

		return "redirect:/foodDetail?food_id=" + food_id + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping("foodReplyDelete")
	public String replyDelete(@RequestParam("food_id") int food_id, @RequestParam("food_reply_id") int food_reply_id,
			@RequestParam("page") int page) throws Exception {

		service.deleteReply(food_reply_id);

		return "redirect:/foodDetail?food_id=" + food_id + "&page=" + page + "&state=cont";
	}

}
