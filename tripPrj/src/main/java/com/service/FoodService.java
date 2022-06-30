package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.FoodDao;
import com.model.FoodBean;
import com.model.FoodBookmarkBean;
import com.model.FoodFilterBean;
import com.model.PlaceBean;

@Service
public class FoodService {

	@Autowired
	private FoodDao dao;

	// 목록
	public List<FoodBean> getList(int page) throws Exception {
		return dao.getList(page);
	}

	// 필터
	public List<FoodBean> getFilterList(FoodFilterBean foodFilter) throws Exception {
		return dao.getFilterList(foodFilter);
	}

	public int getFilterCount(FoodFilterBean foodFilter) throws Exception {
		return dao.getFilterCount(foodFilter);
	}

	// 상세
	public FoodBean getDetail(int food_id) throws Exception {
		return dao.getDetail(food_id);
	}

	// 데이터 수
	public int getCount() throws Exception {
		return dao.getCount();
	}

	// 작성
	public void insert(FoodBean food) throws Exception {
		dao.insert(food);
	}

	// 수정
	public void modify(FoodBean foodBean) throws Exception {
		dao.modify(foodBean);
	}

	// 삭제
	public void delete(int food_id) throws Exception {
		dao.delete(food_id);
	}

	// 인근 장소
	public List<PlaceBean> getQueryList(String city) throws Exception {
		return dao.getQueryList(city);
	}

	// 평점 갱신
	public void updateRate(FoodBean food) throws Exception {
		dao.updateRate(food);
	}

	// 북마크
	public int getMarkCount(FoodBookmarkBean foodmark) throws Exception {
		return dao.getMarkCount(foodmark);
	}

	public void addMark(FoodBookmarkBean foodmark) throws Exception {
		dao.addMark(foodmark);
	}

	public void delMark(FoodBookmarkBean foodmark) throws Exception {
		dao.delMark(foodmark);
	}

}
