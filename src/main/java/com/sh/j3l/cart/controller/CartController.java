package com.sh.j3l.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sh.j3l.cart.model.dto.Cart;
import com.sh.j3l.cart.model.service.CartService;
import com.sh.j3l.cinema.model.dto.Cinema;
import com.sh.j3l.cinema.model.service.CinemaService;
import com.sh.j3l.member.model.dto.Member;
import com.sh.j3l.member.model.service.MemberService;

@Controller
@RequestMapping("/cart")
@SessionAttributes({"totalCartCount"})
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private CinemaService cinemaService;
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/cart.do")
	public void cart(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member loginMember = (Member) authentication.getPrincipal();
		String id = loginMember.getId();
		List<Cart> cartList = cartService.selectAllMyCart(id);
		List<Cinema> cinemaList = cinemaService.selectAllCinema();
		model.addAttribute("cinemaList", cinemaList);
		model.addAttribute("cartList", cartList);
	}
	
	@PostMapping("/insertCart.do")
	@ResponseBody
	public int insertCart(@RequestParam String name, @RequestParam String id, @RequestParam int price, Model model) {
		List<Cart> cartList = cartService.insertCart(name, id, price);
		int totalCartCount = 0;
		for(Cart cart : cartList) {
			totalCartCount += cart.getStoreCount();
		}
		model.addAttribute("totalCartCount", totalCartCount);
		return totalCartCount;
	}
	
	@PostMapping("/deleteCart.do")
	@ResponseBody
	public String deleteCart(@RequestParam int no) {
		int result = cartService.deleteMyOneCart(no);
		return "정상적으로 삭제됐습니다.";
	}
	
	@PostMapping("/updateCart.do")
	@ResponseBody
	public String updateCart(@RequestParam int no, @RequestParam int count) {
		int result = cartService.updateCart(no, count);
		return "수정완료";
	}
	
	@PostMapping("/cartPayment.do")
	@ResponseBody
	public String cartPayment(
			@RequestParam String id,
			@RequestParam int totalPrice,
			@RequestParam int usePoint,
			@RequestParam String pickupZone,
			Authentication authentication) {
		
		int result = cartService.cartPayment(id, totalPrice, usePoint, pickupZone);
		
		Member newMember = memberService.selectOneMember(id);
		Authentication newAuthentication = new UsernamePasswordAuthenticationToken(
				newMember,
				authentication.getCredentials(),
				authentication.getAuthorities()
				);
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		
		Map<String, Object> responseData = new HashMap<>();
	    responseData.put("msg", "결제가 완료되었습니다. 주문내역은 마이페이지에서 확인 가능합니다.");

	    ObjectMapper mapper = new ObjectMapper();
	    String jsonResponse = "";
	    try {
	        jsonResponse = mapper.writeValueAsString(responseData);
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	    }

	    return jsonResponse;
	}
}
