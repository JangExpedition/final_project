package com.sh.j3l.question.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/question")
public class QuestionController {
	
	
	
	@GetMapping("main.do")
	public void main() {}
	
	@GetMapping("question.do")
	public void question() {}
	
	@GetMapping("notice.do")
	public void notice() {}

}
