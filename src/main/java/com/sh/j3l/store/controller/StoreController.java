package com.sh.j3l.store.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.j3l.cart.model.dto.Cart;
import com.sh.j3l.cart.model.service.CartService;
import com.sh.j3l.cinema.model.dto.Cinema;
import com.sh.j3l.cinema.model.service.CinemaService;
import com.sh.j3l.common.HelloSpringUtils;
import com.sh.j3l.member.model.dto.Member;
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
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ServletContext application;
	
	@GetMapping("/store.do")
	public void stored(@RequestParam(value = "category", required = false) SnackCategory snackCategory, Model model) {
		log.debug("category = {}", snackCategory);
		List<Store> storeList = storeService.selectAllStoreList(snackCategory);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member loginMember = (Member) authentication.getPrincipal();
		String id = loginMember.getId();
		List<Cart> cartList = cartService.selectAllMyCart(id);
		model.addAttribute("storeList", storeList);
		model.addAttribute("totalCartCount", cartList.size());
	}
	
	@GetMapping("/snackEnroll.do")
	public void snackForm(Model model) {
		
		List<Cinema> cinemaList = cinemaService.selectAllCinema();
		
		log.debug("cinemaList", cinemaList);
		
		model.addAttribute("cinemaList", cinemaList);
		
	}
	
	
	@PostMapping("/snackEnroll.do")
	public String snackEnroll(Store store, MultipartFile upFile, RedirectAttributes redirectAttr) {
		
		String saveDirectory = application.getRealPath("/resources/upload/store");
		
		String renamedFilename = HelloSpringUtils.renameMultipartFile(upFile);
		String originalFilename = upFile.getOriginalFilename();
		File destFile = new File(saveDirectory, renamedFilename);
		
		try {
			upFile.transferTo(destFile);
		} catch (IllegalStateException | IOException e) {
			log.error(e.getMessage(), e);
		}
		
		store.setOriginalFilename(originalFilename);
		store.setRenamedFilename(renamedFilename);
		
		int result = storeService.insertStore(store);
		
		redirectAttr.addFlashAttribute("msg", "메뉴 등록 성공!");
		
		return "redirect:/store/snackEnroll.do";
	}
	
}
