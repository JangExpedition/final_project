package com.sh.j3l.movie.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.sh.j3l.movie.model.dto.Attachment;
import com.sh.j3l.movie.model.dto.Movie;

public interface MovieService {
	
	List<Movie> selectMovieList(RowBounds rowBounds);
	
	int insertMovie(Movie movie);

	Movie selectOneMovie(int no);

	Movie selectOneMovieCollection(int no);

	Attachment selectOneAttachment(int no);


}
