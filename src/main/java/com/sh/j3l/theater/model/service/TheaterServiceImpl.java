package com.sh.j3l.theater.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.j3l.theater.model.dao.TheaterDao;
import com.sh.j3l.theater.model.dto.Theater;

@Service
public class TheaterServiceImpl implements TheaterlService {
	
	@Autowired
	private TheaterDao theaterDao;

	@Override
	public List<Theater> selectAllTheater() {
		return theaterDao.selectAllTheater();
	}

}
