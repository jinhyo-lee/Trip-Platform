package com.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.model.MemberBean;

@Repository
public class MypageDao {

	@Autowired
	private SqlSession session;

	// 회원정보 호출
	public MemberBean userDetail(String id) throws Exception {
		return session.selectOne("mypagens.user_detail", id);
	}

	// 회원정보 수정
	public void updateMember(MemberBean mypage) throws Exception {
		session.update("mypagens.mypage_modify", mypage);
	}

	// 회원탈퇴
	public void deleteMember(MemberBean delm) throws Exception {
		session.update("mypagens.mypage_delete", delm);
	}

}
