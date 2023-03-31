package com.sh.j3l.reservation.model.service;

import java.util.List;

import com.sh.j3l.reservation.model.dto.Reservation;

public interface ReservationService {

	int reservationComplete(int scheduleNo, String[] seatArr, String id, int totalPayAmount, int usePoint);

	List<Reservation> getMyReservationList(String id, String oneMonthAgo);

}
