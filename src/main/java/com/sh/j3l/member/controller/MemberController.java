package com.sh.j3l.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sh.j3l.member.model.dto.Member;
import com.sh.j3l.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/memberList.do")
	public String selectAllMember(Model model) {
		List<Member> members = memberService.selectAllMember();
		model.addAttribute("members", members);
		
		return "member/memberList";
	}

}
