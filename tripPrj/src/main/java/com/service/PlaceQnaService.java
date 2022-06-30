package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.PlaceQnaDao;
import com.model.PlaceQnaBean;

@Service
public class PlaceQnaService {

	@Autowired
	private PlaceQnaDao dao;

	// 목록
	public List<PlaceQnaBean> getQnaList(int place_id) throws Exception {
		return dao.getQnaList(place_id);
	}

	// 상세
	public PlaceQnaBean getQnaDetail(int place_qna_id) throws Exception {
		PlaceQnaBean PlaceQna = dao.getQnaDetail(place_qna_id);

		return PlaceQna;
	}

	// 문의 수
	public int getQnaCount(int place_id) throws Exception {
		return dao.getQnaCount(place_id);
	}

	// 작성
	public void insertQna(PlaceQnaBean placeQna) throws Exception {
		dao.insertQna(placeQna);
	}

	// 수정
	public void modifyQna(PlaceQnaBean placeQna) {
		dao.modifyQna(placeQna);
	}

	// 삭제
	public void deleteQna(int place_qna_id) throws Exception {
		dao.deleteQna(place_qna_id);
	}

}
