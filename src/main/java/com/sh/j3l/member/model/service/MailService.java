package com.sh.j3l.member.model.service;

public interface MailService {

	String joinEmail(String email);
	
	String resetPassword(String email);

}
