package com.sh.j3l.notice.controller;

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
import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.notice.model.dto.Notice;
import com.sh.j3l.notice.model.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	private static final int PAGE_LIMIT = 5;

	
	@GetMapping("/noticeForm.do")
	public void noticeForm() {}
	
	// 공지 목록 조회 with 페이징처리
	@GetMapping("/noticeList.do")
	public void noticeList(Model model, @RequestParam(value = "page", required = false) Integer page) {
	    if (page == null || page == 0) {
	    	page = 1;
	    }
	    
	    List<Notice> noticeList = noticeService.pagingAllNotice(page, PAGE_LIMIT);
	    int totalPage = noticeService.totalPageCount(PAGE_LIMIT);

	    model.addAttribute("noticeList", noticeList);
	    model.addAttribute("page", page);
	    model.addAttribute("totalPages", totalPage);
	    
	    log.debug("noticeList", noticeList);
	}
	
	// 공지사항 작성
	@PostMapping("/noticeEnroll.do")
	public String noticeEnroll(Notice notice, RedirectAttributes redirectAttr) {
		
		log.debug("notice = {}", notice);
		
		int result = noticeService.insertNotice(notice);
		
		if(result > 0) {
			redirectAttr.addFlashAttribute("msg", "공지 등록 성공");
		} else {
			redirectAttr.addFlashAttribute("msg", "공지 등록 실패");
		}
		
		return "redirect:/notice/noticeList.do";
		
	}
	
	
	// 공지사항 검색 + 제목별, 내용별 검색
	@GetMapping("/searchNotice")
	public String searchNotice(@RequestParam(name = "searchType") String searchType, @RequestParam(name = "keyword") String keyword, Model model) {
	    List<Notice> searchNotice = null;
	    if(searchType.equals("title")) {
	        searchNotice = noticeService.searchByTitle(keyword);
	    } else if(searchType.equals("content")) {
	    	searchNotice = noticeService.searchByContent(keyword);
	    }
	    log.debug("searchNotice = {}", searchNotice);
	    
	    model.addAttribute("noticeList", searchNotice);
	    
	    return "notice/noticeList";
	}

	
	// 공지사항 상세페이지
	@GetMapping("/noticeDetail.do")
	public void noticeDetail(@RequestParam int no, Model model) {
		log.debug("no = {}", no);
		
		Notice notice = noticeService.selectOneNotice(no);
		log.debug("notice = {}", notice);
		
		model.addAttribute("notice", notice);
	}
	
	// 공지사항 삭제
	@PostMapping("/deleteNotice.do")
	public String deleteNotice(Integer no, RedirectAttributes redirectAttr) {
		
		int result = noticeService.deleteNotice(no);
		log.debug("no = {}", no);
		
		if(result > 0) {
			redirectAttr.addFlashAttribute("msg", "게시물 삭제 성공");
		} else {
			redirectAttr.addFlashAttribute("msg", "게시물 삭제 실패");
		}
		return "redirect:/notice/noticeList.do";
	}
	
	// 공지사항 수정 페이지 이동
	@GetMapping("/noticeUpdate.do")
	public void noticeUpdate(@RequestParam int no, Model model) {
		model.addAttribute("notice", noticeService.selectOneNotice(no));
	}
	
	// 공지사항 업데이트
	@PostMapping("/noticeUpdate.do")
	public String noticeUpdate(Notice notice, RedirectAttributes redirectAttr) {
		
		int result = noticeService.noticeUpdate(notice);
		log.debug("notice = {}", notice);
		
		if(result > 0) {
			redirectAttr.addFlashAttribute("msg", "Notice 수정 성공");
		} else {
			redirectAttr.addFlashAttribute("msg", "Notice 수정 실패");
		}
		
		return "redirect:/notice/noticeList.do";
	}
	

}
