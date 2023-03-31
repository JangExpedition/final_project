package com.sh.j3l.movie.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.movie.model.dao.MovieDao;
import com.sh.j3l.movie.model.dto.Attachment;
import com.sh.j3l.movie.model.dto.Movie;

@Transactional
@Service
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private MovieDao movieDao;
	
	@Override
	public List<Movie> selectAllMovie() {
		return movieDao.selectAllMovie();
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
		Movie movie = movieDao.selectOneMovie(no);
		List<Attachment> attachList = movieDao.selectOneAttachment(movie.getNo());
		movie.setAttachments(attachList);
		return movie;
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
	public List<Movie> selectAllOnScreenOrderByReservationCnt(String now) {
		List<Movie> movieList = movieDao.selectAllOnScreenOrderByReservationCnt(now);
		for(Movie movie : movieList) {
			List<Attachment> attachList = movieDao.selectOneAttachment(movie.getNo());
			movie.setAttachments(attachList);
		}
		return movieList;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Movie> selectAllMovieOnScreenOrderByTitle(String now) {
		List<Movie> movieList = movieDao.selectAllMovieOnScreenOrderByTitle(now);
		for(Movie movie : movieList) {
			List<Attachment> attachList = movieDao.selectOneAttachment(movie.getNo());
			movie.setAttachments(attachList);
		}
		return movieList;
	}

	@Override
	public List<Movie> selectAllMovieOrderByReservationCnt() {
		List<Movie> movieList = movieDao.selectAllMovieOrderByReservationCnt();
		for(Movie movie : movieList) {
			List<Attachment> attachList = movieDao.selectOneAttachment(movie.getNo());
			movie.setAttachments(attachList);
		}
		return movieList;
	}

	@Override
	public List<Movie> selectAllMovieToBeScreened(String now) {
		List<Movie> movieList = movieDao.selectAllMovieToBeScreened(now);
		for(Movie movie : movieList) {
			List<Attachment> attachList = movieDao.selectOneAttachment(movie.getNo());
			movie.setAttachments(attachList);
		}
		return movieList;
	}

	@Override
	public int getMovieRunningTime(int movieNo) {
		return movieDao.getMovieRunningTime(movieNo);
	}



	

}
