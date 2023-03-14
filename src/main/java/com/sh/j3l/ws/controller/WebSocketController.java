package com.sh.j3l.ws.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ws")
public class WebSocketController {

	@GetMapping("/webSocket.do")
	public void webSocket() {}
	
	@GetMapping("/stomp.do")
	public void stomp() {}
}
