package com.sh.j3l.storeOrder.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.j3l.storeOrder.model.dao.StoreOrderDao;
import com.sh.j3l.storeOrder.model.dto.StoreOrder;

@Service
public class StoreOrderServiceImpl implements StoreOrderService {

	@Autowired
	private StoreOrderDao storeOrderDao;
	
	@Override
	public List<StoreOrder> selectAllMyOrderList(String id) {
		return storeOrderDao.selectAllMyOrderList(id);
	}

}
