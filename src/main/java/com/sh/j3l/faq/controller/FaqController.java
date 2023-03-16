package com.sh.j3l.faq.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.j3l.faq.model.dto.Faq;
import com.sh.j3l.faq.model.service.FaqService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/faq")
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	
	@GetMapping("/main.do")
	public void main() {}
	
	@GetMapping("/faqForm.do")
	public void faqForm() {}
	
	@GetMapping("/faqList.do")
	public void faqList(@RequestParam(defaultValue = "1") int cpage, Model model) {
		// 페이징처리 RowBounds
		int limit = 15; // 한 페이지에 15개 출력
		int offset = (cpage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Faq> faqList = faqService.selectAllFaq(rowBounds);
		model.addAttribute("faqList", faqList);
		log.debug("faqList = {}", faqList);

	}
	
	@PostMapping("/faqEnroll.do")
	public String faqEnroll(Faq faq, RedirectAttributes redirectAttr) {
		
		log.debug("faq = {}", faq);
		
		int result = faqService.insertFaq(faq);
		
		if(result > 0) {
			redirectAttr.addFlashAttribute("msg", "질문 등록 성공");
		} else {
			redirectAttr.addFlashAttribute("msg", "질문 등록 실패");
		}
		
		return "redirect:/faq/faqList.do";
		
	}
	
	@GetMapping("searchFaq")
	public String searchFaq(@RequestParam(name = "title", required = false) String title, Model model) {
	    
	    List<Faq> searchFaq = faqService.searchByTitle(title);
	    log.debug("searchFaq = {}", searchFaq);
	    
	    model.addAttribute("faqList", searchFaq);
	    
	    return "faq/faqList";
	}
	
	
	@GetMapping("/faqDetail.do")
	public void faqDetail(@RequestParam int no, Model model) {
		log.debug("no = {}", no);
		
		Faq faq = faqService.selectOneFaq(no);
		log.debug("faq = {}", faq);
		
		model.addAttribute("faq", faq);
	}
	
	
	@PostMapping("/deleteFaq.do")
	public String deleteFaq(Integer no, RedirectAttributes redirectAttr) {
		
		int result = faqService.deleteFaq(no);
		log.debug("no = {}", no);
		
		if(result > 0) {
			redirectAttr.addFlashAttribute("msg", "게시물 삭제 성공");
		} else {
			redirectAttr.addFlashAttribute("msg", "게시물 삭제 실패");
		}
		return "redirect:/faq/faqList.do";
	}

	
	

	
}
