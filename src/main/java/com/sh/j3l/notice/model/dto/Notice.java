package com.sh.j3l.notice.model.dto;


import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@Getter
@Service
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	
	 private int no;
	 private String title;
	 private int readCount;
	 private Classifyy classifyy;
	 private String content;
}
