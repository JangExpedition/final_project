package com.sh.j3l.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/admin.do")
	public void admin() {
		log.debug("어드민 페이지 요청!!");
	}
}
