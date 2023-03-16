package com.sh.j3l.cinema.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sh.j3l.cinema.model.dto.Cinema;
import com.sh.j3l.cinema.model.dto.Location;

@Mapper
public interface CinemaDao {

	List<Cinema> selectAllCinema();

	@Select("select * from location order by no")
	List<Location> selectAllLocation();

	@Select("select * from cinema where name = #{name}")
	Cinema selectOneCinema(String name);

}
