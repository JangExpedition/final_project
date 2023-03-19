package com.sh.j3l.movie.model.service;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.sh.j3l.movie.model.dto.Attachment;
import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.movie.model.dto.MovieEntity;

public interface MovieService {
	
	List<Movie> selectAllMovie(RowBounds rowBounds);
	
	int insertMovie(Movie movie);
	
	int insertAttachment(Attachment attach);

	Movie selectOneMovie(int no);
	
	Movie selectOneMovieCollection(int no);

	int updateMovie(Movie movie);

	int deleteMovie(Integer no);

	List<Movie> searchByTitle(String title);

	List<Movie> selectAllMovieList();

	List<Movie> selectAllOnScreen(String now);

	List<Movie> selectAllMovieOrderByTitle(String now);

//	Movie selectOneMovie(int no);
//
//
//	Attachment selectOneAttachment(int no);




}
