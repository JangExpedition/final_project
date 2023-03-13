package com.sh.j3l.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.member.model.dao.MemberDao;
import com.sh.j3l.member.model.dto.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
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
		return memberDao.searchById(id);
	}

	public Member duplicationCheck(Member member) {
		return memberDao.duplicationCheck(member);
	}

	@Override
	public int insertMember(Member member) {
		int result = memberDao.insertMember(member);
		log.debug("id = {}", member.getId());
		return memberDao.insertAuthority(member.getId());
	}

	@Override
	public Member selectMemberById(String id) {
		return memberDao.selectMemberById(id);
	}

	@Override
	public int updateEmail(String id, String email) {
		return memberDao.updateEmail(id, email);
	}


}
