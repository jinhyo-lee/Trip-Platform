package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.PlaceReplyDao;
import com.model.PlaceReplyBean;

@Service
public class PlaceReplyService {

	@Autowired
	private PlaceReplyDao dao;

	// 목록
	public List<PlaceReplyBean> getReplyList(int place_rev_id) throws Exception {
		return dao.getReplyList(place_rev_id);
	}

	// 상세
	public PlaceReplyBean getReplyDetail(int place_rev_id) throws Exception {
		PlaceReplyBean reply = dao.getReplyDetail(place_rev_id);

		return reply;
	}

	// 댓글 수
	public int getReplyCount(int place_rev_id) throws Exception {
		return dao.getReplyCount(place_rev_id);
	}

	// 작성
	public void insertReply(PlaceReplyBean reply) throws Exception {
		dao.insertReply(reply);
	}

	// 수정
	public void modifyReply(PlaceReplyBean reply) {
		dao.modifyReply(reply);
	}

	// 삭제
	public void deleteReply(int place_reply_id) throws Exception {
		dao.deleteReply(place_reply_id);
	}

}
