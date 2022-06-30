package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.PlaceDao;
import com.model.PlaceBean;
import com.model.PlaceBookmarkBean;
import com.model.PlaceFilterBean;

@Service
public class PlaceService {

	@Autowired
	private PlaceDao dao;

	// 목록
	public List<PlaceBean> getList(int page) throws Exception {
		return dao.getList(page);
	}

	// 필터
	public List<PlaceBean> getFilterList(PlaceFilterBean placeFilter) throws Exception {
		return dao.getFilterList(placeFilter);
	}

	public int getFilterCount(PlaceFilterBean placeFilter) throws Exception {
		return dao.getFilterCount(placeFilter);
	}

	// 상세
	public PlaceBean getDetail(int place_id) throws Exception {
		return dao.getDetail(place_id);
	}

	// 데이터 수
	public int getCount() throws Exception {
		return dao.getCount();
	}

	// 작성
	public void insert(PlaceBean place) throws Exception {
		dao.insert(place);
	}

	// 수정
	public void modify(PlaceBean placeBean) throws Exception {
		dao.modify(placeBean);
	}

	// 삭제
	public void delete(int place_id) throws Exception {
		dao.delete(place_id);
	}

	// 인근 장소
	public List<PlaceBean> getQueryList(String city) throws Exception {
		return dao.getQueryList(city);
	}

	// 평점 갱신
	public void updateRate(PlaceBean place) throws Exception {
		dao.updateRate(place);
	}

	// 북마크
	public int getMarkCount(PlaceBookmarkBean placemark) throws Exception {
		return dao.getMarkCount(placemark);
	}

	public void addMark(PlaceBookmarkBean placemark) throws Exception {
		dao.addMark(placemark);
	}

	public void delMark(PlaceBookmarkBean placemark) throws Exception {
		dao.delMark(placemark);
	}

}
