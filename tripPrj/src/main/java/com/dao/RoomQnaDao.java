package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.model.RoomQnaBean;

@Repository
public class RoomQnaDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<RoomQnaBean> getQnaList(int room_id) throws Exception {
		List<RoomQnaBean> list = session.selectList("roomQnans.getQnaList", room_id);
		
		return list;
	}

	// 상세
	public RoomQnaBean getQnaDetail(int room_qna_id) throws Exception {
		return (RoomQnaBean) session.selectOne("roomQnans.getQnaDetail", room_qna_id);
	}

	// 문의 수
	public int getQnaCount(int room_id) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("roomQnans.getQnaCount", room_id)).intValue();
		
		return count;
	}

	// 작성
	@Transactional
	public void insertQna(RoomQnaBean roomQna) throws Exception {
		session.insert("roomQnans.insertQna", roomQna);
	}

	// 수정
	public void modifyQna(RoomQnaBean qna) {
		session.update("roomQnans.modifyQna", qna);
	}

	// 삭제
	public void deleteQna(int room_qna_id) throws Exception {
		session.delete("roomQnans.deleteQna", room_qna_id);
	}

}
