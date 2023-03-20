package com.sh.j3l.question.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.j3l.member.model.dto.Member;
import com.sh.j3l.question.model.dao.QuestionDao;
import com.sh.j3l.question.model.dto.Question;

import lombok.extern.slf4j.Slf4j;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	private QuestionDao questionDao;

	@Override
	public List<Member> selectQuestionMember() {
		return questionDao.selectQuestionMember();
	}

	@Override
	public int sendQuestion(Question question) {
		return questionDao.sendQuestion(question);
	}

	@Override
	public List<Question> selectAllQuestion() {
		return questionDao.selectAllQuestion();
	}

}