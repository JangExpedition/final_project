package com.sh.j3l.question.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.j3l.member.model.dto.Member;
import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.question.model.dto.Question;
import com.sh.j3l.question.model.service.QuestionService;
import com.sh.j3l.questionAnswer.model.dto.QuestionAnswer;
import com.sh.j3l.questionAnswer.model.service.QuestionAnswerService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private QuestionAnswerService questionAnswerService;
	
	@GetMapping("/question.do")
	public void question() {}
	
	
	
	// 사용자용 문의 내역 조회 with 페이징처리
	@GetMapping("/myQuestionList.do")
	public void myQuestionList(Model model, @RequestParam(defaultValue = "1") int page) {
		int pageSize = 10;
		List<Question> questionList = questionService.selectAllQuestion();
		int totalQuestions = questionList.size();
		int totalPages = (int) Math.ceil((double) totalQuestions / pageSize);
		
		int start = (page - 1) * pageSize;
		int end = Math.min(start + pageSize, totalQuestions);
		List<Question> questionsInPage = questionList.subList(start, end);
		
		model.addAttribute("questionList", questionsInPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
	}
	
	
	

	// 이름으로 문의 내역 검색
	@GetMapping("/searchByName")
	public String searchQuestion(@RequestParam(name = "name") String name, Model model) {
		
		List<Question> searchQuestion = questionService.searchByName(name);
		log.debug("searchQuestion = {}", searchQuestion);
		
		model.addAttribute("questionList", searchQuestion);
		
		return "question/myQuestionList";
	}

	
	// 관리자용 문의 내역 조회 with 페이징처리
	@GetMapping("/questionList.do")
	public void questionList(Model model, @RequestParam(defaultValue = "1") int page) {
		int pageSize = 10;
		List<Question> questionList = questionService.selectAllQuestion();
		int totalQuestions = questionList.size();
		int totalPages = (int) Math.ceil((double) totalQuestions / pageSize);
		
		int start = (page - 1) * pageSize;
		int end = Math.min(start + pageSize, totalQuestions);
		List<Question> questionsInPage = questionList.subList(start, end);
		
		model.addAttribute("questionList", questionsInPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
	}
	
	// 관리자용 문의 내역 확인 폼
	@GetMapping("/questionDetail.do")
	public void questionDetail(@RequestParam(name = "no", required = false) Integer no, Model model) {
		
		if(no == null) {
			
		} else {
			log.debug("no = {}", no);
			Question question = questionService.selectOneQuestion(no);
			log.debug("question = {}", question);
			
			model.addAttribute("question", question);
			model.addAttribute("no", no);
		}
		
	}
	
	// 사용자용 문의 내역 확인 폼
	@GetMapping("/myQuestionDetail.do")
	public void myQuestionDetail(@RequestParam int no, Model model) {
		
			log.debug("no = {}", no);
			Question question = questionService.selectOneQuestion(no);
			QuestionAnswer questionAnswer = questionAnswerService.selectOneQuestionAnswer(no);
			log.debug("question = {}", question);
			
			model.addAttribute("questionAnswer", questionAnswer);
			model.addAttribute("question", question);
	}
		
	
	@PostMapping("/questionEnroll.do")
	public String questionEnroll(Question question, RedirectAttributes redirectAttr) {
		
		log.debug("Question = {}", question);
		
		int result = questionService.sendQuestion(question);
		
		if(result > 0) {
			redirectAttr.addFlashAttribute("msg", "문의가 성공적으로 등록 되었습니다.");
		} else {
			redirectAttr.addFlashAttribute("msg", "문의 등록에 실패하셨습니다.");
		}
		
		return "redirect:/faq/main.do";
	}
	
	
	// 문의 삭제 
	@PostMapping("/deleteQuestion.do")
	public String deleteQuestion(int no, RedirectAttributes redirectAttr) {
		
		int result = questionService.deleteQuestion(no);
		log.debug("no = {}", no);
		
		if(result > 0) {
			redirectAttr.addFlashAttribute("msg", "문의 삭제 성공");			
		} else {
			redirectAttr.addFlashAttribute("msg", "문의 삭제 실패");
		}
		return "redirect:/question/myQuestionList.do";
	}
	
	// 극장탭 출력용
	@RequestMapping("/cinema")
	@GetMapping("/cinema.do")
	public void cinemaQues(Model model) {
		List<Question> questionList = questionService.cinemaQues();
		
		model.addAttribute("questionList", questionList);
		log.debug("questionList", questionList);
	}

}
