package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.RoomReplyDao;
import com.model.RoomReplyBean;

@Service
public class RoomReplyService {

	@Autowired
	private RoomReplyDao dao;

	// 목록
	public List<RoomReplyBean> getReplyList(int room_rev_id) throws Exception {
		return dao.getReplyList(room_rev_id);
	}

	// 상세
	public RoomReplyBean getReplyDetail(int room_rev_id) throws Exception {
		RoomReplyBean reply = dao.getReplyDetail(room_rev_id);

		return reply;
	}

	// 댓글 수
	public int getReplyCount(int room_rev_id) throws Exception {
		return dao.getReplyCount(room_rev_id);
	}

	// 작성
	public void insertReply(RoomReplyBean reply) throws Exception {
		dao.insertReply(reply);
	}

	// 수정
	public void modifyReply(RoomReplyBean reply) {
		dao.modifyReply(reply);
	}

	// 삭제
	public void deleteReply(int room_reply_id) throws Exception {
		dao.deleteReply(room_reply_id);
	}

}
