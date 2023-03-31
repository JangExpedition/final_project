package com.sh.j3l.reservation.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sh.j3l.reservation.model.dto.Reservation;

@Mapper
public interface ReservationDao {

	@Insert("insert into reservation values(seq_reservation_no.nextval, #{id}, #{scheduleNo}, #{seatNo})")
	int insertReservation(@Param("id") String id, @Param("scheduleNo") int scheduleNo, @Param("seatNo") String seatNo);

	List<Reservation> getMyReservationList(@Param("id") String id, @Param("oneMonthAgo") String oneMonthAgo);

}
