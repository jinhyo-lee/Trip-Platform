package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.model.PlaceAnswerBean;

@Repository
public class PlaceAnswerDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<PlaceAnswerBean> getAnswerList(int place_qna_id) throws Exception {
		List<PlaceAnswerBean> list = session.selectList("placeAnswerns.getAnswerList", place_qna_id);

		return list;
	}

	// 상세
	public PlaceAnswerBean getAnswerDetail(int place_answer_id) throws Exception {
		return (PlaceAnswerBean) session.selectOne("placeAnswerns.getAnswerDetail", place_answer_id);
	}

	// 답변 수
	public int getAnswerCount(int place_qna_id) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("placeAnswerns.getAnswerCount", place_qna_id)).intValue();

		return count;
	}

	// 작성
	@Transactional
	public void insertAnswer(PlaceAnswerBean answer) throws Exception {
		session.insert("placeAnswerns.insertAnswer", answer);
	}

	// 수정
	public void modifyAnswer(PlaceAnswerBean answer) {
		session.update("placeAnswerns.modifyAnswer", answer);
	}

	// 삭제
	public void deleteAnswer(int place_answer_id) throws Exception {
		session.delete("placeAnswerns.deleteAnswer", place_answer_id);
	}

}
