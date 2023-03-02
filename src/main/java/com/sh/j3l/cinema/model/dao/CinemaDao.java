package com.sh.j3l.cinema.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sh.j3l.cinema.model.dto.Cinema;

@Mapper
public interface CinemaDao {

	List<Cinema> selectAllCinema();

}
