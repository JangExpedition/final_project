package com.sh.j3l.question.model.service;

import java.util.List;

import com.sh.j3l.member.model.dto.Member;
import com.sh.j3l.question.model.dto.Question;

public interface QuestionService {

	List<Member> selectQuestionMember();

	int sendQuestion(Question question);

	List<Question> selectAllQuestion();

	Question selectOneQuestion(Integer no);

	Question QuestionDetailsByName(String name);

	List<Question> searchByName(String name);

	int deleteQuestion(int no);


}
