package com.sh.j3l.schedule.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sh.j3l.schedule.model.dto.Schedule;

@Mapper
public interface ScheduleDao {

	List<Schedule> selectAllSchedule();


}
