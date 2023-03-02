package com.sh.j3l.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sh.j3l.cinema.model.dto.Cinema;
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
//		List<Cinema> cinemaList = cinemaService.selectAllCinema();
//		model.addAttribute("cinemaList", cinemaList);
	}
}
