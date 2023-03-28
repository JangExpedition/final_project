package com.sh.j3l.seat.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sh.j3l.seat.model.dto.Seat;

@Mapper
public interface SeatDao {

	@Select("select * from seat where schedule_no = #{scheduleNo}")
	List<Seat> selectAllSeat(int scheduleNo);

}
