package com.sh.j3l.schedule.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sh.j3l.cinema.model.dto.Cinema;
import com.sh.j3l.cinema.model.dto.Location;
import com.sh.j3l.schedule.model.dto.Schedule;
import com.sh.j3l.schedule.model.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/schedule")
public class ScheduelController {
	
	@Autowired
	private ScheduleService scheduelService;
	
	@Autowired 
	
	@GetMapping("/CinemaList.do")
	public void CinemaList(Model model) {
		
		List<Cinema> cinemaList = scheduelService.selectAllCinema();
		List<Location> locationList = scheduelService.selectAllLocation();
		model.addAttribute("cinemaList", cinemaList);
		model.addAttribute("locationList", locationList);
	}
	

}
