package com.sh.j3l.schedule.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.schedule.model.dao.ScheduleDao;
import com.sh.j3l.schedule.model.dto.Schedule;

@Transactional
@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleDao scheduleDao;

	@Override
	public List<Schedule> selectAllSchedule() {
		return scheduleDao.selectAllSchedule();
	}

}
