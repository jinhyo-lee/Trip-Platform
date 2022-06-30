package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.FoodAnswerDao;
import com.model.FoodAnswerBean;

@Service
public class FoodAnswerService {

	@Autowired
	private FoodAnswerDao dao;

	// 목록
	public List<FoodAnswerBean> getAnswerList(int food_qna_id) throws Exception {
		return dao.getAnswerList(food_qna_id);
	}

	// 상세
	public FoodAnswerBean getAnswerDetail(int food_qna_id) throws Exception {
		FoodAnswerBean answer = dao.getAnswerDetail(food_qna_id);

		return answer;
	}

	// 답변 수
	public int getAnswerCount(int food_qna_id) throws Exception {
		return dao.getAnswerCount(food_qna_id);
	}

	// 작성
	public void insertAnswer(FoodAnswerBean answer) throws Exception {
		dao.insertAnswer(answer);
	}

	// 수정
	public void modifyAnswer(FoodAnswerBean answer) {
		dao.modifyAnswer(answer);
	}

	// 삭제
	public void deleteAnswer(int food_answer_id) throws Exception {
		dao.deleteAnswer(food_answer_id);
	}

}
