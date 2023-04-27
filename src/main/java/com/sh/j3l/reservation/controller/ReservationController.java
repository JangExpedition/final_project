package com.sh.j3l.reservation.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
import com.sh.j3l.member.model.dto.Member;
import com.sh.j3l.member.model.service.MemberService;
import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.movie.model.service.MovieService;
import com.sh.j3l.reservation.model.dto.Lun;
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
	
	@Autowired
	private MemberService memberService;

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
		if(filterName.equals("예매율순")) {
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
	
	// 예약 결제 완료 메서드
	@PostMapping("/reservationComplete.do")
	@ResponseBody
	public String reservationComplete
		(@RequestParam int scheduleNo, 
		 @RequestParam String[] seatArr, 
		 @RequestParam String id, 
		 @RequestParam int totalPayAmount, 
		 @RequestParam int usePoint, 
		 Authentication authentication) {
		
		int result = reservationService.reservationComplete(scheduleNo, seatArr, id, totalPayAmount, usePoint);
		
		Member newMember = memberService.selectOneMember(id);
		Authentication newAuthentication = new UsernamePasswordAuthenticationToken(
				newMember,
				authentication.getCredentials(),
				authentication.getAuthorities()
				);
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		
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
	
	// 내 에약목록 불러오기
	@GetMapping("/getMyReservation.do")
	@ResponseBody
	public List<Reservation> getMyReservation(@RequestParam String id) {
		
		String oneMonthAgo = LocalDate.now().minusMonths(1).toString();
		
		return reservationService.getMyReservationList(id, oneMonthAgo);
	}
	
	// 음력 공휴일 체크 메서드
	@GetMapping("/isHoliday.do")
	@ResponseBody
	public boolean isHoliday(@RequestParam Date day) {
		boolean bool = false;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(day);
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		int date = calendar.get(Calendar.DATE);
		
		new Lun();
		int[] lunDate = Lun.get(year, month, date);
		String mon = "";
		if(lunDate[1] < 10) {
			mon = "0" + Integer.toString(lunDate[1]);
		}else {
			mon = Integer.toString(lunDate[1]);
		}
		String lunar = mon + Integer.toString(lunDate[2]);
		
		switch(lunar) {
		case "1231" : bool = true; break;
		case "0101" : bool = true; break;
		case "0102" : bool = true; break;
		case "0408" : bool = true; break;
		case "0814" : bool = true; break;
		case "0815" : bool = true; break;
		case "0816" : bool = true; break;
		}
		
		return bool;
	};
	
}
