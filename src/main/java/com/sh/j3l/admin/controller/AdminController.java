package com.sh.j3l.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sh.j3l.member.model.dto.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	
	
	@GetMapping("/admin.do")
	public void admin() {
		log.debug("Admin 페이지 요청!");
	}

	@GetMapping("/movieEnroll.do")
	public void movieEnroll() {}
	
}
