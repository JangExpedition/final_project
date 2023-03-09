package com.sh.j3l.member.model.service;

import java.util.List;

import com.sh.j3l.member.model.dto.Member;

public interface MemberService {

	List<Member> selectAllMember();

	Member selectOneMember(String memberId);

	int deleteMember(String id);

	List<Member> searchById(String id);


}
