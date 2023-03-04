package com.sh.j3l.question;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/question")
public class QuestionController {
	
//	@Autowired
//	private CustomerService customerService;
	
	@GetMapping("question.do")
	public void question() {}
	
	@GetMapping("/faq.do")
	public String faq() {
		
		return "question/faq";
	}

}
