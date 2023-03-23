package com.sh.j3l.theater.model.service;

import java.util.List;

import com.sh.j3l.theater.model.dto.Theater;

public interface TheaterService {

	List<Theater> selectAllTheater();

	// 영화관 별 상영관 목록 불러오기
	List<Theater> selectTheaterList(String cinemaName);

}
