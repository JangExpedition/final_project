package com.sh.j3l.theater.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sh.j3l.theater.model.dto.Theater;

@Mapper
public interface TheaterDao {

	List<Theater> selectAllTheater();

	@Select("select * from theater where cinema_name = #{cinemaName} order by theater_no desc")
	List<Theater> selectTheaterList(String cinemaName);

}
