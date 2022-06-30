package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.model.FoodAnswerBean;

@Repository
public class FoodAnswerDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<FoodAnswerBean> getAnswerList(int food_qna_id) throws Exception {
		List<FoodAnswerBean> list = session.selectList("foodAnswerns.getAnswerList", food_qna_id);

		return list;
	}

	// 상세
	public FoodAnswerBean getAnswerDetail(int food_answer_id) throws Exception {
		return (FoodAnswerBean) session.selectOne("foodAnswerns.getAnswerDetail", food_answer_id);
	}

	// 답변 수
	public int getAnswerCount(int food_qna_id) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("foodAnswerns.getAnswerCount", food_qna_id)).intValue();

		return count;
	}

	// 작성
	@Transactional
	public void insertAnswer(FoodAnswerBean answer) throws Exception {
		session.insert("foodAnswerns.insertAnswer", answer);
	}

	// 수정
	public void modifyAnswer(FoodAnswerBean answer) {
		session.update("foodAnswerns.modifyAnswer", answer);
	}

	// 삭제
	public void deleteAnswer(int food_answer_id) throws Exception {
		session.delete("foodAnswerns.deleteAnswer", food_answer_id);
	}

}
