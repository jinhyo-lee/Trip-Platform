package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.model.FoodBean;

@Repository
public class FoodDao {

	@Autowired
	private SqlSession session;

	public List<FoodBean> getList(int page) throws Exception {
		List<FoodBean> list = session.selectList("foodns.getList", page);

		return list;
	}

	public int getCount() throws Exception {
		int count = 0;
		count = session.selectOne("foodns.getCount");

		return count;
	}

}
