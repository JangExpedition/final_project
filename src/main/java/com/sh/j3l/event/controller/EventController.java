package com.sh.j3l.event.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import com.sh.j3l.event.model.dto.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.socket.sockjs.transport.handler.EventSourceTransportHandler;

import com.sh.j3l.common.HelloSpringUtils;
import com.sh.j3l.event.model.dto.Event;
import com.sh.j3l.event.model.dto.EventAttachment;
import com.sh.j3l.event.model.service.EventService;
import com.sh.j3l.movie.model.dto.Attachment;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Slf4j
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private ServletContext application;
	
	@GetMapping("/eventSpecial.do")
	public void eventSpecial(Model model) {
		//Category가 SPECIAL인 이벤트만 가져오기
		List<Event> eventList = eventService.selectAllEvent(Category.SPECIAL);
		model.addAttribute("eventList", eventList);
		log.debug("eventList", eventList);
		
	}
	
	// 이벤트 디테일 폼
	@GetMapping("/eventDetail.do")
	public void eventDetail(@RequestParam int no, Model model) {
		
		log.debug("no = {}", no);
		
		Event event = eventService.selectOneEvent(no);
		log.debug("event = {}", event);
		
		model.addAttribute("event", event);
		model.addAttribute("no", no);
	}
	
	
	// 이벤트 등록 폼
	@GetMapping("/eventForm.do")
	public void eventForm() {}
	
	//이벤트 게시물 등록
	@PostMapping("/eventEnroll.do")
	public String eventEnroll(Event event, RedirectAttributes redirectAttr, @RequestParam("upFile") List<MultipartFile> upFiles) {
		
		String saveDirectory = application.getRealPath("/resources/upload/event");
		
		for(MultipartFile upFile : upFiles) {
			
			if(upFile.getSize() > 0) {
				
				String renamedFilename = HelloSpringUtils.renameMultipartFile(upFile);
				String originalFilename = upFile.getOriginalFilename();
				File destFile = new File(saveDirectory, renamedFilename);
				try {
					upFile.transferTo(destFile);
				} catch (IllegalStateException | IOException e) {
					log.error(e.getMessage(), e);
				}
				
				EventAttachment attach = new EventAttachment();
				attach.setRenamedFilename(renamedFilename);
				attach.setOriginalFilename(originalFilename);
				event.addAttachment(attach);
			}
		}
		
		log.debug("event = {}", event);
		int result = eventService.insertEvent(event);
		
		redirectAttr.addFlashAttribute("msg", "이벤트 정보 등록 성공");
		
		return "redirect:/event/eventSpecial.do";
		
	}
	
	// 이벤트 삭제
	@PostMapping("deleteEvent.do")
	public String deleteEvent(int no, RedirectAttributes redirectAttr) {
		
		int result = eventService.deleteEvent(no);
		log.debug("no = {}", no);
		
		if(result > 0) {
			redirectAttr.addFlashAttribute("msg", "게시물 삭제 성공");
		} else {
			redirectAttr.addFlashAttribute("msg", "게시물 삭제 실패");
		}
		return "redirect:/event/eventSpecial.do";
	}
	
	
	
	
	
	@GetMapping("/eventMovie.do")
	public void eventMovie(Model model) {

		//Category가 MOVIEYEME인 이벤트만 가져오기
		List<Event> eventList = eventService.selectAllEvent(Category.MOVIEYEME);
		model.addAttribute("eventList", eventList);
		log.debug("eventList", eventList);
		
	}
	
	@GetMapping("/eventMembership.do")
	public void eventMembership(Model model) {
		
		//Category가 MEMBERSHIP인 이벤트만 가져오기
		List<Event> eventList = eventService.selectAllEvent(Category.MEMBERSHIP);
		model.addAttribute("eventList", eventList);
		log.debug("eventList", eventList);
		
	}
	 
	@GetMapping("/eventCinema.do")
	public void eventCinema(Model model) {
		
		//Category가 MOVIEYEME인 이벤트만 가져오기 -> 추후 CINEMA 탭 추가 시, 변경 요망
		List<Event> eventList = eventService.selectAllEvent(Category.MOVIEYEME);
		model.addAttribute("eventList", eventList);
		log.debug("eventList", eventList);
		
	}
	
	@GetMapping("/eventSale.do")
	public void eventSale(Model model) {
		//Category가 JAEHYUSALE인 이벤트만 가져오기
		List<Event> eventList = eventService.selectAllEvent(Category.JAEHYUSALE);
		model.addAttribute("eventList", eventList);
		log.debug("eventList", eventList);
		
	}
	
	
}
