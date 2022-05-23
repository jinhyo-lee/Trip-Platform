package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.model.PlaceBean;

@Repository
public class PlaceDao {

	@Autowired
	private SqlSession session;

	public List<PlaceBean> getList(int page) throws Exception {
		List<PlaceBean> list = session.selectList("placens.getList", page);

		return list;
	}

	public int getCount() throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("placens.getCount")).intValue();

		return count;
	}

}
