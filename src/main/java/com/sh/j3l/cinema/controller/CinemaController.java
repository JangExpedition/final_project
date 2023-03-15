package com.sh.j3l.cinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

import com.sh.j3l.cinema.model.service.CinemaService;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CinemaController {

	@Autowired
	private CinemaService cinemaService;
	
	@GetMapping("/cinema.do")
	public void cinema() {}
	
}
