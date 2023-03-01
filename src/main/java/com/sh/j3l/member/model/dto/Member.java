package com.sh.j3l.member.model.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {

	private String id;
	private String password;
	private String name;
	private String phone;
	private String email;
	private LocalDate birth;
	private String isBlackList;
	private int age;
	private LocalDateTime enrollDate;
}
