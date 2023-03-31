package com.sh.j3l.movie.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sh.j3l.movie.model.dto.Attachment;
import com.sh.j3l.movie.model.dto.Movie;

@Mapper
public interface MovieDao {
	
	List<Movie> selectAllMovie();
	
	int insertMovie(Movie movie);

	int insertAttachment(Attachment attach);

	Movie selectOneMovie(int no);

	int updateMovie(Movie movie);

	int deleteMovie(Integer no);

	List<Movie> searchByTitle(String title);

	@Select("select * from movie")
	List<Movie> selectAllMovieList();

	@Select("select * from movie_attachment where movie_no = #{no}")
	List<Attachment> selectOneAttachment(int no);

	@Select("select * from movie where open_dt < #{now} order by reservation_count desc")
	List<Movie> selectAllOnScreenOrderByReservationCnt(String now);

	@Select("select * from movie where open_dt < #{now} order by title")
	List<Movie> selectAllMovieOnScreenOrderByTitle(String now);

	@Select("select * from movie order by reservation_count desc")
	List<Movie> selectAllMovieOrderByReservationCnt();

	@Select("select * from movie where open_dt > #{now} order by reservation_count desc")
	List<Movie> selectAllMovieToBeScreened(String now);

	@Select("select running_time from movie where no = #{movieNo}")
	int getMovieRunningTime(int movieNo);

	@Update("update movie set reservation_count = reservation_count + 1 where no = #{movieNo}")
	int updateMovieReservationCount(int movieNo);

}
