package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.model.FoodBean;
import com.model.FoodBookmarkBean;
import com.model.FoodFilterBean;
import com.model.PlaceBean;

@Repository
public class FoodDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<FoodBean> getList(int page) throws Exception {
		List<FoodBean> list = session.selectList("foodns.getList", page);

		return list;
	}

	// 필터
	public List<FoodBean> getFilterList(FoodFilterBean foodFilter) throws Exception {
		List<FoodBean> list = session.selectList("foodns.getFilterList", foodFilter);

		return list;
	}

	public int getFilterCount(FoodFilterBean foodFilter) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("foodns.getFilterCount", foodFilter)).intValue();

		return count;
	}

	// 상세
	public FoodBean getDetail(int food_id) throws Exception {
		return session.selectOne("foodns.getDetail", food_id);
	}

	// 데이터 수
	public int getCount() throws Exception {
		int count = 0;
		count = session.selectOne("foodns.getCount");

		return count;
	}

	// 작성
	public void insert(FoodBean food) throws Exception {
		session.insert("foodns.insert", food);
	}

	// 수정
	public void modify(FoodBean foodBean) throws Exception {
		session.update("foodns.modify", foodBean);
	}

	// 삭제
	public void delete(int food_id) throws Exception {
		session.delete("foodns.delete", food_id);
	}

	// 인근 장소
	public List<PlaceBean> getQueryList(String city) throws Exception {
		List<PlaceBean> querylist = session.selectList("foodns.getQueryList", city);

		return querylist;
	}

	// 평점 갱신
	public void updateRate(FoodBean food) throws Exception {
		session.update("foodns.updateRate", food);
	}

	// 북마크
	public int getMarkCount(FoodBookmarkBean foodmark) throws Exception {
		int count = session.selectOne("foodns.getMarkCount", foodmark);

		return count;
	}

	public void addMark(FoodBookmarkBean foodmark) throws Exception {
		session.insert("foodns.addMark", foodmark);
	}

	public void delMark(FoodBookmarkBean foodmark) throws Exception {
		session.delete("foodns.delMark", foodmark);
	}

}
