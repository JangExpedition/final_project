package com.sh.j3l.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.sh.j3l.cart.model.dto.Cart;
import com.sh.j3l.cart.model.service.CartService;
import com.sh.j3l.member.model.dto.Member;

@Controller
@RequestMapping("/cart")
@SessionAttributes({"totalCartCount"})
public class CartController {

	@Autowired
	private CartService cartService;
	
	@GetMapping("/cart.do")
	public void cart(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member loginMember = (Member) authentication.getPrincipal();
		String id = loginMember.getId();
		List<Cart> cartList = cartService.selectAllMyCart(id);
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
}
