package com.sh.j3l.cinema.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.j3l.cinema.model.dao.CinemaDao;
import com.sh.j3l.cinema.model.dto.Cinema;
import com.sh.j3l.cinema.model.dto.Location;

@Service
public class CinemaServiceImpl implements CinemaService {
	
	@Autowired
	private CinemaDao cinemaDao;

	@Override
	public List<Cinema> selectAllCinema() {
		return cinemaDao.selectAllCinema();
	}

	@Override
	public List<Location> selectAllLocation() {
		return cinemaDao.selectAllLocation();
	}

	@Override
	public Cinema selectOneCinema(String name) {
		return cinemaDao.selectOneCinema(name);
	}

}
