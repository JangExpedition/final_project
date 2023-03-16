package com.sh.j3l.cinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sh.j3l.cinema.model.dto.Cinema;
import com.sh.j3l.cinema.model.dto.Location;
import com.sh.j3l.cinema.model.service.CinemaService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cinema")
public class CinemaController {

	@Autowired
	private CinemaService cinemaService;
	
	@GetMapping("/cinema.do")
	public void cinema(Model model) {
		
		List<Cinema> cinemaList = cinemaService.selectAllCinema();
		List<Location> locationList = cinemaService.selectAllLocation();
		model.addAttribute("cinemaList", cinemaList);
		model.addAttribute("locationList", locationList);
	}
	
}
