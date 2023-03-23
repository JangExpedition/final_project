package com.sh.j3l.schedule.model.service;


import java.util.List;

import com.sh.j3l.schedule.model.dto.Schedule;

public interface ScheduleService {

	int insertSchedule(Schedule schedule);

	List<Schedule> selectScheduleList(int movieNo, int theaterNo);

}
