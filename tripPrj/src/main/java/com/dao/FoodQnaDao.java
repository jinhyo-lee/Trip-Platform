package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.model.FoodQnaBean;

@Repository
public class FoodQnaDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<FoodQnaBean> getQnaList(int food_id) throws Exception {
		List<FoodQnaBean> list = session.selectList("foodQnans.getQnaList", food_id);
		
		return list;
	}

	// 상세
	public FoodQnaBean getQnaDetail(int food_qna_id) throws Exception {
		return (FoodQnaBean) session.selectOne("foodQnans.getQnaDetail", food_qna_id);
	}

	// 문의 수
	public int getQnaCount(int food_id) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("foodQnans.getQnaCount", food_id)).intValue();
		
		return count;
	}

	// 작성
	@Transactional
	public void insertQna(FoodQnaBean foodQna) throws Exception {
		session.insert("foodQnans.insertQna", foodQna);
	}

	// 수정
	public void modifyQna(FoodQnaBean qna) {
		session.update("foodQnans.modifyQna", qna);
	}

	// 삭제
	public void deleteQna(int food_qna_id) throws Exception {
		session.delete("foodQnans.deleteQna", food_qna_id);
	}

}
