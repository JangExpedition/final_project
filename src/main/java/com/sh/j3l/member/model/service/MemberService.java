package com.sh.j3l.member.model.service;

import java.time.LocalDate;
import java.util.List;

import com.sh.j3l.member.model.dto.Member;

public interface MemberService {

	List<Member> selectAllMember();

	Member selectOneMember(String memberId);

	Member duplicationCheck(Member member);

}
