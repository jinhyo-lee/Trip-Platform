package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.FoodReviewDao;
import com.model.FoodLikeBean;
import com.model.FoodReviewBean;

@Service
public class FoodReviewService {

	@Autowired
	private FoodReviewDao dao;

	// 목록
	public List<FoodReviewBean> getReviewList(int food_id) throws Exception {
		return dao.getReviewList(food_id);
	}

	// 상세
	public FoodReviewBean getReviewDetail(int food_rev_id) throws Exception {
		FoodReviewBean FoodReview = dao.getReviewDetail(food_rev_id);

		return FoodReview;
	}

	// 리뷰 수
	public int getReviewCount(int food_id) throws Exception {
		return dao.getReviewCount(food_id);
	}

	// 작성
	public void insertReview(FoodReviewBean foodReview) throws Exception {
		dao.insertReview(foodReview);
	}

	// 수정
	public void modifyReview(FoodReviewBean FoodReview) {
		dao.modifyReview(FoodReview);
	}

	// 삭제
	public void deleteReview(int food_rev_id) throws Exception {
		dao.deleteReview(food_rev_id);
	}

	// 평점
	public double getAvgRate(int food_id) throws Exception {
		return dao.getAvgRate(food_id);
	}

	// 좋아요
	public int getLikeTotal(int food_rev_id) throws Exception {
		return dao.getLikeTotal(food_rev_id);
	}

	public int getLikeCount(FoodLikeBean foodlike) throws Exception {
		return dao.getLikeCount(foodlike);
	}

	public void addLike(FoodLikeBean foodlike) throws Exception {
		dao.addLike(foodlike);
	}

	public void delLike(FoodLikeBean foodlike) throws Exception {
		dao.delLike(foodlike);
	}

}
