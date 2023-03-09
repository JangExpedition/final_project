package com.sh.j3l.member.model.service;

import java.time.LocalDate;
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
		return memberDao.selectAllMember();
	}

	@Override
	public Member selectOneMember(String memberId) {
		return memberDao.selectOneMember(memberId);
	}

	@Override

	public int deleteMember(String id) {
		return memberDao.deleteMember(id);
	}

	@Override
	public List<Member> searchById(String id) {
		// TODO Auto-generated method stub
		return memberDao.searchById(id);
	}



	public Member duplicationCheck(Member member) {
		return memberDao.duplicationCheck(member);
	}

	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}


}
