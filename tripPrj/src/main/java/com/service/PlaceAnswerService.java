package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.PlaceAnswerDao;
import com.model.PlaceAnswerBean;

@Service
public class PlaceAnswerService {

	@Autowired
	private PlaceAnswerDao dao;

	// 목록
	public List<PlaceAnswerBean> getAnswerList(int place_qna_id) throws Exception {
		return dao.getAnswerList(place_qna_id);
	}

	// 상세
	public PlaceAnswerBean getAnswerDetail(int place_qna_id) throws Exception {
		PlaceAnswerBean answer = dao.getAnswerDetail(place_qna_id);

		return answer;
	}

	// 답변 수
	public int getAnswerCount(int place_qna_id) throws Exception {
		return dao.getAnswerCount(place_qna_id);
	}

	// 작성
	public void insertAnswer(PlaceAnswerBean answer) throws Exception {
		dao.insertAnswer(answer);
	}

	// 수정
	public void modifyAnswer(PlaceAnswerBean answer) {
		dao.modifyAnswer(answer);
	}

	// 삭제
	public void deleteAnswer(int place_answer_id) throws Exception {
		dao.deleteAnswer(place_answer_id);
	}

}
