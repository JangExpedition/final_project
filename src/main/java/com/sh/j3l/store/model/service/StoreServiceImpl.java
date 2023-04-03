package com.sh.j3l.store.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.j3l.store.model.dao.StoreDao;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDao stireDao;
}
