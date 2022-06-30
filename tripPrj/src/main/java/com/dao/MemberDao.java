package com.dao;

import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.model.MemberBean;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession sqlSession;

	// 회원 정보
	public MemberBean getMember(String id) throws Exception {
		return (MemberBean) sqlSession.selectOne("memberns.getMember", id);
	}

	// 비밀번호 검색
	public MemberBean pwFind(MemberBean pm) throws Exception {
		return (MemberBean) sqlSession.selectOne("memberns.pwFind", pm);
	}

	// 회원 가입
	public void joinMember(MemberBean m) throws Exception {
		sqlSession.insert("memberns.join", m);
	}

	// 아이디 중복 검사
	public int checkMemberId(String id) throws Exception {
		int chk = -1;
		MemberBean member = sqlSession.selectOne("memberns.getMember", id);
		if (member != null)
			chk = 1;

		return chk;
	}

	// 카카오 정보 확인
	public MemberBean findkakao(HashMap<String, Object> userInfo) {
		return sqlSession.selectOne("memberns.findKakao", userInfo);
	}

	// 카카오 정보 저장
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		sqlSession.insert("memberns.kakaoInsert", userInfo);
	}

}
