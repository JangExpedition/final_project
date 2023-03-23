package com.sh.j3l.schedule.model.service;

import java.util.List;

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

	@Override
	public List<Schedule> selectScheduleList(int movieNo, int theaterNo) {
		return scheduleDao.selectScheduleList(movieNo, theaterNo);
	}

}
