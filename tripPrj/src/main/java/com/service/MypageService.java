package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.MypageDao;
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

@Service
public class MypageService {

	@Autowired
	private MypageDao dao;

	// 수정
	public void modify(MemberBean mypage) throws Exception {
		dao.modify(mypage);
	}

	// 탈퇴
	public void quit(String id) throws Exception {
		dao.quit(id);
	}

	// 북마크 목록
	public List<FoodBookmarkBean> getFoodmark(String id) throws Exception {
		return dao.getFoodmark(id);
	}

	public List<PlaceBookmarkBean> getPlacemark(String id) throws Exception {
		return dao.getPlacemark(id);
	}

	public List<RoomBookmarkBean> getRoommark(String id) throws Exception {
		return dao.getRoommark(id);
	}

	// 북마크 삭제
	public void deleteFoodMark(FoodBookmarkBean foodbookmark) throws Exception {
		dao.deleteFoodMark(foodbookmark);
	}

	public void deletePlaceMark(PlaceBookmarkBean placebookmark) throws Exception {
		dao.deletePlaceMark(placebookmark);
	}

	public void deleteRoomMark(RoomBookmarkBean roombookmark) throws Exception {
		dao.deleteRoomMark(roombookmark);
	}

	// 리뷰 목록
	public List<FoodReviewBean> getFoodReview(String id) throws Exception {
		return dao.getFoodReview(id);
	}

	public List<PlaceReviewBean> getPlaceReview(String id) throws Exception {
		return dao.getPlaceReview(id);
	}

	public List<RoomReviewBean> getRoomReview(String id) throws Exception {
		return dao.getRoomReview(id);
	}

	// 문의 목록
	public List<FoodQnaBean> getFoodQna(String id) throws Exception {
		return dao.getFoodQna(id);
	}

	public List<PlaceQnaBean> getPlaceQna(String id) throws Exception {
		return dao.getPlaceQna(id);
	}

	public List<RoomQnaBean> getRoomQna(String id) throws Exception {
		return dao.getRoomQna(id);
	}

}
