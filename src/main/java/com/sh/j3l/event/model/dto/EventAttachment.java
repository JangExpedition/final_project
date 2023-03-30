package com.sh.j3l.event.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventAttachment {
	private int no;
	private int eventNo;
	private String originalFilename;
	private String renamedFilename;
}
