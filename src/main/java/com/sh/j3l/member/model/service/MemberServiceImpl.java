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
	public Member selectOneMember(String id) {
		return memberDao.selectOneMember(id);
	}

	@Override
	public int deleteMember(String id) {
		return memberDao.deleteMember(id);
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
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}

	@Override
	public String findIdByEmail(String email) {
		return memberDao.findIdByEmail(email);
	}

	@Override
	public List<Member> searchByName(String keyword) {
		return memberDao.searchByName(keyword);
	}

	@Override
	public List<Member> searchByPhone(String keyword) {
		return memberDao.searchByPhone(keyword);
	}

	@Override
	public List<Member> searchById(String keyword) {
		return memberDao.searchById(keyword);
	}

	@Override
	public List<Member> pagingAllMember(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		return memberDao.pagingAllMember(offset, pageSize);
	}

	@Override
	public int totalPageCount(int pageSize) {
		int totalCount = memberDao.count();
		int pageCount = totalCount / pageSize;
		if(totalCount % pageSize > 0) {
			pageCount++;
		}
		return pageCount;
	}


}
