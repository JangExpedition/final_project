package com.sh.j3l.questionAnswer.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.questionAnswer.model.dao.QuestionAnswerDao;
import com.sh.j3l.questionAnswer.model.dto.QuestionAnswer;

@Service
public class QuestionAnswerServiceImpl implements QuestionAnswerService{
	
	@Autowired
	private QuestionAnswerDao questionAnswerDao;

	@Override
	public int insertQuestionAnswer(QuestionAnswer questionAnswer) {
		return questionAnswerDao.insertQuestionAnswer(questionAnswer);
	}

	@Override
	public QuestionAnswer selectOneQuestionAnswer(int no) {
		return questionAnswerDao.selectOneQuestionAnswer(no);
	}

}
