package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.RoomDao;
import com.model.PlaceBean;
import com.model.RoomBean;
import com.model.RoomBookmarkBean;
import com.model.RoomFilterBean;

@Service
public class RoomService {

	@Autowired
	private RoomDao dao;

	// 목록
	public List<RoomBean> getList(int page) throws Exception {
		return dao.getList(page);
	}

	// 필터
	public List<RoomBean> getFilterList(RoomFilterBean roomFilter) throws Exception {
		return dao.getFilterList(roomFilter);
	}

	public int getFilterCount(RoomFilterBean roomFilter) throws Exception {
		return dao.getFilterCount(roomFilter);
	}

	// 상세
	public RoomBean getDetail(int room_id) throws Exception {
		return dao.getDetail(room_id);
	}

	// 데이터 수
	public int getCount() throws Exception {
		return dao.getCount();
	}

	// 작성
	public void insert(RoomBean room) throws Exception {
		dao.insert(room);
	}

	// 수정
	public void modify(RoomBean roomBean) throws Exception {
		dao.modify(roomBean);
	}

	// 삭제
	public void delete(int room_id) throws Exception {
		dao.delete(room_id);
	}

	// 인근 장소
	public List<PlaceBean> getQueryList(String city) throws Exception {
		return dao.getQueryList(city);
	}

	// 평점 갱신
	public void updateRate(RoomBean room) throws Exception {
		dao.updateRate(room);
	}

	// 북마크
	public int getMarkCount(RoomBookmarkBean roommark) throws Exception {
		return dao.getMarkCount(roommark);
	}

	public void addMark(RoomBookmarkBean roommark) throws Exception {
		dao.addMark(roommark);
	}

	public void delMark(RoomBookmarkBean roommark) throws Exception {
		dao.delMark(roommark);
	}

}
