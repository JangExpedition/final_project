package com.sh.j3l.cinema.model.service;

import java.util.List;

import com.sh.j3l.cinema.model.dto.Cinema;
import com.sh.j3l.cinema.model.dto.Location;

public interface CinemaService {

	List<Cinema> selectAllCinema();

	List<Location> selectAllLocation();

	Cinema selectOneCinema(String name);

}
