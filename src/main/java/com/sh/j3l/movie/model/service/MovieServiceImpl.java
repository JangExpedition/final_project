package com.sh.j3l.movie.model.service;

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
	public List<Movie> selectMovieList(RowBounds rowBounds) {
		return movieDao.selectMovieList(rowBounds);
	}

	@Override
	public int insertMovie(Movie movie) {
		
		int result = movieDao.insertMovie(movie);
		log.debug("movie = {}", movie);
		
		// 첨부파일 등록
		List<Attachment> attachments = movie.getAttachments();
		if(attachments.size() > 0) {
			for(Attachment attach : attachments) {
				attach.setMovieNo(movie.getNo()); // fk 설정!
				result = insertAttachment(attach);
			}
		}
		return result;
	}
	
	private int insertAttachment(Attachment attach) {
		// TODO Auto-generated method stub
		return movieDao.insertAttachment(attach);
	}

	@Override
	public Movie selectOneMovie(int no) {
		Movie movie = movieDao.selectOneMovie(no);
		List<Attachment> attachments = movieDao.selectAttachmentListByMovieNo(no);
		movie.setAttachments(attachments);
		return movie;	
	}
	
	@Override
	public Movie selectOneMovieCollection(int no) {
		return movieDao.selectOneMovieCollection(no);
	}
	
	@Override
	public Attachment selectOneAttachment(int no) {
		return movieDao.selectOneAttachment(no);
	}

	

}
