package com.sh.j3l.store.model.service;

import java.util.List;

import com.sh.j3l.store.model.dto.SnackCategory;
import com.sh.j3l.store.model.dto.Store;

public interface StoreService {

	int insertStore(Store store);

	List<Store> selectAllStoreList(SnackCategory snackCategory);

}
