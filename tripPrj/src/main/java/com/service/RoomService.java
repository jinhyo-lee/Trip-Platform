package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.RoomDao;
import com.model.RoomBean;

@Service
public class RoomService {
	
	@Autowired
	private RoomDao dao;
	
	public List<RoomBean> getList(int page) throws Exception {
		return dao.getList(page);
	}
	
	public int getCount() throws Exception{
		return dao.getCount();
	}
	
}
