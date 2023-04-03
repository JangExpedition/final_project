package com.sh.j3l.member.model.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member implements UserDetails{

	private static final long serialVersionUID = 1L;
	private String id;
	private String password;
	private String name;
	private Grade grade;
	private int point;
	private String phone;
	private String email;
	private String birth;
	private int age;
	private LocalDateTime enrollDate;
	
	/**
	 * 권한목록
	 * - 문자열 권한정보를 authority객체로 관리
	 */
	List<SimpleGrantedAuthority> authorities;
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorities;
	}
	@Override
	public String getUsername() {
		return this.id;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
}
