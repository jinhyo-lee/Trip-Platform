package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.PlaceReviewDao;
import com.model.PlaceLikeBean;
import com.model.PlaceReviewBean;

@Service
public class PlaceReviewService {

	@Autowired
	private PlaceReviewDao dao;

	// 목록
	public List<PlaceReviewBean> getReviewList(int place_id) throws Exception {
		return dao.getReviewList(place_id);
	}

	// 상세
	public PlaceReviewBean getReviewDetail(int place_rev_id) throws Exception {
		PlaceReviewBean PlaceReview = dao.getReviewDetail(place_rev_id);

		return PlaceReview;
	}

	// 리뷰 수
	public int getReviewCount(int place_id) throws Exception {
		return dao.getReviewCount(place_id);
	}

	// 작성
	public void insertReview(PlaceReviewBean placeReview) throws Exception {
		dao.insertReview(placeReview);
	}

	// 수정
	public void modifyReview(PlaceReviewBean PlaceReview) {
		dao.modifyReview(PlaceReview);
	}

	// 삭제
	public void deleteReview(int place_rev_id) throws Exception {
		dao.deleteReview(place_rev_id);
	}

	// 평점
	public double getAvgRate(int place_id) throws Exception {
		return dao.getAvgRate(place_id);
	}

	// 좋아요
	public int getLikeTotal(int place_rev_id) throws Exception {
		return dao.getLikeTotal(place_rev_id);
	}

	public int getLikeCount(PlaceLikeBean placelike) throws Exception {
		return dao.getLikeCount(placelike);
	}

	public void addLike(PlaceLikeBean placelike) throws Exception {
		dao.addLike(placelike);
	}

	public void delLike(PlaceLikeBean placelike) throws Exception {
		dao.delLike(placelike);
	}
	
}
