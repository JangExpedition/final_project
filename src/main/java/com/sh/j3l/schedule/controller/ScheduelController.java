package com.sh.j3l.schedule.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sh.j3l.schedule.model.dto.Schedule;
import com.sh.j3l.schedule.model.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/schedule")
public class ScheduelController {
	
	@Autowired
	private ScheduleService scheduelService;
	
	@GetMapping("/scheduleForm.do")
	public String scheduleList(Model model) {
		
		List<Schedule> scheduleList = scheduelService.selectAllSchedule();
		model.addAttribute("scheduleList", scheduleList);
		
		return "schedule/scheduleForm";
	}
	

}
