package com.sh.j3l.seat.model.service;

import java.util.List;

import com.sh.j3l.seat.model.dto.Seat;

public interface SeatService {

	List<Seat> selectAllSeat(int scheduleNo);

	int reservationComplete(int scheduleNo, String[] seatArr);

}
