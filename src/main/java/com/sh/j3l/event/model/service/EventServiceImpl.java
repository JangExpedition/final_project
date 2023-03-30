package com.sh.j3l.event.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.j3l.event.model.dao.EventDao;

@Service
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventDao eventDao;

}
