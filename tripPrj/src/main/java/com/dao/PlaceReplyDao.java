package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.model.PlaceReplyBean;

@Repository
public class PlaceReplyDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<PlaceReplyBean> getReplyList(int place_rev_id) throws Exception {
		List<PlaceReplyBean> list = session.selectList("placeReplyns.getReplyList", place_rev_id);
		return list;
	}

	// 상세
	public PlaceReplyBean getReplyDetail(int place_reply_id) throws Exception {
		return (PlaceReplyBean) session.selectOne("placeReplyns.getReplyDetail", place_reply_id);
	}

	// 댓글 수
	public int getReplyCount(int place_rev_id) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("placeReplyns.getReplyCount", place_rev_id)).intValue();
		return count;
	}

	// 작성
	@Transactional
	public void insertReply(PlaceReplyBean reply) throws Exception {
		session.insert("placeReplyns.insertReply", reply);
	}

	// 수정
	public void modifyReply(PlaceReplyBean reply) {
		session.update("placeReplyns.modifyReply", reply);
	}

	// 삭제
	public void deleteReply(int place_reply_id) throws Exception {
		session.delete("placeReplyns.deleteReply", place_reply_id);
	}

}
