package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.MypageDao;
import com.model.MemberBean;

@Service
public class MypageService {

	@Autowired
	private MypageDao dao;

	public MemberBean userDetail(String id) throws Exception {
		return dao.userDetail(id);
	}

	public void updateMember(MemberBean mypage) throws Exception {
		dao.updateMember(mypage);
	}

	public void deleteMember(MemberBean delm) throws Exception {
		dao.deleteMember(delm);
	}

}
