package com.sh.j3l.member.model.service;

import java.time.LocalDate;
import java.util.List;

import com.sh.j3l.member.model.dto.Member;

public interface MemberService {

	List<Member> selectAllMember();
	
	Member selectOneMember(String id);

	int deleteMember(String id);
	
	List<Member> searchById(String keyword);
	
	List<Member> searchByName(String keyword);
	
	List<Member> searchByPhone(String keyword);

	Member duplicationCheck(Member member);

	int insertMember(Member member);

	Member selectMemberById(String id);

	int updateMember(Member member);

	String findIdByEmail(String email);

	List<Member> pagingAllMember(int page, int pageSize);

	int totalPageCount(int pageSize);



}
