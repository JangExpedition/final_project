package com.sh.j3l.schedule.model.service;

import java.util.List;

import com.sh.j3l.cinema.model.dto.Cinema;
import com.sh.j3l.cinema.model.dto.Location;
import com.sh.j3l.schedule.model.dto.Schedule;
import com.sh.j3l.theater.model.dto.Theater;

public interface ScheduleService {

	List<Schedule> selectAllSchedule();

	List<Cinema> selectAllCinema();

	List<Location> selectAllLocation();

	Schedule selectOneCinema(String name);

	int insertSchedule(Schedule schedule);


}
