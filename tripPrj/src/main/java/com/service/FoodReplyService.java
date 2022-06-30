package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.FoodReplyDao;
import com.model.FoodReplyBean;

@Service
public class FoodReplyService {

	@Autowired
	private FoodReplyDao dao;

	// 목록
	public List<FoodReplyBean> getReplyList(int food_rev_id) throws Exception {
		return dao.getReplyList(food_rev_id);
	}

	// 상세
	public FoodReplyBean getReplyDetail(int food_rev_id) throws Exception {
		FoodReplyBean reply = dao.getReplyDetail(food_rev_id);

		return reply;
	}

	// 댓글 수
	public int getReplyCount(int food_rev_id) throws Exception {
		return dao.getReplyCount(food_rev_id);
	}

	// 작성
	public void insertReply(FoodReplyBean reply) throws Exception {
		dao.insertReply(reply);
	}

	// 수정
	public void modifyReply(FoodReplyBean reply) {
		dao.modifyReply(reply);
	}

	// 삭제
	public void deleteReply(int food_reply_id) throws Exception {
		dao.deleteReply(food_reply_id);
	}

}
