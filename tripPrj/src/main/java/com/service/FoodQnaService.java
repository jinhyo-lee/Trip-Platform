package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.FoodQnaDao;
import com.model.FoodQnaBean;

@Service
public class FoodQnaService {

	@Autowired
	private FoodQnaDao dao;

	// 목록
	public List<FoodQnaBean> getQnaList(int food_id) throws Exception {
		return dao.getQnaList(food_id);
	}

	// 상세
	public FoodQnaBean getQnaDetail(int food_qna_id) throws Exception {
		FoodQnaBean FoodQna = dao.getQnaDetail(food_qna_id);

		return FoodQna;
	}

	// 문의 수
	public int getQnaCount(int food_id) throws Exception {
		return dao.getQnaCount(food_id);
	}

	// 작성
	public void insertQna(FoodQnaBean foodQna) throws Exception {
		dao.insertQna(foodQna);
	}

	// 수정
	public void modifyQna(FoodQnaBean foodQna) {
		dao.modifyQna(foodQna);
	}

	// 삭제
	public void deleteQna(int food_qna_id) throws Exception {
		dao.deleteQna(food_qna_id);
	}

}
