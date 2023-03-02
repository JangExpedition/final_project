package com.sh.j3l.movie.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.j3l.common.HelloSpringUtils;
import com.sh.j3l.movie.model.dto.Attachment;
import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.movie.model.service.MovieService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@GetMapping("/movieList.do")
	public void movieList(@RequestParam(defaultValue = "1") int cpage, Model model) {
		// 페이징처리 RowBounds 이용 
		int limit = 10;
		int offset = (cpage - 1) * limit; 
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Movie> movieList = movieService.selectMovieList(rowBounds);
		log.debug("movieList = {}", movieList);
		model.addAttribute("movieList", movieList);
	}
	
	@GetMapping("/movieForm.do")
	public void movieForm() {}
	
	
	@PostMapping("/movieEnroll")
	public String insertMovie(
			Movie movie,
			@RequestParam("upFile") List<MultipartFile> upFiles,
			RedirectAttributes redirecAttr) {
		
		String saveDirctory = application.getRealPath("/resources/upload/movie");
		log.debug("saveDirectory = {}", saveDirctory);
		
		// 첨부파일 저장 및 Attachment 객체 생성
		for(MultipartFile upFile : upFiles) {
			log.debug("upFile = {}", upFile);
			
			if(upFile.getSize() > 0) {
				// 1.저장
				String renamedFilename = HelloSpringUtils.renameMultipartFile(upFile);
				String originalFilename = upFile.getOriginalFilename();
				File destFile = new File(saveDirctory, renamedFilename);
				try {
					upFile.transferTo(destFile);
				} catch (IllegalStateException | IOException e) {
					log.error(e.getMessage(), e);
				}
				
				// 2. attch 객체 생성 및 Movie에 추가
				Attachment attach = new Attachment();
				attach.setRenamedFilename(renamedFilename);
				attach.setOriginalFilename(originalFilename);
				movie.addAttachment(attach);
			}
		}
		
		log.debug("movie = {}", movie);	
		int result = movieService.insertMovie(movie);
		
		redirecAttr.addFlashAttribute("msg", "영화 정보 등록 성공!");
		
		return "redirect:/admin/movieEnroll.jsp";
	}

}
