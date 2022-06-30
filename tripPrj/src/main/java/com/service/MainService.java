package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.MainDao;
import com.model.FoodBean;
import com.model.PlaceBean;
import com.model.RoomBean;
import com.model.SearchBean;

@Service
public class MainService {

	@Autowired
	private MainDao dao;

	// 목록
	public List<PlaceBean> getPlaceList() throws Exception {
		return dao.getPlaceList();
	}

	public List<FoodBean> getFoodList() throws Exception {
		return dao.getFoodList();
	}

	public List<RoomBean> getRoomList() throws Exception {
		return dao.getRoomList();
	}

	// 통합 검색
	public List<PlaceBean> getSearchList(SearchBean search) throws Exception {
		return dao.getSearchList(search);
	}

	public int getSearchCount(SearchBean search) throws Exception {
		return dao.getSearchCount(search);
	}

}
