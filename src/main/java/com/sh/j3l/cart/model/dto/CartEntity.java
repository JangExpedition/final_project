package com.sh.j3l.cart.model.dto;

import java.util.List;

import com.sh.j3l.store.model.dto.Store;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartEntity {

	private int no;
	private String id;
	private String storeName;
	private int storePrice;
	private int storeCount;
}
