package com.sh.j3l.schedule.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.j3l.schedule.model.dao.ScheduleDao;
import com.sh.j3l.schedule.model.dto.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleDao scheduleDao;

	@Override
	public int insertSchedule(Schedule schedule) {
		return scheduleDao.insertSchedule(schedule);
	}

}
