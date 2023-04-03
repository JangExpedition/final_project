package com.sh.j3l.member.model.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sh.j3l.member.model.dto.Member;


@Mapper
public interface MemberDao {

	List<Member> selectAllMember();

	Member selectOneMember(String id);

	int deleteMember(String id);

	List<Member> searchById(String keyword);
	
	List<Member> searchByPhone(String keyword);
	
	List<Member> searchByName(String keyword);

	Member duplicationCheck(Member member);

	int insertMember(Member member);

	Member selectMemberById(String id);

	int insertAuthority(String id);

	int updateMember(Member member);

	String findIdByEmail(String email);

	
}


