package com.sh.j3l.reservation.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ReservationDao {

	@Insert("insert into reservation values(seq_reservation_no.nextval, #{id}, #{scheduleNo}, #{seatNo})")
	int insertReservation(@Param("id") String id, @Param("scheduleNo") int scheduleNo, @Param("seatNo") String seatNo);

}
