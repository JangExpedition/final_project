package com.sh.j3l.reservation.controller;

import static org.junit.Assert.assertNull;

import org.junit.Test;

import com.sh.j3l.reservation.model.service.ReservationService;

public class ReservationControllerTest {
	
	ReservationService reservationService;

	@Test
	public void testGetMyReservation() {
		
		assertNull(reservationService.getMyReservationList("admin", "2023-05-05"));
		
	}

}
