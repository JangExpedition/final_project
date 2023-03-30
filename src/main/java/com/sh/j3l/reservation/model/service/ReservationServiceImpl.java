package com.sh.j3l.reservation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.movie.model.dao.MovieDao;
import com.sh.j3l.reservation.model.dao.ReservationDao;
import com.sh.j3l.schedule.model.dao.ScheduleDao;
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
		
		for(int i = 0; i < seatArr.length; i++) {
			result = seatDao.insertSeat(scheduleNo, seatArr[i]);
			result = reservationDao.insertReservation(id, scheduleNo, seatArr[i]);
		}
		
		int movieNo = scheduleDao.getMovieNoFromSchedule(scheduleNo);
		
		result = movieDao.updateMovieReservationCount(movieNo);
		
		return result;
	}
}
