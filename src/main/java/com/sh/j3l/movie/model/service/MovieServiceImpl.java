package com.sh.j3l.movie.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.movie.model.dao.MovieDao;
import com.sh.j3l.movie.model.dto.Attachment;
import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.movie.model.dto.MovieEntity;

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

	@Override
	public int insertMovie(Movie movie) {
		// 게시글 등록
		int result = movieDao.insertMovie(movie);
		log.debug("movie = {}", movie);
		
		// 첨부파일 등록
		List<Attachment> attachments = movie.getAttachments();
		if(attachments.size() > 0) {
			for(Attachment attach :attachments) {
				attach.setMovieNo(movie.getNo());
				result = insertAttachment(attach);
			}
		}
		return movieDao.insertMovie(movie);
	}


	@Override
	public int insertAttachment(Attachment attach) {
		// TODO Auto-generated method stub
		return movieDao.insertAttachment(attach);
	}

	

}
