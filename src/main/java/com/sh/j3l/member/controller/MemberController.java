package com.sh.j3l.member.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.j3l.member.model.dto.Member;
import com.sh.j3l.member.model.service.MailService;
import com.sh.j3l.member.model.service.MemberService;
import com.sun.mail.iap.Response;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/memberList.do")
	public void memberList() {}
	
	@GetMapping("/members.do")
	public String selectAllMember(Model model) {
		List<Member> members = memberService.selectAllMember();
		model.addAttribute("members", members);
		log.debug("members = {}", members);
		return "member/memberList";
	}

	// 로그인 페이지 이동 메서드
	@GetMapping("/memberLogin.do")
	public void memberLogin() {}
	
	// 로그인 메서드
	@PostMapping("/loginSuccess.do")
	public String loginSuccess(HttpSession session) {
		log.debug("loginSuccess 핸들러 호출!");
		// 필요한 로그인후처리
		String location = "/";
		
		// 시큐리어티가 지정한 리다이렉트 url 가져오기
		SavedRequest savedRequest = (SavedRequest) session.getAttribute("SPRING_SECURITY_SAVED_REQUEST");
		if(savedRequest != null)
			location = savedRequest.getRedirectUrl();
		
		log.debug("location = {}", location);
		
		return "redirect:" + location;
	}
	
	// 로그아웃 메서드
	@GetMapping("/memberLogout.do")
	public String memberLogout(SessionStatus status) {
		
		if(!status.isComplete())
			status.setComplete();
		
		return "redirect:/";
	}
	
	// 회원가입 관련 메서드들
	// 회원가입 페이지 이동 메서드
	@GetMapping("/memberEnroll.do")
	public void memberEnroll() {}
	
	// 아이디 중복체크 페이지 이동 메서드
	@GetMapping("/insertMember.do")
	public void insertMember() {}
	
	// 아이디 중복체크 메서드
	@GetMapping("/duplicationCheck.do")
	public String duplicationCheck(@RequestParam String name, @RequestParam String birth, @RequestParam String phone, Model model) {
		phone = "010" + phone;
		Member member = new Member(null, null, name, phone, null, birth, 0, null, null);
		model.addAttribute("member", member);
		member = memberService.duplicationCheck(member);
		if(member != null) {
			String _id = member.getId();
			String id = _id.substring(0, 3);
			for(int i = 0; i < _id.length()-3; i++) {
				id += "*";
			}
			member.setId(id);
			model.addAttribute("member", member);
			return "member/duplication";
		}
		return "member/insertMember2";
	}
	
	@GetMapping("/duplication.do")
	public void duplication() {}
	
	// 인증메일 발송 메서드
	@GetMapping("/authentication.do")
	@ResponseBody
	public String mailCheck(@RequestParam String email) {
		return mailService.joinEmail(email);
	}
	
	// 회원가입 메서드
	@PostMapping("/enroll.do")
	public String enrollMember(Member member, RedirectAttributes redirectAttr) {
		log.debug("sadfasf");
		int result = memberService.insertMember(member);
		redirectAttr.addAttribute("msg", "회원가입 성공!");
		return "redirect:/";
	}
	
	@GetMapping("/findId")
	public String findId() {
		return "";
	}

}
