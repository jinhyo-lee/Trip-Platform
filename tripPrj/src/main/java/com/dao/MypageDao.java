package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.model.FoodBookmarkBean;
import com.model.FoodQnaBean;
import com.model.FoodReviewBean;
import com.model.MemberBean;
import com.model.PlaceBookmarkBean;
import com.model.PlaceQnaBean;
import com.model.PlaceReviewBean;
import com.model.RoomBookmarkBean;
import com.model.RoomQnaBean;
import com.model.RoomReviewBean;

@Repository
public class MypageDao {

	@Autowired
	private SqlSession session;

	// 수정
	public void modify(MemberBean mypage) throws Exception {
		session.update("mypagens.modify", mypage);
	}

	// 탈퇴
	public void quit(String id) throws Exception {
		session.update("mypagens.quit", id);
	}

	// 북마크 목록
	public List<FoodBookmarkBean> getFoodmark(String id) throws Exception {
		return session.selectList("mypagens.getFoodmark", id);
	}

	public List<PlaceBookmarkBean> getPlacemark(String id) throws Exception {
		return session.selectList("mypagens.getPlacemark", id);
	}

	public List<RoomBookmarkBean> getRoommark(String id) throws Exception {
		return session.selectList("mypagens.getRoommark", id);
	}

	// 북마크 삭제
	public void deleteFoodMark(FoodBookmarkBean foodbookmark) throws Exception {
		session.delete("deleteFoodmark", foodbookmark);
	}

	public void deletePlaceMark(PlaceBookmarkBean placebookmark) throws Exception {
		session.delete("deletePlacemark", placebookmark);
	}

	public void deleteRoomMark(RoomBookmarkBean roombookmark) throws Exception {
		session.delete("deleteRoommark", roombookmark);
	}

	// 리뷰 목록
	public List<FoodReviewBean> getFoodReview(String id) throws Exception {
		return session.selectList("mypagens.getFoodreview", id);
	}

	public List<PlaceReviewBean> getPlaceReview(String id) throws Exception {
		return session.selectList("mypagens.getPlacereview", id);
	}

	public List<RoomReviewBean> getRoomReview(String id) throws Exception {
		return session.selectList("mypagens.getRoomreview", id);
	}

	// 문의 목록
	public List<FoodQnaBean> getFoodQna(String id) throws Exception {
		return session.selectList("mypagens.getFoodqna", id);
	}

	public List<PlaceQnaBean> getPlaceQna(String id) throws Exception {
		return session.selectList("mypagens.getPlaceqna", id);
	}

	public List<RoomQnaBean> getRoomQna(String id) throws Exception {
		return session.selectList("mypagens.getRoomqna", id);
	}

}
