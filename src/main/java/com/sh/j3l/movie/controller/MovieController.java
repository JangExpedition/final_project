package com.sh.j3l.movie.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.sh.j3l.common.HelloSpringUtils;
import com.sh.j3l.member.model.dto.Member;
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
	
	private static final int PAGE_LIMIT = 5;
	
	@GetMapping("/movie.do")
	public void movie(HttpServletRequest request,@RequestParam int checked, Model model) {
		
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		List<Movie> movieList = new ArrayList<>();
        if(null != inputFlashMap) {
            movieList = (List<Movie>) inputFlashMap.get("movieList");
            model.addAttribute("movieList", movieList);
        }
        else {
        	movieList = (List<Movie>) movieService.selectAllMovieOrderByReservationCnt();
        	model.addAttribute("movieList", movieList);
        }
        
        model.addAttribute("checked", checked);
	}
	
	// 현재 상영중인 영화 목록 가져오기 필터 분기 메서드
	@GetMapping("/onScreenFilter.do")
	public String onScreenFilter(@RequestParam(defaultValue = "0") int checked, RedirectAttributes redirectAttr) {
		log.debug("checked = {}", checked);
		List<Movie> movieList = new ArrayList<>();
		if(checked == 0) {
			 movieList = movieService.selectAllMovieOrderByReservationCnt();
		}
		else {
			String now = LocalDate.now().toString();
			movieList = movieService.selectAllOnScreenOrderByReservationCnt(now);
		}
		
		redirectAttr.addAttribute("checked", checked);
		redirectAttr.addFlashAttribute("movieList", movieList);
		
		return "redirect:/movie/movie.do";
	}
	
	// 영화 목록 조회 with 페이징처리
	@GetMapping("/movieList.do")
	public void movieList(Model model, @RequestParam(value = "page", required = false) Integer page) {
		if (page == null || page == 0) {
			page = 1;
		}
		
		List<Member> movieList = movieService.pagingAllMovie(page, PAGE_LIMIT);
		int totalPage = movieService.totalPageCount(PAGE_LIMIT);

	    model.addAttribute("movieList", movieList);
	    model.addAttribute("page", page);
	    model.addAttribute("totalPages", totalPage);
	    
	    log.debug("movieList", movieList);
	}
	
	// 영화 목록 가져오기 비동기
	@GetMapping("/selectAllMovieList.do")
	@ResponseBody
	public List<Movie> selectAllMovieList(@RequestParam String name) {
		
		if("무비차트".equals(name)) {
			return movieService.selectAllMovieOrderByReservationCnt();
		}
		else {
			String now = LocalDate.now().toString();
			return movieService.selectAllMovieToBeScreened(now);
		}
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
	public void movieDetail(@RequestParam int no, Model model) {

			log.debug("no = {}", no);
			Movie movie = movieService.selectOneMovie(no);
			log.debug("movie = {}", movie);
			
			model.addAttribute("movie", movie);
			model.addAttribute("no", no);
			
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
	@PostMapping("/deleteMovie.do")
	public String deleteMovie(int no, RedirectAttributes redirectAttr) {
		
		int result = movieService.deleteMovie(no);
		log.debug("no = {}", no);
		
		if(result > 0) {
			redirectAttr.addFlashAttribute("msg", "영화 정보 삭제 성공");			
		} else {
			redirectAttr.addFlashAttribute("msg", "영화 정보 삭제 실패");
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
	
	@GetMapping("/movieInfo.do")
	public void movieInfo(@RequestParam int no, Model model) {
		Movie movie = movieService.selectOneMovie(no);
		model.addAttribute("movie", movie);
	}
	

}
