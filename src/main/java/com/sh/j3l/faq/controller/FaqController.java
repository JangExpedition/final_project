package com.sh.j3l.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.j3l.common.HelloMvcUtils;
import com.sh.j3l.common.HelloSpringUtils;
import com.sh.j3l.event.model.dto.Category;
import com.sh.j3l.event.model.dto.Event;
import com.sh.j3l.event.model.service.EventService;
import com.sh.j3l.faq.model.dto.Faq;
import com.sh.j3l.faq.model.service.FaqService;
import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.notice.model.dto.Notice;
import com.sh.j3l.notice.model.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/faq")
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	@Autowired
	private NoticeService noticeService;
	
	private static final int PAGE_LIMIT = 8;
	
	// 고객센터 메인
	@GetMapping("/main.do")
	public void main(Model model) {
		List<Notice> noticeList = noticeService.selectAllNotice();
		model.addAttribute("noticeList", noticeList);
	}
	
	// 자주찾는 질문 글쓰기 폼
	@GetMapping("/faqForm.do")
	public void faqForm() {}
	
	
	// 자주찾는 질문 전체조회 with 페이징처리	
    @GetMapping("/faqList.do")
    public void faqList(Model model, @RequestParam(value = "page", required = false) Integer page) {
        if (page == null || page == 0) {
            page = 1;
        }
        
        List<Faq> faqList = faqService.pagingAllFaq(page, PAGE_LIMIT);
        int totalPage = faqService.totalPageCount(PAGE_LIMIT);
        model.addAttribute("faqList", faqList);
        model.addAttribute("page", page);
        model.addAttribute("totalPages", totalPage);

        log.debug("faqList", faqList);

    }
	
	
	// 자주찾는 질문 글 작성
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
	
	// 자주찾는 질문 검색 + 제목별, 내용별 검색
	@GetMapping("/searchFaq")
	public String searchFaq(@RequestParam(name = "searchType") String searchType, @RequestParam(name = "keyword") String keyword, Model model) {
		List<Faq> searchFaq = null;
	    if(searchType.equals("title")) {
	        searchFaq = faqService.searchByTitle(keyword);
	    } else if(searchType.equals("content")) {
	    	searchFaq = faqService.searchByContent(keyword);
	    }
	    log.debug("searchFaq = {}", searchFaq);
	    
	    model.addAttribute("faqList", searchFaq);
	    
	    return "faq/faqList";
	}
	
			
			
	// 자주찾는 질문 상세페이지
	@GetMapping("/faqDetail.do")
	public void faqDetail(@RequestParam int no, Model model) {
		log.debug("no = {}", no);
		
		Faq faq = faqService.selectOneFaq(no);
		log.debug("faq = {}", faq);
		
		model.addAttribute("faq", faq);
	}
	
	// 자주찾는 질문 삭제 
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
	
	
	// FAQ 게시글 수정 페이지 이동
    @GetMapping("/faqUpdate.do")
    public void faqUpdate(@RequestParam int no, Model model) {
	  model.addAttribute("faq", faqService.selectOneFaq(no));
    } 
    
    // FAQ 업데이트
    @PostMapping("/faqUpdate.do")
    public String faqUpdate(Faq faq, RedirectAttributes redirectAttr) {
    	

    	int result = faqService.faqUpdate(faq);
    	log.debug("faq = {}", faq);
    	
    	if(result > 0) {
    		redirectAttr.addFlashAttribute("msg", "Faq 수정 성공");
    	} else {
    		redirectAttr.addFlashAttribute("msg", "Faq 수정 실패");
    	}
    	
    	return "redirect:/faq/faqList.do";
    }

}
