package com.sh.j3l.movie.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.j3l.common.HelloSpringUtils;
import com.sh.j3l.movie.model.dto.Attachment;
import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.movie.model.service.MovieService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private ServletContext application;
	
	@GetMapping("/movie.do")
	public void movie() {}
	
	// 영화 목록 조회
	@GetMapping("/movieList.do")
	public String moiveList(@RequestParam(defaultValue = "1") int cpage, Model model) {
		//페이징처리 RowBounds 이용 
		int limit = 20;
		int offset = (cpage - 1) * limit; 
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Movie> movieList = movieService.selectAllMovie(rowBounds);
		model.addAttribute("movieList", movieList);
		return "movie/movieList";
	}
	
	// 영화 목록 가져오기 비동기
	@GetMapping("/selectAllMovieList.do")
	@ResponseBody
	public List<Movie> selectAllMovieList() {
		return movieService.selectAllMovieList();
	}
	
	// 영화 등록 폼
	@GetMapping("/movieForm.do")
	public void movieForm() {}
	
	// 영화 등록
	@PostMapping("/movieEnroll.do")
	public String movieEnroll(Movie movie, RedirectAttributes redirectAttr, @RequestParam("upFile") List<MultipartFile> upFiles) {

		log.debug("movie.openDt ={}", movie.getOpenDt());
		
		String saveDirectory = application.getRealPath("/resources/upload/movie");
		
		for(MultipartFile upFile : upFiles) {
			
			if(upFile.getSize() > 0) {
				
				String renamedFilename = HelloSpringUtils.renameMultipartFile(upFile);
				String originalFilename = upFile.getOriginalFilename();
				File destFile = new File(saveDirectory, renamedFilename);
				try {
					upFile.transferTo(destFile);
				} catch (IllegalStateException | IOException e) {
					log.error(e.getMessage(), e);
				}
						
				Attachment attach = new Attachment();
				attach.setRenamedFilename(renamedFilename);
				attach.setOriginalFilename(originalFilename);
				movie.addAttachment(attach);
			}
					
		}
		
		log.debug("movie = {}", movie);
		int result = movieService.insertMovie(movie);
		
		redirectAttr.addFlashAttribute("msg", "영화 정보 등록 성공!");
		
		return "redirect:/movie/movieList.do";
	}

	
	
	// 영화 수정폼
	@GetMapping("/movieDetail.do")
	public void movieDetail(@RequestParam(name = "no", required = false) Integer no, Model model) {
		// no가 null인 경우에 대한 처리 추가하기..
		// no가 null인 경우에는 처리하지 않고 그냥 넘어가도록 하기..
		if(no == null) {
			
		} else {
			log.debug("no = {}", no);
			Movie movie = movieService.selectOneMovie(no);
			log.debug("movie = {}", movie);
			
			model.addAttribute("movie", movie);
			model.addAttribute("no", no);
			
		}
		
		
	}
	
	// 영화 수정 요청
	@PostMapping("/updateMovie.do")
	public String updateMovie(Movie movie, RedirectAttributes redirectAttr) {
		
		int result = movieService.updateMovie(movie);
		log.debug("movie = {}", movie);
		
		if(result > 0) {
			redirectAttr.addFlashAttribute("msg", "영화 정보 수정 성공");	
		} else {
			redirectAttr.addFlashAttribute("msg", "영화 정보 수정 실패");
		}
			
		return "redirect:/movie/movieList.do";
	}
	
	// 영화 삭제 요청
	@PostMapping("deleteMovie.do")
	public String deleteMovie(Integer no, RedirectAttributes redirecAttr) {
		
		int result = movieService.deleteMovie(no);
		log.debug("no = {}", no);
		
		if(result > 0) {
			redirecAttr.addFlashAttribute("msg", "영화 정보 삭제 성공");			
		} else {
			redirecAttr.addFlashAttribute("msg", "영화 정보 삭제 실패");
		}
		return "redirect:/movie/movieList.do";
		
	}
	
	// 영화 검색
	@GetMapping("searchMovie")
	public String searchMovie(@RequestParam(name = "title") String title, Model model) {
	    
	    List<Movie> searchMovie = movieService.searchByTitle(title);
	    log.debug("searchMovie = {}", searchMovie);
	    
	    model.addAttribute("movieList", searchMovie);
	    
	    return "movie/movieList";
	}
	

}
