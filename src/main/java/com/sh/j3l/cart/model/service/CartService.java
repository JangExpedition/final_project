package com.sh.j3l.cart.model.service;

import java.util.List;

import com.sh.j3l.cart.model.dto.Cart;

public interface CartService {

	List<Cart> insertCart(String name, String id, int price);

	List<Cart> selectAllMyCart(String id);

	int deleteMyCart(String id);

	int deleteMyOneCart(int no);

	int updateCart(int no, int count);

	int cartPayment(String id, int totalPayment, int usePoint, String pickupZone);

}
