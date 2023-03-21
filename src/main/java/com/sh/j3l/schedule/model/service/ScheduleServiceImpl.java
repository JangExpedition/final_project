package com.sh.j3l.schedule.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.cinema.model.dto.Cinema;
import com.sh.j3l.cinema.model.dto.Location;
import com.sh.j3l.schedule.model.dao.ScheduleDao;
import com.sh.j3l.schedule.model.dto.Schedule;
import com.sh.j3l.theater.model.dto.Theater;

@Transactional
@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleDao scheduleDao;

	@Override
	public List<Schedule> selectAllSchedule() {
		return scheduleDao.selectAllSchedule();
	}

	@Override
	public List<Cinema> selectAllCinema() {
		return scheduleDao.selectAllCinema();
	}

	@Override
	public List<Location> selectAllLocation() {
		return scheduleDao.selectAllLocation();
	}

	@Override
	public Schedule selectOneCinema(String name) {
		return scheduleDao.selectOneCinema(name);
	}

	@Override
	public int insertSchedule(Schedule schedule) {
		return scheduleDao.insertSchedule(schedule);
	}




}
