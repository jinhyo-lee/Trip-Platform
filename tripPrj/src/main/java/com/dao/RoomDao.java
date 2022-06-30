package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.model.PlaceBean;
import com.model.RoomBean;
import com.model.RoomBookmarkBean;
import com.model.RoomFilterBean;

@Repository
public class RoomDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<RoomBean> getList(int page) throws Exception {
		List<RoomBean> list = session.selectList("roomns.getList", page);

		return list;
	}

	// 필터
	public List<RoomBean> getFilterList(RoomFilterBean roomFilter) throws Exception {
		List<RoomBean> list = session.selectList("roomns.getFilterList", roomFilter);

		return list;
	}

	public int getFilterCount(RoomFilterBean roomFilter) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("roomns.getFilterCount", roomFilter)).intValue();

		return count;
	}

	// 상세
	public RoomBean getDetail(int room_id) throws Exception {
		return session.selectOne("roomns.getDetail", room_id);
	}

	// 데이터 수
	public int getCount() throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("roomns.getCount")).intValue();

		return count;
	}

	// 작성
	public void insert(RoomBean room) throws Exception {
		session.insert("roomns.insert", room);
	}

	// 수정
	public void modify(RoomBean roomBean) throws Exception {
		session.update("roomns.modify", roomBean);
	}

	// 삭제
	public void delete(int room_id) throws Exception {
		session.delete("roomns.delete", room_id);
	}

	// 인근 장소
	public List<PlaceBean> getQueryList(String city) throws Exception {
		List<PlaceBean> querylist = session.selectList("roomns.getQueryList", city);

		return querylist;
	}

	// 평점 갱신
	public void updateRate(RoomBean room) throws Exception {
		session.update("roomns.updateRate", room);
	}

	// 북마크
	public int getMarkCount(RoomBookmarkBean roommark) throws Exception {
		int count = session.selectOne("roomns.getMarkCount", roommark);

		return count;
	}

	public void addMark(RoomBookmarkBean roommark) throws Exception {
		session.insert("roomns.addMark", roommark);
	}

	public void delMark(RoomBookmarkBean roommark) throws Exception {
		session.delete("roomns.delMark", roommark);
	}

}
