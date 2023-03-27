package com.sh.j3l.schedule.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sh.j3l.schedule.model.dto.Schedule;

@Mapper
public interface ScheduleDao {

	@Insert("insert into schedule values(seq_schedule_no.nextval, #{movieNo}, #{theaterNo}, #{startTime}, #{endTime})")
	int insertSchedule(Schedule schedule);

	@Select("select * from schedule where movie_no = #{movieNo} and theater_no = #{theaterNo} order by start_time")
	List<Schedule> selectScheduleList(@Param("movieNo") int movieNo, @Param("theaterNo") int theaterNo);
	
}
