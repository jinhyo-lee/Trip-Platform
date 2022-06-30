package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.RoomQnaDao;
import com.model.RoomQnaBean;

@Service
public class RoomQnaService {

	@Autowired
	private RoomQnaDao dao;

	// 목록
	public List<RoomQnaBean> getQnaList(int room_id) throws Exception {
		return dao.getQnaList(room_id);
	}

	// 상세
	public RoomQnaBean getQnaDetail(int room_qna_id) throws Exception {
		RoomQnaBean RoomQna = dao.getQnaDetail(room_qna_id);

		return RoomQna;
	}

	// 문의 수
	public int getQnaCount(int room_id) throws Exception {
		return dao.getQnaCount(room_id);
	}

	// 작성
	public void insertQna(RoomQnaBean roomQna) throws Exception {
		dao.insertQna(roomQna);
	}

	// 수정
	public void modifyQna(RoomQnaBean roomQna) {
		dao.modifyQna(roomQna);
	}

	// 삭제
	public void deleteQna(int room_qna_id) throws Exception {
		dao.deleteQna(room_qna_id);
	}

}
