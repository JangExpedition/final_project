package com.sh.j3l.questionAnswer.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuestionAnswer {
	
	private int no;
	private int qNo;
	private String content;
	private LocalDateTime regDate;
	private String id;

}
