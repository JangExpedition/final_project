package com.sh.j3l.question.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Question {
	
	private int no;
	private String title;
	private String content;
	private LocalDateTime regDate;
	private Type type;
	private String name;
	private String phone;
	private String email;
}
