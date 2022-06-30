package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.model.PlaceBean;
import com.model.PlaceBookmarkBean;
import com.model.PlaceFilterBean;

@Repository
public class PlaceDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<PlaceBean> getList(int page) throws Exception {
		List<PlaceBean> list = session.selectList("placens.getList", page);

		return list;
	}

	// 필터
	public List<PlaceBean> getFilterList(PlaceFilterBean placeFilter) throws Exception {
		List<PlaceBean> list = session.selectList("placens.getFilterList", placeFilter);

		return list;
	}

	public int getFilterCount(PlaceFilterBean placeFilter) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("placens.getFilterCount", placeFilter)).intValue();

		return count;
	}

	// 상세
	public PlaceBean getDetail(int place_id) throws Exception {
		return session.selectOne("placens.getDetail", place_id);
	}

	// 데이터 수
	public int getCount() throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("placens.getCount")).intValue();

		return count;
	}

	// 작성
	public void insert(PlaceBean place) throws Exception {
		session.insert("placens.insert", place);
	}

	// 수정
	public void modify(PlaceBean placeBean) throws Exception {
		session.update("placens.modify", placeBean);
	}

	// 삭제
	public void delete(int place_id) throws Exception {
		session.delete("placens.delete", place_id);
	}

	// 인근 장소
	public List<PlaceBean> getQueryList(String city) throws Exception {
		List<PlaceBean> querylist = session.selectList("placens.getQueryList", city);

		return querylist;
	}

	// 평점 갱신
	public void updateRate(PlaceBean place) throws Exception {
		session.update("placens.updateRate", place);
	}

	// 북마크
	public int getMarkCount(PlaceBookmarkBean placemark) throws Exception {
		int count = session.selectOne("placens.getMarkCount", placemark);

		return count;
	}

	public void addMark(PlaceBookmarkBean placemark) throws Exception {
		session.insert("placens.addMark", placemark);
	}

	public void delMark(PlaceBookmarkBean placemark) throws Exception {
		session.delete("placens.delMark", placemark);
	}

}
