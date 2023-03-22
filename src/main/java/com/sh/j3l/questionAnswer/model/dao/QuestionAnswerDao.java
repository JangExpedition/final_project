package com.sh.j3l.questionAnswer.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.sh.j3l.questionAnswer.model.dto.QuestionAnswer;

@Mapper
public interface QuestionAnswerDao {

	int insertQuestionAnswer(QuestionAnswer questionAnswer);

	QuestionAnswer selectOneQuestionAnswer(int no);

}
