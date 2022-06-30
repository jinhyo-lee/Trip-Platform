package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.model.RoomAnswerBean;

@Repository
public class RoomAnswerDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<RoomAnswerBean> getAnswerList(int room_qna_id) throws Exception {
		List<RoomAnswerBean> list = session.selectList("roomAnswerns.getAnswerList", room_qna_id);

		return list;
	}

	// 상세
	public RoomAnswerBean getAnswerDetail(int room_answer_id) throws Exception {
		return (RoomAnswerBean) session.selectOne("roomAnswerns.getAnswerDetail", room_answer_id);
	}

	// 답변 수
	public int getAnswerCount(int room_qna_id) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("roomAnswerns.getAnswerCount", room_qna_id)).intValue();

		return count;
	}

	// 작성
	@Transactional
	public void insertAnswer(RoomAnswerBean answer) throws Exception {
		session.insert("roomAnswerns.insertAnswer", answer);
	}

	// 수정
	public void modifyAnswer(RoomAnswerBean answer) {
		session.update("roomAnswerns.modifyAnswer", answer);
	}

	// 삭제
	public void deleteAnswer(int room_answer_id) throws Exception {
		session.delete("roomAnswerns.deleteAnswer", room_answer_id);
	}

}
