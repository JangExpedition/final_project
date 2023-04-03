package com.sh.j3l.event.model.service;

import java.time.LocalDateTime;
import java.util.List;

import com.sh.j3l.event.model.dto.Category;
import com.sh.j3l.event.model.dto.Event;
import com.sh.j3l.event.model.dto.EventAttachment;

public interface EventService {

	int insertEvent(Event event);

	//EventServiceImpl에서 구현
	List<Event> selectAllEvent(Category category);

	List<Event> pagingAllEvent(Category category, int page, int pageSize);

	int totalPageCount(Category category, int pageSize);

	int deleteEvent(int no);

	Event selectOneEvent(int no);

//	List<Event> selectAllEventList();




}
