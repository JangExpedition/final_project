package com.sh.j3l.notice.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.sh.j3l.notice.model.dto.Notice;

public interface NoticeService {

	List<Notice> selectAllNotice();

	int insertNotice(Notice notice);

	List<Notice> searchByTitle(String title);

	Notice selectOneNotice(int no);

	int deleteNotice(Integer no);

	Notice selectNoticeByNo(int i);

}
