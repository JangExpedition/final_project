package com.sh.j3l.movie.model.service;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.movie.model.dao.MovieDao;
import com.sh.j3l.movie.model.dto.Attachment;
import com.sh.j3l.movie.model.dto.Movie;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Service
@Slf4j
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private MovieDao movieDao;
	
	@Override
	public List<Movie> selectAllMovie(RowBounds rowBounds) {
		return movieDao.selectAllMovie(rowBounds);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertMovie(Movie movie) {
		
		int result = movieDao.insertMovie(movie);
		
		List<Attachment> attachments = movie.getAttachments();
		if(attachments.size() > 0) {
			for(Attachment attach :attachments) {
				attach.setMovieNo(movie.getNo());
				result = insertAttachment(attach);
			}
		}
		return result;
	}


	@Override
	public int insertAttachment(Attachment attach) {
		return movieDao.insertAttachment(attach);
	}

	
	@Override
	public Movie selectOneMovie(int no) {
//		Movie movie = movieDao.selectOneMovie(no);
//		List<Attachment> attachments = movieDao.selectAttachmentListByMovieNo(no);
//		movie.setAttachments(attachments);
		return movieDao.selectOneMovie(no);
	}

	@Override
	public Movie selectOneMovieCollection(int no) {
		return movieDao.selectOneMovieCollection(no);
	}

	@Override
	public int updateMovie(Movie movie) {
		return movieDao.updateMovie(movie);
	}

	@Override
	public int deleteMovie(Integer no) {
		return movieDao.deleteMovie(no);
	}

	@Override
	public List<Movie> searchByTitle(String title) {
		return movieDao.searchByTitle(title);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Movie> selectAllMovieList() {
		List<Movie> movieList = movieDao.selectAllMovieList();
		for(Movie movie : movieList) {
			List<Attachment> attachList = movieDao.selectOneAttachment(movie.getNo());
			movie.setAttachments(attachList);
		}
		return movieList;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Movie> selectAllOnScreen(String now) {
		List<Movie> movieList = movieDao.selectAllOnScreen(now);
		for(Movie movie : movieList) {
			List<Attachment> attachList = movieDao.selectOneAttachment(movie.getNo());
			movie.setAttachments(attachList);
		}
		return movieList;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Movie> selectAllMovieOrderByTitle(String now) {
		List<Movie> movieList = movieDao.selectAllMovieOrderByTitle(now);
		for(Movie movie : movieList) {
			List<Attachment> attachList = movieDao.selectOneAttachment(movie.getNo());
			movie.setAttachments(attachList);
		}
		return movieList;
	}



	

}
