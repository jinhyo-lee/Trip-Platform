package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.model.RoomBean;

@Repository
public class RoomDao {

	@Autowired
	private SqlSession session;

	public List<RoomBean> getList(int page) throws Exception {
		List<RoomBean> list = session.selectList("roomns.getList", page);

		return list;
	}

	public int getCount() throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("roomns.getCount")).intValue();

		return count;
	}
}
