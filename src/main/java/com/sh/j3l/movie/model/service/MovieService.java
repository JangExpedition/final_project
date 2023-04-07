package com.sh.j3l.movie.model.service;

import java.util.List;

import com.sh.j3l.member.model.dto.Member;
import com.sh.j3l.movie.model.dto.Attachment;
import com.sh.j3l.movie.model.dto.Movie;

public interface MovieService {
	
	List<Movie> selectAllMovie();
	
	int insertMovie(Movie movie);
	
	int insertAttachment(Attachment attach);

	Movie selectOneMovie(int no);

	int updateMovie(Movie movie);

	int deleteMovie(Integer no);

	List<Movie> searchByTitle(String title);

	// 영화 목록 전체 가져오기
	List<Movie> selectAllMovieList();
	
	// 영화 목록 전체 예매율순으로 가져오기
	List<Movie> selectAllMovieOrderByReservationCnt();

	// 현재 상영중인 영화 예매율 순으로 가져오기
	List<Movie> selectAllOnScreenOrderByReservationCnt(String now);

	// 현재 상영중인 영화 가나다 순으로 가져오기
	List<Movie> selectAllMovieOnScreenOrderByTitle(String now);

	// 상영 예정작 예매율 순으로 불러오기
	List<Movie> selectAllMovieToBeScreened(String now);

	int getMovieRunningTime(int movieNo);

	List<Member> pagingAllMovie(int page, int pageSize);

	int totalPageCount(int pageSize);

}
