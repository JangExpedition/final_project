package com.sh.j3l.member.controller;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.j3l.member.model.dto.Member;
import com.sh.j3l.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/members.do")
	public String selectAllMember(Model model) {
		List<Member> members = memberService.selectAllMember();
		model.addAttribute("members", members);
		
		return "members";
	}
	
	@GetMapping("/memberLogin.do")
	public void memberLogin() {}
	
//	@PostMapping("/memberLogin.do")
//	public String memberLogin(String memberId, String password, Model model, RedirectAttributes redirectAttr) {
//		log.debug("memberId = {}", memberId);
//		log.debug("password = {}", password);
//		log.debug("encoded password = {}", passwordEncoder.encode(password));
//		
//		// 회원 1명 조회
//		Member member = memberService.selectOneMember(memberId);
//		log.debug("member = {}", member);
//		
//		// 인증
//		// 1. 로그인 성공한 경우
//		if(member != null && passwordEncoder.matches(password, member.getPassword())) {
//			model.addAttribute("loginMember", member); // requestScope에 저장됨. -> sessionScope에 저장하기 위해 클래스 레벨에 선언해야된다.
//			
//		}
//		// 2. 로그인 실패한 경우(아이디/비밀번호 불일치)
//		else {
//			redirectAttr.addFlashAttribute("msg", "사용자 아이디 또는 비밀번호가 일치하지 않습니다.");
//		}
//		
//		return "redirect:/";
//	}
	
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
	
	@GetMapping("/memberLogout.do")
	public String memberLogout(SessionStatus status) {
		
		if(!status.isComplete())
			status.setComplete();
		
		return "redirect:/";
	}

}
