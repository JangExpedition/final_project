package com.sh.j3l.questionAnswer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.j3l.questionAnswer.model.dto.QuestionAnswer;
import com.sh.j3l.questionAnswer.model.service.QuestionAnswerService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/questionAnswer")
public class QuestionAnswerController {
	
	@Autowired
	private QuestionAnswerService questionAnswerService;
	
	
	@PostMapping("/questionAnswerEnroll.do")
	public String questionAnswerEnroll(QuestionAnswer questionAnswer, RedirectAttributes redirectAttr) {
		
		log.debug("questionAnswer = {}", questionAnswer);
		
		int result = questionAnswerService.insertQuestionAnswer(questionAnswer);
		
		if(result > 0) {
			redirectAttr.addFlashAttribute("msg", "문의 답변 완료");
		} else {
			redirectAttr.addFlashAttribute("msg", "문의 답변 실패");
		}
		
		return "redirect:/question/questionList.do";
	}


}
