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
import com.sh.j3l.notice.model.dto.Notice;
import com.sh.j3l.notice.model.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;

	
	@GetMapping("/noticeForm.do")
	public void noticeForm() {}
	
	@GetMapping("/noticeList.do")
	public void noticeList(@RequestParam(defaultValue = "1") int cpage, Model model) {
		// 페이징처리 RowBounds
		int limit = 15; // 한 페이지에 15개 출력
		int offset = (cpage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Notice> noticeList = noticeService.selectAllNotice();
		model.addAttribute("noticeList", noticeList);
		log.debug("noticeList = {}", noticeList);

	}
	
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
	
	
	@GetMapping("searchNotice")
	public String searchNotice(@RequestParam(name = "title") String title, Model model) {
	    
	    List<Notice> searchNotice = noticeService.searchByTitle(title);
	    log.debug("searchNotice = {}", searchNotice);
	    
	    model.addAttribute("noticeList", searchNotice);
	    
	    return "notice/noticeList";
	}
	
	@GetMapping("/noticeDetail.do")
	public void noticeDetail(@RequestParam int no, Model model) {
		log.debug("no = {}", no);
		
		Notice notice = noticeService.selectOneNotice(no);
		log.debug("notice = {}", notice);
		
		model.addAttribute("notice", notice);
	}
	
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

}
