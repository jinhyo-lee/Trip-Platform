package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.model.PlaceLikeBean;
import com.model.PlaceReviewBean;

@Repository
public class PlaceReviewDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<PlaceReviewBean> getReviewList(int place_id) throws Exception {
		List<PlaceReviewBean> list = session.selectList("placeReviewns.getReviewList", place_id);

		return list;
	}

	// 상세
	public PlaceReviewBean getReviewDetail(int place_rev_id) throws Exception {
		return (PlaceReviewBean) session.selectOne("placeReviewns.getReviewDetail", place_rev_id);
	}

	// 리뷰 수
	public int getReviewCount(int place_id) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("placeReviewns.getReviewCount", place_id)).intValue();

		return count;
	}

	// 작성
	@Transactional
	public void insertReview(PlaceReviewBean fr) throws Exception {
		session.insert("placeReviewns.insertReview", fr);
	}

	// 수정
	public void modifyReview(PlaceReviewBean review) {
		session.update("placeReviewns.modifyReview", review);
	}

	// 삭제
	public void deleteReview(int place_rev_id) throws Exception {
		session.delete("placeReviewns.deleteReview", place_rev_id);
	}

	// 평점
	public double getAvgRate(int place_id) throws Exception {
		double avgRate = 0;
		avgRate = session.selectOne("placeReviewns.getAvgRate", place_id);

		return avgRate;
	}

	// 좋아요
	public int getLikeTotal(int place_rev_id) throws Exception {
		int count = session.selectOne("placeReviewns.getLikeTotal", place_rev_id);

		return count;
	}

	public int getLikeCount(PlaceLikeBean placelike) throws Exception {
		int count = session.selectOne("placeReviewns.getLikeCount", placelike);

		return count;
	}

	public void addLike(PlaceLikeBean placelike) throws Exception {
		session.insert("placeReviewns.addLike", placelike);
	}

	public void delLike(PlaceLikeBean placelike) throws Exception {
		session.delete("placeReviewns.delLike", placelike);
	}

}
