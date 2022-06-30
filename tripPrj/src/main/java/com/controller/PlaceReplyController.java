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
import com.model.PlaceReplyBean;
import com.model.MemberBean;
import com.service.PlaceReplyService;

@Controller
public class PlaceReplyController {

	@Autowired
	private PlaceReplyService service;

	@Autowired
	private MemberService memberService;

	// 목록
	@RequestMapping("placeReplyList")
	public String placeReplyList(@RequestParam("place_rev_id") int place_rev_id, @RequestParam("place_id") int place_id,
			@RequestParam("page") int page, Model model) throws Exception {

		List<PlaceReplyBean> placeReplyList = new ArrayList<PlaceReplyBean>();

		int listCount = service.getReplyCount(place_rev_id);
		if (listCount == 0) {
			return "alert/reply_alert";
		}
		placeReplyList = service.getReplyList(place_rev_id);

		model.addAttribute("placeReplyList", placeReplyList);
		model.addAttribute("page", page);
		model.addAttribute("place_rev_id", place_rev_id);
		model.addAttribute("place_id", place_id);

		return "place_reply/place_reply_list";
	}

	// 작성 모달
	@RequestMapping("placeReplyWriteModal")
	public String placeReplyWriteModal(@RequestParam("place_rev_id") int place_rev_id,
			@RequestParam("place_id") int place_id, @RequestParam("page") int page, Model model) throws Exception {

		model.addAttribute("place_rev_id", place_rev_id);
		model.addAttribute("place_id", place_id);
		model.addAttribute("page", page);

		return "place_reply/place_reply_write_modal";
	}

	// 작성
	@RequestMapping("placeReplyWrite")
	public String placeReplyWrite(@RequestParam("place_rev_id") int place_rev_id, @RequestParam("page") int page,
			@RequestParam("place_id") int place_id, PlaceReplyBean placeReply, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);
		String userphoto = member.getProfile();

		placeReply.setUserphoto(userphoto);
		placeReply.setId(id);
		service.insertReply(placeReply);

		return "redirect:/placeDetail?place_id=" + place_id + "&page=" + page + "&state=cont";
	}

	// 수정
	@RequestMapping("placeReplywModify")
	public String reviewModifyForm(@RequestParam("place_reply_id") int place_reply_id,
			@RequestParam("place_id") int place_id, @RequestParam("page") int page,
			@RequestParam("reply_content") String reply_content, PlaceReplyBean replyBean) throws Exception {

		PlaceReplyBean reply = service.getReplyDetail(place_reply_id);
		reply.setReply_content(reply_content);

		service.modifyReply(replyBean);

		return "redirect:/placeDetail?place_id=" + place_id + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping("placeReplyDelete")
	public String placeReplyListDelete(@RequestParam("place_id") int place_id,
			@RequestParam("place_reply_id") int place_reply_id, @RequestParam("page") int page) throws Exception {

		service.deleteReply(place_reply_id);

		return "redirect:/placeDetail?place_id=" + place_id + "&page=" + page + "&state=cont";
	}

}
