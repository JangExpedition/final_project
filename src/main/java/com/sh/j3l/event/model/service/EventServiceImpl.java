package com.sh.j3l.event.model.service;

import java.util.List;

import com.sh.j3l.event.model.dto.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.event.model.dao.EventDao;
import com.sh.j3l.event.model.dto.Event;
import com.sh.j3l.event.model.dto.EventAttachment;
import com.sh.j3l.movie.model.dto.Attachment;

@Service
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventDao eventDao;

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertEvent(Event event) {
		
		int result = eventDao.insertEvent(event);
		
		List<EventAttachment> attachments = event.getAttachments();
		if(attachments.size() > 0) {
			for(EventAttachment attach : attachments) {
				attach.setEventNo(event.getNo());
				result = insertEventAttachment(attach);
			}
		}
		return result;
	}

	private int insertEventAttachment(EventAttachment attach) {
		return eventDao.insertEventAttachment(attach);
	}

	@Override
	public List<Event> selectAllEvent(Category category) {
		//Category가 SPECIAL인 이벤트만 가져오기 -> 쿼리는 /src/main/resources/mapper/event/event-mapper.xml 확인
		return eventDao.selectAllEvent(category);
	}

	@Override
	public int deleteEvent(int no) {
		return eventDao.deleteEvent();
	}

	@Override
	public Event selectOneEvent(int no) {
		return eventDao.selectOneEvent(no);
	}

}
