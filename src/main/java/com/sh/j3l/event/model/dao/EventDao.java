package com.sh.j3l.event.model.dao;


import java.util.List;

import com.sh.j3l.event.model.dto.Category;
import org.apache.ibatis.annotations.Mapper;

import com.sh.j3l.event.model.dto.Event;
import com.sh.j3l.event.model.dto.EventAttachment;

@Mapper
public interface EventDao {

	int insertEvent(Event event);

	int insertEventAttachment(EventAttachment attach);

	List<Event> selectAllEvent(Category category);

	int deleteEvent();

	Event selectOneEvent(int no);

}
