package com.sh.j3l.theater.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sh.j3l.theater.model.dto.Theater;

@Mapper
public interface TheaterDao {

	List<Theater> selectAllTheater();

}
