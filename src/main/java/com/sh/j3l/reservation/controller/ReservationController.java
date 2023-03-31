package com.sh.j3l.reservation.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sh.j3l.cinema.model.dto.Cinema;
import com.sh.j3l.cinema.model.dto.Location;
import com.sh.j3l.cinema.model.service.CinemaService;
import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.movie.model.service.MovieService;
import com.sh.j3l.reservation.model.dto.Reservation;
import com.sh.j3l.reservation.model.service.ReservationService;
import com.sh.j3l.schedule.model.dto.Schedule;
import com.sh.j3l.schedule.model.service.ScheduleService;
import com.sh.j3l.seat.model.dto.Seat;
import com.sh.j3l.seat.model.service.SeatService;
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
	
	@Autowired
	private SeatService seatService;
	
	@Autowired
	private ReservationService reservationService;

	@GetMapping("/reservation.do")
	public void reservation(Model model, @RequestParam(required = false) String movieNo) {
		List<Cinema> cinemaList = cinemaService.selectAllCinema();
		List<Location> locationList = cinemaService.selectAllLocation();
		model.addAttribute("cinemaList", cinemaList);
		model.addAttribute("locationList", locationList);
		if(movieNo != null) {
			model.addAttribute("movieNo", movieNo);
		}
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
		List<Schedule> _scheduleList = scheduleService.selectScheduleList(movieNo, theaterNo);
		List<Schedule> scheduleList = _scheduleList.stream()
											.filter((schedule)-> schedule.getStartTime().substring(0, 10).equals(reservationDay))
											.collect(Collectors.toList());
		log.debug("scheduleList = {}", scheduleList);
		return scheduleList;
	}
	
	@GetMapping("/selectAllSeat.do")
	@ResponseBody
	public List<Seat> selectAllSeat(@RequestParam int scheduleNo){
		return seatService.selectAllSeat(scheduleNo);
	}
	
	@PostMapping("/reservationComplete.do")
	@ResponseBody
	public String reservationComplete(@RequestParam int scheduleNo, @RequestParam String[] seatArr, @RequestParam String id) {
		
		int result = reservationService.reservationComplete(scheduleNo, seatArr, id);
		
	    Map<String, Object> responseData = new HashMap<>();
	    responseData.put("msg", "결제가 완료되었습니다.");

	    ObjectMapper mapper = new ObjectMapper();
	    String jsonResponse = "";
	    try {
	        jsonResponse = mapper.writeValueAsString(responseData);
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	    }

	    return jsonResponse;
	};
	
	@GetMapping("/getMyReservation.do")
	@ResponseBody
	public List<Reservation> getMyReservation(@RequestParam String id) {
		
		String oneMonthAgo = LocalDate.now().minusMonths(1).toString();
		
		return reservationService.getMyReservationList(id, oneMonthAgo);
	}
}
