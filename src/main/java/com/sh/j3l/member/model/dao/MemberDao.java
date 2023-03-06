package com.sh.j3l.member.model.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sh.j3l.member.model.dto.Member;


@Mapper
public interface MemberDao {

	List<Member> selectAllMember();

	Member selectOneMember(String id);

	Member duplicationCheck(Member member);

}
