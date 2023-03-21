package com.sh.j3l.theater.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sh.j3l.theater.model.dto.Theater;
import com.sh.j3l.theater.model.service.TheaterlService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/theater")
public class TheaterController {
	
	@Autowired
	private TheaterlService theaterlService;
	
	@GetMapping
	public void theater(Model model) {
		
		List<Theater> theaterList = theaterlService.selectAllTheater();
		model.addAttribute("theaterList", theaterList);
	}

}
