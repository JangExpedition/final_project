package com.sh.j3l.store.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.j3l.cinema.model.dto.Cinema;
import com.sh.j3l.cinema.model.service.CinemaService;
import com.sh.j3l.common.HelloSpringUtils;
import com.sh.j3l.movie.model.dto.Attachment;
import com.sh.j3l.movie.model.dto.Movie;
import com.sh.j3l.store.model.dto.SnackCategory;
import com.sh.j3l.store.model.dto.Store;
import com.sh.j3l.store.model.service.StoreService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/store")
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private CinemaService cinemaService;
	
	@GetMapping("/store.do")
	public void stored() {}
	
	@GetMapping("/snackEnroll.do")
	public void snackForm(Model model) {
		
		List<Cinema> cinemaList = cinemaService.selectAllCinema();
		
		log.debug("cinemaList", cinemaList);
		
		model.addAttribute("cinemaList", cinemaList);
		
	}
	
}
