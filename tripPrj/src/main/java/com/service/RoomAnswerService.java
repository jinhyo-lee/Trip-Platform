package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.RoomAnswerDao;
import com.model.RoomAnswerBean;

@Service
public class RoomAnswerService {

	@Autowired
	private RoomAnswerDao dao;

	// 목록
	public List<RoomAnswerBean> getAnswerList(int room_qna_id) throws Exception {
		return dao.getAnswerList(room_qna_id);
	}

	// 상세
	public RoomAnswerBean getAnswerDetail(int room_qna_id) throws Exception {
		RoomAnswerBean answer = dao.getAnswerDetail(room_qna_id);

		return answer;
	}

	// 답변 수
	public int getAnswerCount(int room_qna_id) throws Exception {
		return dao.getAnswerCount(room_qna_id);
	}

	// 작성
	public void insertAnswer(RoomAnswerBean answer) throws Exception {
		dao.insertAnswer(answer);
	}

	// 수정
	public void modifyAnswer(RoomAnswerBean answer) {
		dao.modifyAnswer(answer);
	}

	// 삭제
	public void deleteAnswer(int room_answer_id) throws Exception {
		dao.deleteAnswer(room_answer_id);
	}

}
