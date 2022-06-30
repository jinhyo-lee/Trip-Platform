package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.model.FoodReplyBean;

@Repository
public class FoodReplyDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<FoodReplyBean> getReplyList(int food_rev_id) throws Exception {
		List<FoodReplyBean> list = session.selectList("foodReplyns.getReplyList", food_rev_id);
		
		return list;
	}

	// 상세
	public FoodReplyBean getReplyDetail(int food_reply_id) throws Exception {
		return (FoodReplyBean) session.selectOne("foodReplyns.getReplyDetail", food_reply_id);
	}

	// 댓글 수
	public int getReplyCount(int food_rev_id) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("foodReplyns.getReplyCount", food_rev_id)).intValue();
		
		return count;
	}

	// 작성
	@Transactional
	public void insertReply(FoodReplyBean reply) throws Exception {
		session.insert("foodReplyns.insertReply", reply);
	}

	// 수정
	public void modifyReply(FoodReplyBean reply) {
		session.update("foodReplyns.modifyReply", reply);
	}

	// 삭제
	public void deleteReply(int food_reply_id) throws Exception {
		session.delete("foodReplyns.deleteReply", food_reply_id);
	}

}
