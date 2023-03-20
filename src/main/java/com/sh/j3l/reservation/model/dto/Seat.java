package com.sh.j3l.reservation.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Seat {

	private int theaterNo;
	private SeatNo seatNo;
	private IsSelected isSelected;
}
