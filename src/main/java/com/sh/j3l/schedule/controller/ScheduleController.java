package com.sh.j3l.schedule.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.j3l.cinema.model.dto.Cinema;
import com.sh.j3l.cinema.model.dto.Location;
import com.sh.j3l.cinema.model.service.CinemaService;
import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.movie.model.service.MovieService;
import com.sh.j3l.schedule.model.dto.Schedule;
import com.sh.j3l.schedule.model.service.ScheduleService;
import com.sh.j3l.theater.model.dto.Theater;
import com.sh.j3l.theater.model.service.TheaterlService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduelService;
	
	@Autowired
	private CinemaService cinemaService;
	
	@Autowired
	private TheaterlService theaterlService;
	
	@Autowired
	private MovieService movieService;
	
	// 상영관 리스트 출력
	@GetMapping("/cinemaList.do")
	public void CinemaList(Model model) {
		
		List<Cinema> cinemaList = cinemaService.selectAllCinema();
		List<Location> locationList = cinemaService.selectAllLocation();
		List<Movie> movieList = movieService.selectAllMovie();
		model.addAttribute("cinemaList", cinemaList);
		model.addAttribute("locationList", locationList);
	}
	
	// 상영관 상영 관리 폼
	@GetMapping("/cinemaDetail.do")
	public void cinemaDetail(@RequestParam(name = "name", required = false) String name, Model model) {
		
		if(name == null) {
			
		} else {
			log.debug("name ={}", name);
			Schedule schedule = scheduelService.selectOneCinema(name);
			
			log.debug("name", name);
			
			List<Cinema> cinema = cinemaService.selectAllCinema();
			List<Location> location = cinemaService.selectAllLocation();
			List<Movie> movie = movieService.selectAllMovie();
			List<Theater> theater = theaterlService.selectAllTheater();
			
			Map<String, Object> modelMap = new HashMap<>();
			modelMap.put("cinema", cinema);
			modelMap.put("location", location);
			modelMap.put("movie", movie);
			modelMap.put("schedule", schedule);
			modelMap.put("theater", theater);
		}
	}
	
	@GetMapping("/insertSchedule.do")
	public void insertSchedule() {}
	
	// 상영 일정 등록
	@PostMapping("/insertSchedule.do")
	public String insertSchedule(Schedule schedule, Model model, RedirectAttributes redirectAttr) {
		
		int result = scheduelService.insertSchedule(schedule);
		
		redirectAttr.addFlashAttribute("msg", "상영 일정 등록 성공");
		
		List<Cinema> cinema = cinemaService.selectAllCinema();
		List<Location> location = cinemaService.selectAllLocation();
		List<Theater> theater = theaterlService.selectAllTheater();
		List<Movie> movie = movieService.selectAllMovie();
		
		Map<String, Object> modelMap = new HashMap<>();
		modelMap.put("cinema", cinema);
		modelMap.put("location", location);
		modelMap.put("schedule", schedule);
		modelMap.put("theater", theater);
		
		return "redirect:/schedule/insertSchedule.do";
	}
		
}
