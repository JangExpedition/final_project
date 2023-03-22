package com.sh.j3l.schedule.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Schedule {
	
	private int no;
	private int movieNo;
	private int theaterNo;
	private String startTime;
	private String endTime;

}
