package com.sh.j3l.event.model.service;

import java.util.List;

import com.sh.j3l.event.model.dto.Category;
import com.sh.j3l.event.model.dto.Event;

public interface EventService {

	int insertEvent(Event event);

	//EventServiceImpl에서 구현
	List<Event> selectAllEvent(Category category);

	int deleteEvent(int no);

	Event selectOneEvent(int no);

	List<Event> selectEventByCategoryAndOffset(Category category, int offset, int size);

	int countEventByCategory(Category category);

}
