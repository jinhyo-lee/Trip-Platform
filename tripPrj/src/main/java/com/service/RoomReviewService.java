package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.RoomReviewDao;
import com.model.RoomLikeBean;
import com.model.RoomReviewBean;

@Service
public class RoomReviewService {

	@Autowired
	private RoomReviewDao dao;

	// 목록
	public List<RoomReviewBean> getReviewList(int room_id) throws Exception {
		return dao.getReviewList(room_id);
	}

	// 상세
	public RoomReviewBean getReviewDetail(int room_rev_id) throws Exception {
		RoomReviewBean RoomReview = dao.getReviewDetail(room_rev_id);

		return RoomReview;
	}

	// 리뷰 수
	public int getReviewCount(int room_id) throws Exception {
		return dao.getReviewCount(room_id);
	}

	// 작성
	public void insertReview(RoomReviewBean roomReview) throws Exception {
		dao.insertReview(roomReview);
	}

	// 수정
	public void modifyReview(RoomReviewBean RoomReview) {
		dao.modifyReview(RoomReview);
	}

	// 삭제
	public void deleteReview(int room_rev_id) throws Exception {
		dao.deleteReview(room_rev_id);
	}

	// 평점
	public double getAvgRate(int room_id) throws Exception {
		return dao.getAvgRate(room_id);
	}

	// 좋아요
	public int getLikeTotal(int room_rev_id) throws Exception {
		return dao.getLikeTotal(room_rev_id);
	}

	public int getLikeCount(RoomLikeBean roomlike) throws Exception {
		return dao.getLikeCount(roomlike);
	}

	public void addLike(RoomLikeBean roomlike) throws Exception {
		dao.addLike(roomlike);
	}

	public void delLike(RoomLikeBean roomlike) throws Exception {
		dao.delLike(roomlike);
	}

}
