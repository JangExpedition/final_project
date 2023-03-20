package com.sh.j3l.schedule.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sh.j3l.cinema.model.dto.Cinema;
import com.sh.j3l.cinema.model.dto.Location;
import com.sh.j3l.schedule.model.dto.Schedule;

@Mapper
public interface ScheduleDao {

	List<Schedule> selectAllSchedule();

	List<Cinema> selectAllCinema();

	List<Location> selectAllLocation();


}
