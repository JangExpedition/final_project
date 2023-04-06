package com.sh.j3l.store.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.j3l.store.model.dao.StoreDao;
import com.sh.j3l.store.model.dto.SnackCategory;
import com.sh.j3l.store.model.dto.Store;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDao storeDao;

	@Override
	public int insertStore(Store store) {
		return storeDao.insertStore(store);
	}

	@Override
	public List<Store> selectAllStoreList(SnackCategory snackCategory) {
		log.debug("snackCategory = {}", snackCategory);
		Map<String, SnackCategory> snackCateMap = new HashMap<>();
		snackCateMap.put("snackCategory", snackCategory);
		return storeDao.selectAllStoreList(snackCateMap);
	}

}
