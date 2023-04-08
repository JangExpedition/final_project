package com.sh.j3l.storeOrder.model.service;

import java.util.List;

import com.sh.j3l.storeOrder.model.dto.StoreOrder;

public interface StoreOrderService {

	List<StoreOrder> selectAllMyOrderList(String id);

}
