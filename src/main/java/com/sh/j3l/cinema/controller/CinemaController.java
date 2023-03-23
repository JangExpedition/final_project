package com.sh.j3l.cinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sh.j3l.cinema.model.dto.Cinema;
import com.sh.j3l.cinema.model.dto.Location;
import com.sh.j3l.cinema.model.service.CinemaService;
import com.sh.j3l.notice.model.dto.Notice;
import com.sh.j3l.notice.model.service.NoticeService;
import com.sh.j3l.question.model.dto.Question;
import com.sh.j3l.question.model.service.QuestionService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cinema")
public class CinemaController {

	@Autowired
	private CinemaService cinemaService;
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/cinema.do")
	public void cinema(Model model) {
		
		List<Cinema> cinemaList = cinemaService.selectAllCinema();
		List<Location> locationList = cinemaService.selectAllLocation();
		List<Notice> noticeList = noticeService.selectAllNotice();
		model.addAttribute("cinemaList", cinemaList);
		model.addAttribute("locationList", locationList);
		model.addAttribute("noticeList", noticeList);
	}
	
	@GetMapping("/selectOneCinema.do")
	@ResponseBody
	public Cinema selectOneCinema(@RequestParam String name) {
		return cinemaService.selectOneCinema(name);
	}
}
