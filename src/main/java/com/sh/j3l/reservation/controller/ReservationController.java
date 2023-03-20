package com.sh.j3l.reservation.controller;

import java.time.LocalDate;
import java.util.ArrayList;
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
import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.movie.model.service.MovieService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private CinemaService cinemaService;
	
	@Autowired
	private MovieService movieService;

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
}
