package com.sh.j3l.questionAnswer.model.service;

import com.sh.j3l.questionAnswer.model.dto.QuestionAnswer;

public interface QuestionAnswerService {

	int insertQuestionAnswer(QuestionAnswer questionAnswer);

	QuestionAnswer selectOneQuestionAnswer(int no);

}
