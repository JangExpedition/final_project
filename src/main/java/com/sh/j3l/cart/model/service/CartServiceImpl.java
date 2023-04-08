package com.sh.j3l.cart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.cart.model.dao.CartDao;
import com.sh.j3l.cart.model.dto.Cart;
import com.sh.j3l.member.model.dao.MemberDao;
import com.sh.j3l.member.model.dto.Grade;
import com.sh.j3l.member.model.dto.Member;
import com.sh.j3l.storeOrder.model.dao.StoreOrderDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDao cartDao;
	@Autowired
	private StoreOrderDao storeOrderDao;
	@Autowired
	private MemberDao memberDao;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<Cart> insertCart(String name, String id, int price) {
		List<Cart> cartList = cartDao.selectAllMyCart(id);
		int result = 0;
		// 이미 장바구니가 존재하는 경우
		if(cartList.size() > 0) {
			for(Cart cart : cartList) {
				if(cart.getStoreName().equals(name)) {
					result = 1;
				}
			}
			
			// 이미 해당 메뉴가 장바구니에 있는 경우
			if(result == 1) {
				result = cartDao.storeCountUp(name, id);
			}
			// 해당 메뉴가 장바구니에 없는 경우
			else {
				result = cartDao.insertCart(name, id, price);
			}
		}
		// 장바구니가 없는 경우
		else {
			result = cartDao.insertCart(name, id, price);
		}
		cartList = cartDao.selectAllMyCart(id);
		return cartList;
	}

	@Override
	public List<Cart> selectAllMyCart(String id) {
		return cartDao.selectAllMyCart(id);
	}

	@Override
	public int deleteMyCart(String id) {
		return cartDao.deleteMyCart(id);
	}

	@Override
	public int deleteMyOneCart(int no) {
		return cartDao.deleteMyOneCart(no);
	}

	@Override
	public int updateCart(int no, int count) {
		return cartDao.updateCart(no, count);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int cartPayment(String id, int totalPayment, int usePoint, String pickupZone) {
		int result = 0;
		List<Cart> cartList = cartDao.selectAllMyCart(id);
		for(Cart cart : cartList) {
			result = storeOrderDao.insertOrder(cart, pickupZone);
		}
		
		result = cartDao.deleteMyCart(id);
		
		// 포인트 적립
		Member loginMember = memberDao.selectOneMember(id);
		Grade grade = loginMember.getGrade();
		switch(grade) {
		case FAMILY : result = memberDao.updatePoint(id, usePoint, (int) Math.round(totalPayment * 0.01)); break;
		case SILVER : result = memberDao.updatePoint(id, usePoint, (int) Math.round(totalPayment * 0.03)); break;
		case GOLD : result = memberDao.updatePoint(id, usePoint, (int) Math.round(totalPayment * 0.05)); break;
		case VIP : result = memberDao.updatePoint(id, usePoint, (int) Math.round(totalPayment * 0.07)); break;
		}
		
		return result;
	}
}
