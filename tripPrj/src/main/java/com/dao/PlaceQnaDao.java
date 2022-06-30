package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.model.PlaceQnaBean;

@Repository
public class PlaceQnaDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<PlaceQnaBean> getQnaList(int place_id) throws Exception {
		List<PlaceQnaBean> list = session.selectList("placeQnans.getQnaList", place_id);

		return list;
	}

	// 상세
	public PlaceQnaBean getQnaDetail(int place_qna_id) throws Exception {
		return (PlaceQnaBean) session.selectOne("placeQnans.getQnaDetail", place_qna_id);
	}

	// 문의 수
	public int getQnaCount(int place_id) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("placeQnans.getQnaCount", place_id)).intValue();

		return count;
	}

	// 작성
	@Transactional
	public void insertQna(PlaceQnaBean placeQna) throws Exception {
		session.insert("placeQnans.insertQna", placeQna);
	}

	// 수정
	public void modifyQna(PlaceQnaBean qna) {
		session.update("placeQnans.modifyQna", qna);
	}

	// 삭제
	public void deleteQna(int place_qna_id) throws Exception {
		session.delete("placeQnans.deleteQna", place_qna_id);
	}

}
