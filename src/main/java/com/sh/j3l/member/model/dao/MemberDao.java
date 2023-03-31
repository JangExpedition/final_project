package com.sh.j3l.member.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import com.sh.j3l.member.model.dto.Grade;
import com.sh.j3l.member.model.dto.Member;


@Mapper
public interface MemberDao {

	List<Member> selectAllMember();

	Member selectOneMember(String id);

	int deleteMember(String id);

	List<Member> searchById(String id);

	Member duplicationCheck(Member member);

	int insertMember(Member member);

	Member selectMemberById(String id);

	int insertAuthority(String id);

	int updateMember(Member member);

	String findIdByEmail(String email);

	@Update("update member set point = (point - #{usePoint} + #{totalPayAmount}) where id = #{id}")
	int updatePoint(@Param("id") String id, @Param("usePoint") int usePoint, @Param("totalPayAmount") int totalPayAmount);

	@Update("update member set grade = #{grade} where id = #{id}")
	int updateGrade(@Param("id") String id, @Param("grade") Grade grade);

}
