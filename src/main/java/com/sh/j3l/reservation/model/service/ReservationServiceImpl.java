package com.sh.j3l.reservation.model.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.member.model.dao.MemberDao;
import com.sh.j3l.member.model.dto.Grade;
import com.sh.j3l.member.model.dto.Member;
import com.sh.j3l.movie.model.dao.MovieDao;
import com.sh.j3l.reservation.model.dao.ReservationDao;
import com.sh.j3l.reservation.model.dto.Reservation;
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
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int reservationComplete(int scheduleNo, String[] seatArr, String id, int totalPayAmount, int usePoint) {
		int result = 0;
		int movieNo = scheduleDao.getMovieNoFromSchedule(scheduleNo);
		
		for(int i = 0; i < seatArr.length; i++) {
			result = seatDao.insertSeat(scheduleNo, seatArr[i]);
			result = reservationDao.insertReservation(id, scheduleNo, seatArr[i]);
			result = movieDao.updateMovieReservationCount(movieNo);
		}
		
		// 포인트 적립
		Member loginMember = memberDao.selectOneMember(id);
		Grade grade = loginMember.getGrade();
		switch(grade) {
		case FAMILY : result = memberDao.updatePoint(id, usePoint, (int) Math.round(totalPayAmount * 0.01)); break;
		case SILVER : result = memberDao.updatePoint(id, usePoint, (int) Math.round(totalPayAmount * 0.03)); break;
		case GOLD : result = memberDao.updatePoint(id, usePoint, (int) Math.round(totalPayAmount * 0.05)); break;
		case VIP : result = memberDao.updatePoint(id, usePoint, (int) Math.round(totalPayAmount * 0.07)); break;
		}
		
		// 멤버십 확인 및 등급조정
		String oneMonthAgo = LocalDate.now().minusMonths(1).toString();
		
		int standardGrade = reservationDao.getMyReservationList(id, oneMonthAgo).size();
		
		if(standardGrade > 0 && standardGrade <= 3)
			result = memberDao.updateGrade(id, Grade.FAMILY);
		else if(standardGrade > 3 && standardGrade <= 5)
			result = memberDao.updateGrade(id, Grade.SILVER);
		else if(standardGrade > 5 && standardGrade <= 7)
			result = memberDao.updateGrade(id, Grade.GOLD);
		else if(standardGrade > 7)
			result = memberDao.updateGrade(id, Grade.VIP);
		
		
		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<Reservation> getMyReservationList(String id, String oneMonthAgo) {
		return reservationDao.getMyReservationList(id, oneMonthAgo);
	}
}
