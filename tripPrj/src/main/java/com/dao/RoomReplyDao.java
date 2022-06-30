package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.model.RoomReplyBean;

@Repository
public class RoomReplyDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<RoomReplyBean> getReplyList(int room_rev_id) throws Exception {
		List<RoomReplyBean> list = session.selectList("roomReplyns.getReplyList", room_rev_id);
		return list;
	}

	// 상세
	public RoomReplyBean getReplyDetail(int room_reply_id) throws Exception {
		return (RoomReplyBean) session.selectOne("roomReplyns.getReplyDetail", room_reply_id);
	}

	// 댓글 수
	public int getReplyCount(int room_rev_id) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("roomReplyns.getReplyCount", room_rev_id)).intValue();
		return count;
	}

	// 작성
	@Transactional
	public void insertReply(RoomReplyBean reply) throws Exception {
		session.insert("roomReplyns.insertReply", reply);
	}

	// 수정
	public void modifyReply(RoomReplyBean reply) {
		session.update("roomReplyns.modifyReply", reply);
	}

	// 삭제
	public void deleteReply(int room_reply_id) throws Exception {
		session.delete("roomReplyns.deleteReply", room_reply_id);
	}
	
}
