package com.sh.j3l.event.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import com.sh.j3l.event.model.dto.Category;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
@RequiredArgsConstructor
public class EventController {

    private final EventService eventService;

    private final ServletContext application;

    private static final int PAGE_LIMIT = 9;

    // 이벤트 게시판 전체 조회 및 페이징 처리
    @GetMapping("/events.do")
    public String eventSpecial(Model model, @RequestParam(value = "page", required = false) Integer page, @RequestParam Category category) {
        if (page == null || page == 0) {
            page = 1;
        }
        
        List<Event> eventList = eventService.pagingAllEvent(category, page, PAGE_LIMIT);
        int totalPage = eventService.totalPageCount(category, PAGE_LIMIT);
        model.addAttribute("eventList", eventList);
        model.addAttribute("page", page);
        model.addAttribute("totalPages", totalPage);
		model.addAttribute("category", category);

        log.debug("eventList", eventList);
		return "event/eventList";

    }
    
    
    // 이벤트 리스트 비동기 요청
    @GetMapping("/api/events.do")
    @ResponseBody
    public List<Event> selectAllEventList() {
        List<Event> eventList = eventService.selectAllEvent(null);

        log.debug("eventList = {}", eventList);

        return eventList;
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
    public void eventForm() {
    }
    
    //이벤트 게시물 등록
    @PostMapping("/eventEnroll.do")
    public String eventEnroll(Event event, RedirectAttributes redirectAttr, @RequestParam("upFile") List<MultipartFile> upFiles) {

        String saveDirectory = application.getRealPath("/resources/upload/event");

        for (MultipartFile upFile : upFiles) {

            if (upFile.getSize() > 0) {

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

        return String.format("redirect:/event/events.do?category=%s", event.getCategory().name());

    }
    
    // 이벤트 삭제
    @PostMapping("/deleteEvent.do")
    public String deleteEvent(int no, RedirectAttributes redirectAttr) {

        int result = eventService.deleteEvent(no);
        log.debug("no = {}", no);

        if (result > 0) {
            redirectAttr.addFlashAttribute("msg", "게시물 삭제 성공");
        } else {
            redirectAttr.addFlashAttribute("msg", "게시물 삭제 실패");
        }
        return "redirect:/event/events.do?category=SPECIAL";
    }
    
    // 이벤트 게시글 수정 페이지 이동
    @GetMapping("/eventUpdate.do")
    public void eventUpdate(@RequestParam int no, Model model) {
	  model.addAttribute("event", eventService.selectOneEvent(no));
    } 
    
    // 이벤트 수정
    @PostMapping("/eventUpdate.do")
    public String eventUpdate(Event event, RedirectAttributes redirectAttr) {
    	
    	int result = eventService.eventUpdate(event);
    	log.debug("event ={}", event);
    	
    	if (result > 0) {
    		redirectAttr.addFlashAttribute("msg", "이벤트 게시물 수정 성공");
    	} else {
    		redirectAttr.addFlashAttribute("msg", "이벤트 게시물 수정 실패");
    	}
    	return "redirect:/event/events.do?category=SPECIAL";
    }
}