package com.sh.j3l.event.model.dao;


import java.time.LocalDateTime;
import java.util.List;

import com.sh.j3l.event.model.dto.Category;
import org.apache.ibatis.annotations.Mapper;

import com.sh.j3l.event.model.dto.Event;
import com.sh.j3l.event.model.dto.EventAttachment;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EventDao {

	int insertEvent(Event event);

	int insertEventAttachment(EventAttachment attach);

	List<Event> selectAllEvent(Category category);

	int deleteEvent(int no);

	Event selectOneEvent(int no);

	List<Event> selectEventByCategoryAndOffset(Category category, int offset, int size);

	int countEventByCategory(Category category);

	List<Event> pagingAllEvent(@Param("category") Category category, @Param("offset") int offset, @Param("pageSize") int pageSize);

	int count(Category category);

	List<EventAttachment> selectEventAttachment(int no);

	List<Event> selectAllEventList();

	
}
