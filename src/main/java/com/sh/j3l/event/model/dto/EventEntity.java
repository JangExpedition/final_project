package com.sh.j3l.event.model.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventEntity {
	
	private int no;
	private String title;
	private String content;
	private Category category;
	private LocalDateTime createdAt;
}
