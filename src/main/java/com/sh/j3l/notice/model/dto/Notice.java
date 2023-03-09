package com.sh.j3l.notice.model.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	
	 private int no;
	 private String id;
	 private String title;
	 private int readCount;
	 private Classify2 classify;
	 private String content;
}
