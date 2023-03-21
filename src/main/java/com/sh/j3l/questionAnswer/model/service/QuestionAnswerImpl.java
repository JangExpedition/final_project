package com.sh.j3l.questionAnswer.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.j3l.questionAnswer.model.dao.QuestionAnswerDao;

@Service
public class QuestionAnswerImpl {
	
	@Autowired
	private QuestionAnswerDao questionAnswerDao;

}
