package com.sh.j3l.question.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.j3l.member.model.dto.Member;
import com.sh.j3l.question.model.dto.Question;
import com.sh.j3l.question.model.service.QuestionService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	@GetMapping("/question.do")
	public void question() {}

	@GetMapping("/questionList.do")
	public void questionList(Model model) {
		List<Question> questionList = questionService.selectAllQuestion();
		model.addAttribute("questionList", questionList);
		log.debug("questionList", questionList);
	}
	
	@PostMapping("/questionEnroll.do")
	public String questionEnroll(Question question, RedirectAttributes redirecAttr) {
		
		log.debug("Question = {}", question);
		
		int result = questionService.sendQuestion(question);
		
		if(result > 0) {
			redirecAttr.addFlashAttribute("msg", "문의가 성공적으로 등록 되었습니다.");
		} else {
			redirecAttr.addFlashAttribute("msg", "문의 등록에 실패하셨습니다.");
		}
		
		return "redirect:/faq/main.do";
	}

}
