package com.sh.j3l.member.model.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailServiceImpl implements MailService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private String code; 
	
		public void makeRandomNumber() {
			int _code = (int) (Math.random()*89999+100000);
	        code = String.valueOf(_code);
		}
		
		// 이메일 내용작성 메서드
		public String joinEmail(String email) {
			makeRandomNumber();
			String setFrom = "jangssssi@naver.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
			String toMail = email;
			String title = "J3L 회원 가입 인증 이메일 입니다."; // 이메일 제목 
			String content = 
					"홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
	                "<br><br>" + 
				    "인증 번호는 " + code + "입니다." + 
				    "<br>" + 
				    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
			mailSend(setFrom, toMail, title, content);
			return code;
		}
		
		//이메일 전송 메소드
		public void mailSend(String setFrom, String toMail, String title, String content) { 
			MimeMessage message = mailSender.createMimeMessage();
			try {
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true);
				mailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}

		@Override
		public String resetPassword(String email) {
			makeRandomNumber();
			String setFrom = "jangssssi@naver.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
			String toMail = email;
			String title = "J3L 임시 비밀번호입니다."; // 이메일 제목 
			String content = 
					"홈페이지를 이용해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
	                "<br><br>" + 
				    "비밀번호는 " + code + "입니다." + 
				    "<br>" + 
				    "로그인하여 비밀번호를 변경해주세요."; //이메일 내용 삽입
			mailSend(setFrom, toMail, title, content);
			return code;
		}
		
	
}
