package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.PlaceDao;
import com.model.PlaceBean;

@Service
public class PlaceService {

	@Autowired
	private PlaceDao dao;

	public List<PlaceBean> getList(int page) throws Exception {
		return dao.getList(page);
	}

	public int getCount() throws Exception {
		return dao.getCount();
	}

}
