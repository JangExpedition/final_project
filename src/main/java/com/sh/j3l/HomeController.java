package com.sh.j3l;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sh.j3l.event.model.dto.Category;
import com.sh.j3l.event.model.dto.Event;
import com.sh.j3l.event.model.service.EventService;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	private EventService eventService;
	
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Category category) {
		
		List<Event> eventList = eventService.selectAllEvent(category); 
		
		log.debug("eventList = {}", eventList);
		
		model.addAttribute("eventList", eventList);
		
		return "forward:/index.jsp"; // forwarding경로 오버라이드(InternalResurceViewResolver) 사용안함
	}
	
	@GetMapping("/error/accessDenied.do")
	public void accessDenied() {
		log.debug("403 Forbidden");
	}
}