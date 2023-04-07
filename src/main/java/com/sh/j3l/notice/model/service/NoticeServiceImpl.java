package com.sh.j3l.notice.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.j3l.faq.model.dao.FaqDao;
import com.sh.j3l.notice.model.dao.NoticeDao;
import com.sh.j3l.notice.model.dto.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public List<Notice> selectAllNotice() {
		return noticeDao.selectAllNotice();
	}

	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}

	@Override
	public List<Notice> searchByTitle(String title) {
		return noticeDao.searchByTitle(title);
	}

	@Override
	public Notice selectOneNotice(int no) {
		return noticeDao.selectOneNotice(no);
	}

	@Override
	public int deleteNotice(Integer no) {
		return noticeDao.deleteNotice(no);
	}

	@Override
	public Notice selectNoticeByNo(int i) {
		return noticeDao.selectNoticeByNo(i);
	}

	@Override
	public List<Notice> searchByContent(String keyword) {
		return noticeDao.searchByContent(keyword);
	}

	@Override
	public int noticeUpdate(Notice notice) {
		return noticeDao.noticeUpdate(notice);
	}

	@Override
	public List<Notice> pagingAllNotice(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		return noticeDao.pagingAllNotice(offset, pageSize);
	}

	@Override
	public int totalPageCount(int pageSize) {
		int totalCount = noticeDao.count();
		int pageCount = totalCount / pageSize;
		if(totalCount % pageSize > 0) {
			pageCount++;
		}
		return pageCount;
	}
	

}
