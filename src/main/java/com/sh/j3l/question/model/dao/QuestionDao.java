package com.sh.j3l.question.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sh.j3l.member.model.dto.Member;
import com.sh.j3l.question.model.dto.Question;

@Mapper
public interface QuestionDao {

	List<Member> selectQuestionMember();

	int sendQuestion(Question question);

	List<Question> selectAllQuestion();

	Question selectOneQuestion(Integer no);

	Question QuestionDetailsByName(String name);

	List<Question> searchByName(String name);

	int deleteQuestion(int no);

	List<Question> cinemaQues();

	List<Question> pagingAllQuestion(@Param("offset") int offset, @Param("pageSize") int pageSize);

	int count();

}
