package com.sh.j3l.schedule.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.sh.j3l.schedule.model.dto.Schedule;

@Mapper
public interface ScheduleDao {

	@Insert("insert into schedule values(seq_schedule_no.nextval, #{movieNo}, #{theaterNo}, #{startTime}, #{endTime})")
	int insertSchedule(Schedule schedule);
	
}
