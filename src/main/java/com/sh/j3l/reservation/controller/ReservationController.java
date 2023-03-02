package com.sh.j3l.reservation.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private CinemaService cinemaService;

	@GetMapping("/reservation.do")
	public void reservation(Model model) {
		List<Cinema> cinemaList = cinemaService.selectAllCinema();
		Set<Location> locationSet = new HashSet<>();
		for(Cinema cinema : cinemaList) {
			locationSet.add(cinema.getLocation());
		}
		List<Location> locationList = new ArrayList<>(locationSet);
		model.addAttribute("locationList", locationList);
		model.addAttribute("cinemaList", cinemaList);
	}
}
