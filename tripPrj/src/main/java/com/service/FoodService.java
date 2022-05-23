package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.FoodDao;
import com.model.FoodBean;

@Service
public class FoodService {

	@Autowired
	private FoodDao dao;
	
	public List<FoodBean> getList(int page) throws Exception {
		return dao.getList(page);
	}
	
	public int getCount() throws Exception{
		return dao.getCount();
	}
	
}
