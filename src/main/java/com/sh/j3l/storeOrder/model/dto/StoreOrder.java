package com.sh.j3l.storeOrder.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreOrder {

	private int no;
	private String pickupZone;
	private String storeName;
	private int storePrice;
	private int storeCount;
	private Date orderDate;
}
