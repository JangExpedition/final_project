package com.sh.j3l.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sh.j3l.event.model.service.EventService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@GetMapping("/event.do")
	public void event() {}

}
