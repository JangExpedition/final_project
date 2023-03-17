package com.sh.j3l.movie.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import com.sh.j3l.movie.model.dto.Attachment;
import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.movie.model.dto.MovieEntity;
import com.sh.j3l.movie.model.service.MovieService;

@Mapper
public interface MovieDao {
	
	List<Movie> selectAllMovie(RowBounds rowBounds);
	
	int insertMovie(Movie movie);

	int insertAttachment(Attachment attach);
//
//	Movie selectOneMovie(int no);
//
//	List<Attachment> selectAttachmentListByMovieNo(int no);
//
//	Movie selectOneMovieCollection(int no);
//
//	Attachment selectOneAttachment(int no);

	Movie selectOneMovie(int no);

	Movie selectOneMovieCollection(int no);

	int updateMovie(Movie movie);

	int deleteMovie(Integer no);

	List<Movie> searchByTitle(String title);





}
