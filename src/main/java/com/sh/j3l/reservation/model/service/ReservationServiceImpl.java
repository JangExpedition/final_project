package com.sh.j3l.reservation.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.movie.model.dao.MovieDao;
import com.sh.j3l.reservation.model.dao.ReservationDao;
import com.sh.j3l.reservation.model.dto.Reservation;
import com.sh.j3l.schedule.model.dao.ScheduleDao;
import com.sh.j3l.schedule.model.dto.Schedule;
import com.sh.j3l.seat.model.dao.SeatDao;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private SeatDao seatDao;
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	@Autowired
	private MovieDao movieDao;
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int reservationComplete(int scheduleNo, String[] seatArr, String id) {
		int result = 0;
		int movieNo = scheduleDao.getMovieNoFromSchedule(scheduleNo);
		
		for(int i = 0; i < seatArr.length; i++) {
			result = seatDao.insertSeat(scheduleNo, seatArr[i]);
			result = reservationDao.insertReservation(id, scheduleNo, seatArr[i]);
			result = movieDao.updateMovieReservationCount(movieNo);
		}
		
		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<Reservation> getMyReservationList(String id, String oneMonthAgo) {
		return reservationDao.getMyReservationList(id, oneMonthAgo);
	}
}
