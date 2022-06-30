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
import com.model.RoomReplyBean;
import com.model.MemberBean;
import com.service.RoomReplyService;

@Controller
public class RoomReplyController {

	@Autowired
	private RoomReplyService service;

	@Autowired
	private MemberService memberService;

	// 목록
	@RequestMapping("roomReplyList")
	public String roomReplyList(@RequestParam("room_rev_id") int room_rev_id, @RequestParam("room_id") int room_id,
			@RequestParam("page") int page, Model model) throws Exception {

		List<RoomReplyBean> roomReplyList = new ArrayList<RoomReplyBean>();

		int listCount = service.getReplyCount(room_rev_id);
		if (listCount == 0) {
			return "alert/reply_alert";
		}
		roomReplyList = service.getReplyList(room_rev_id);

		model.addAttribute("roomReplyList", roomReplyList);
		model.addAttribute("page", page);
		model.addAttribute("room_rev_id", room_rev_id);
		model.addAttribute("room_id", room_id);

		return "room_reply/room_reply_list";
	}

	// 작성 모달
	@RequestMapping("roomReplyWriteModal")
	public String roomReplyWriteModal(@RequestParam("room_rev_id") int room_rev_id,
			@RequestParam("room_id") int room_id, @RequestParam("page") int page, Model model) throws Exception {

		model.addAttribute("room_rev_id", room_rev_id);
		model.addAttribute("room_id", room_id);
		model.addAttribute("page", page);

		return "room_reply/room_reply_write_modal";
	}

	// 작성
	@RequestMapping("roomReplyWrite")
	public String roomReplyWrite(@RequestParam("room_rev_id") int room_rev_id, @RequestParam("page") int page,
			@RequestParam("room_id") int room_id, RoomReplyBean roomReply, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = memberService.getMember(id);
		String userphoto = member.getProfile();

		roomReply.setUserphoto(userphoto);
		roomReply.setId(id);
		service.insertReply(roomReply);

		return "redirect:/roomDetail?room_id=" + room_id + "&page=" + page + "&state=cont";
	}

	// 수정
	@RequestMapping("roomReplywModify")
	public String reviewModifyForm(@RequestParam("room_reply_id") int room_reply_id,
			@RequestParam("room_id") int room_id, @RequestParam("page") int page,
			@RequestParam("reply_content") String reply_content, RoomReplyBean replyBean) throws Exception {

		RoomReplyBean reply = service.getReplyDetail(room_reply_id);
		reply.setReply_content(reply_content);

		service.modifyReply(replyBean);

		return "redirect:/roomDetail?room_id=" + room_id + "&page=" + page + "&state=cont";
	}

	// 삭제
	@RequestMapping("roomReplyDelete")
	public String roomReplyListDelete(@RequestParam("room_id") int room_id,
			@RequestParam("room_reply_id") int room_reply_id, @RequestParam("page") int page) throws Exception {

		service.deleteReply(room_reply_id);

		return "redirect:/roomDetail?room_id=" + room_id + "&page=" + page + "&state=cont";
	}

}
