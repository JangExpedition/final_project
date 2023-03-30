package com.sh.j3l.event.model.service;

import java.util.List;

import com.sh.j3l.event.model.dto.Event;

public interface EventService {

	int insertEvent(Event event);

	List<Event> selectAllEvent();

	int deleteEvent(int no);

	Event selectOneEvent(int no);

}
