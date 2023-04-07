package com.sh.j3l.question.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.j3l.member.model.dto.Member;
import com.sh.j3l.movie.model.dao.MovieDao;
import com.sh.j3l.question.model.dao.QuestionDao;
import com.sh.j3l.question.model.dto.Question;

import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.q;

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

	@Override
	public Question selectOneQuestion(Integer no) {
		return questionDao.selectOneQuestion(no);
	}

	@Override
	public Question QuestionDetailsByName(String name) {
		return questionDao.QuestionDetailsByName(name);
	}

	@Override
	public List<Question> searchByName(String name) {
		return questionDao.searchByName(name);
	}

	@Override
	public int deleteQuestion(int no) {
		return questionDao.deleteQuestion(no);
	}

	@Override
	public List<Question> cinemaQues() {
		return questionDao.cinemaQues();
	}

	@Override
	public List<Question> pagingAllQuestion(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		return questionDao.pagingAllQuestion(offset, pageSize);
	}

	@Override
	public int totalPageCount(int pageSize) {
		int totalCount = questionDao.count();
		int pageCount = totalCount / pageSize;
		if(totalCount % pageSize > 0) {
			pageCount++;
		}
		return pageCount;
	}

}
