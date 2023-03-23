package com.sh.j3l.reservation.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

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
import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.movie.model.service.MovieService;
import com.sh.j3l.schedule.model.dto.Schedule;
import com.sh.j3l.schedule.model.service.ScheduleService;
import com.sh.j3l.theater.model.dto.Theater;
import com.sh.j3l.theater.model.service.TheaterService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private CinemaService cinemaService;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private ScheduleService scheduleService;

	@GetMapping("/reservation.do")
	public void reservation(Model model) {
		List<Cinema> cinemaList = cinemaService.selectAllCinema();
		List<Location> locationList = cinemaService.selectAllLocation();
		model.addAttribute("cinemaList", cinemaList);
		model.addAttribute("locationList", locationList);
	}
	
	@GetMapping("/selectAllMovieOrderBy.do")
	@ResponseBody
	public List<Movie> selectAllMovieOrderBy(@RequestParam String filterName, Model model) {
		String now = LocalDate.now().toString();
		List<Movie> movieList = new ArrayList<>();
		if(filterName == "예매율순") {
			movieList = movieService.selectAllOnScreenOrderByReservationCnt(now);
		}
		else {
			movieList = movieService.selectAllMovieOnScreenOrderByTitle(now);
		}
		model.addAttribute("movieList", movieList);
		return movieList;
	}
	
	@GetMapping("/selectTheaterList.do")
	@ResponseBody
	public List<Theater> selectTheaterList(@RequestParam String cinemaName){
		return theaterService.selectTheaterList(cinemaName);
	}
	
	@GetMapping("/selectScheduleList.do")
	@ResponseBody
	public List<Schedule> selectScheduleList(@RequestParam int movieNo, @RequestParam int theaterNo, @RequestParam String reservationDay){
		log.debug("movieNo = {}, theaterNo = {}", movieNo, theaterNo);
		List<Schedule> _scheduleList = scheduleService.selectScheduleList(movieNo, theaterNo);
		List<Schedule> scheduleList = _scheduleList.stream()
											.filter((schedule)-> schedule.getStartTime().substring(0, 9) == reservationDay)
											.collect(Collectors.toList());
		return scheduleList;
	}
}
