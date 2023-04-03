package com.sh.j3l.store.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.store.model.dao.StoreDao;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDao storeDao;

}
