package com.sh.j3l.notice.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.sh.j3l.notice.model.dto.Notice;

@Mapper
public interface NoticeDao {

	List<Notice> selectAllNotice();

	int insertNotice(Notice notice);

	List<Notice> searchByTitle(String title);

	Notice selectOneNotice(int no);

	int deleteNotice(Integer no);

	Notice selectNoticeByNo(int i);

	List<Notice> searchByContent(String keyword);

	int noticeUpdate(Notice notice);

	List<Notice> pagingAllNotice(@Param("offset") int offset, @Param("pageSize") int pageSize);

	int count();

	

}
