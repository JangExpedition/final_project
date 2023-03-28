package com.sh.j3l.schedule.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.movie.model.service.MovieService;
import com.sh.j3l.schedule.model.dto.Schedule;
import com.sh.j3l.schedule.model.service.ScheduleService;
import com.sh.j3l.theater.model.dto.Theater;
import com.sh.j3l.theater.model.service.TheaterService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/insertSchedule.do")
	public void insertSchedule(Model model) {
		String now = LocalDate.now().toString();
		List<Movie> movieList = movieService.selectAllMovieOnScreenOrderByTitle(now);
		List<Theater> theaterList = theaterService.selectAllTheater();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("theaterList", theaterList);
	}
	
	// 런닝타임 불러오기 메서드
	@GetMapping("/getMovieRunningTime.do")
	@ResponseBody
	public int getMovieRunningTime(@RequestParam int movieNo) {
		return movieService.getMovieRunningTime(movieNo);
	}
	
	// 스케쥴 입력 메서드
	@PostMapping("insertSchedule.do")
	public String insertSchedule(Schedule schedule, Model model) {
		log.debug("schedule = {}", schedule);
		int result = scheduleService.insertSchedule(schedule);
		model.addAttribute("msg", "상영스케쥴 등록완료!");
		return "schedule/insertSchedule2";
	}
		
}
