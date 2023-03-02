package com.sh.j3l.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.j3l.member.model.dao.MemberDao;
import com.sh.j3l.member.model.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public List<Member> selectAllMember() {
		// TODO Auto-generated method stub
		return memberDao.selectAllMember();
	}


	
	



}
