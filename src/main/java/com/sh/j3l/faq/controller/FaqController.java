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
	
	@GetMapping("/faq.do")
	public void faq() {}
	
	@GetMapping("/faqForm.do")
	public void faqForm() {}
	
	@GetMapping("/faqList.do")
	public String faqList(@RequestParam(defaultValue = "1") int cpage, Model model) {
		// 페이징처리 RowBounds
		int limit = 15; // 한 페이지에 15개 출력
		int offset = (cpage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Faq> faqList = faqService.selectAllFaq(rowBounds);
		model.addAttribute("faqList", faqList);
		log.debug("faqList = {}", faqList);
		
		return "faq/faqList";
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
		
		return "redirect:/faq/faq.do";
		
	}
	
}
