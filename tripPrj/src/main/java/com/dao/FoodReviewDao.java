package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.model.FoodLikeBean;
import com.model.FoodReviewBean;

@Repository
public class FoodReviewDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<FoodReviewBean> getReviewList(int food_id) throws Exception {
		List<FoodReviewBean> list = session.selectList("foodReviewns.getReviewList", food_id);

		return list;
	}

	// 상세
	public FoodReviewBean getReviewDetail(int food_rev_id) throws Exception {
		return (FoodReviewBean) session.selectOne("foodReviewns.getReviewDetail", food_rev_id);
	}

	// 리뷰 수
	public int getReviewCount(int food_id) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("foodReviewns.getReviewCount", food_id)).intValue();

		return count;
	}

	// 작성
	@Transactional
	public void insertReview(FoodReviewBean fr) throws Exception {
		session.insert("foodReviewns.insertReview", fr);
	}

	// 수정
	public void modifyReview(FoodReviewBean review) {
		session.update("foodReviewns.modifyReview", review);
	}

	// 삭제
	public void deleteReview(int food_rev_id) throws Exception {
		session.delete("foodReviewns.deleteReview", food_rev_id);
	}

	// 평점
	public double getAvgRate(int food_id) throws Exception {
		double avgRate = 0;
		avgRate = session.selectOne("foodReviewns.getAvgRate", food_id);

		return avgRate;
	}

	// 좋아요
	public int getLikeTotal(int food_rev_id) throws Exception {
		int count = session.selectOne("foodReviewns.getLikeTotal", food_rev_id);

		return count;
	}

	public int getLikeCount(FoodLikeBean foodlike) throws Exception {
		int count = session.selectOne("foodReviewns.getLikeCount", foodlike);

		return count;
	}

	public void addLike(FoodLikeBean foodlike) throws Exception {
		session.insert("foodReviewns.addLike", foodlike);
	}

	public void delLike(FoodLikeBean foodlike) throws Exception {
		session.delete("foodReviewns.delLike", foodlike);
	}

}
