package com.sh.j3l.event.model.service;

import java.time.LocalDateTime;
import java.util.List;

import com.sh.j3l.event.model.dto.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.j3l.event.model.dao.EventDao;
import com.sh.j3l.event.model.dto.Event;
import com.sh.j3l.event.model.dto.EventAttachment;

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
	public List<Event> pagingAllEvent(Category category, int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		return eventDao.pagingAllEvent(category, offset, pageSize);
	}

	@Override
	public int totalPageCount(Category category, int pageSize) {
		int totalCount = eventDao.count(category);
		int pageCount = totalCount / pageSize;
		if(totalCount % pageSize > 0) {
			pageCount++;
		}
		return pageCount;
	}

	@Override
	public int deleteEvent(int no) {
		return eventDao.deleteEvent(no);
	}

	@Override
	public Event selectOneEvent(int no) {
		return eventDao.selectOneEvent(no);
	}

//	@Transactional(rollbackFor = Exception.class)
//	@Override
//	public List<Event> selectAllEventList() {
//		
//		List<Event> eventList = eventDao.selectAllEventList();
//		
//		 for (Event event : eventList) {
//	            List<EventAttachment> attachments = eventDao.selectEventAttachment(event.getNo());
//	            for (EventAttachment attachment : attachments) {
//	                event.addAttachment(attachment);
//	            }
//	        }
//		
//		return eventList;
//	}


}
