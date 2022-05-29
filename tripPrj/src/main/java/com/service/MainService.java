package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.MainDao;
import com.model.FoodBean;
import com.model.MemberBean;
import com.model.PlaceBean;
import com.model.RoomBean;

@Service
public class MainService {

	@Autowired
	private MainDao dao;
	
	public MemberBean getMember(String id) throws Exception {
		return dao.getMember(id);
	}

	public List<PlaceBean> getPlaceList() throws Exception {
		return dao.getPlaceList();
	}
	
	public List<FoodBean> getFoodList() throws Exception {
		return dao.getFoodList();
	}

	public List<RoomBean> getRoomList() throws Exception {
		return dao.getRoomList();
	}

}
