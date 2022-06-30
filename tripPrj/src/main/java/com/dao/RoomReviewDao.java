package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.model.RoomLikeBean;
import com.model.RoomReviewBean;

@Repository
public class RoomReviewDao {

	@Autowired
	private SqlSession session;

	// 목록
	public List<RoomReviewBean> getReviewList(int room_id) throws Exception {
		List<RoomReviewBean> list = session.selectList("roomReviewns.getReviewList", room_id);

		return list;
	}

	// 상세
	public RoomReviewBean getReviewDetail(int room_rev_id) throws Exception {
		return (RoomReviewBean) session.selectOne("roomReviewns.getReviewDetail", room_rev_id);
	}

	// 리뷰 수
	public int getReviewCount(int room_id) throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("roomReviewns.getReviewCount", room_id)).intValue();

		return count;
	}

	// 작성
	@Transactional
	public void insertReview(RoomReviewBean fr) throws Exception {
		session.insert("roomReviewns.insertReview", fr);
	}

	// 수정
	public void modifyReview(RoomReviewBean review) {
		session.update("roomReviewns.modifyReview", review);
	}

	// 삭제
	public void deleteReview(int room_rev_id) throws Exception {
		session.delete("roomReviewns.deleteReview", room_rev_id);
	}

	// 평점
	public double getAvgRate(int room_id) throws Exception {
		double avgRate = 0;
		avgRate = session.selectOne("roomReviewns.getAvgRate", room_id);

		return avgRate;
	}

	// 좋아요
	public int getLikeTotal(int room_rev_id) throws Exception {
		int count = session.selectOne("roomReviewns.getLikeTotal", room_rev_id);

		return count;
	}

	public int getLikeCount(RoomLikeBean roomlike) throws Exception {
		int count = session.selectOne("roomReviewns.getLikeCount", roomlike);

		return count;
	}

	public void addLike(RoomLikeBean roomlike) throws Exception {
		session.insert("roomReviewns.addLike", roomlike);
	}

	public void delLike(RoomLikeBean roomlike) throws Exception {
		session.delete("roomReviewns.delLike", roomlike);
	}

}
