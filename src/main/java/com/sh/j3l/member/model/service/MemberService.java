package com.sh.j3l.member.model.service;

import java.time.LocalDate;
import java.util.List;

import com.sh.j3l.member.model.dto.Member;

public interface MemberService {

	List<Member> selectAllMember();

	Member selectOneMember(String id);

	int deleteMember(String id);

	List<Member> searchById(String id);

	Member duplicationCheck(Member member);

	int insertMember(Member member);

	Member selectMemberById(String id);

	int updateMember(Member member);

	String findIdByEmail(String email);

}
