package com.sh.j3l.seat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.seat.model.dao.SeatDao;
import com.sh.j3l.seat.model.dto.Seat;

@Service
public class SeatServiceImpl implements SeatService {

	@Autowired
	private SeatDao seatDao;
	
	@Override
	public List<Seat> selectAllSeat(int scheduleNo) {
		return seatDao.selectAllSeat(scheduleNo);
	}

}
