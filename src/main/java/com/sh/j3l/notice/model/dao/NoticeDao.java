package com.sh.j3l.notice.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.sh.j3l.notice.model.dto.Notice;

@Mapper
public interface NoticeDao {

	List<Notice> selectAllNotice(RowBounds rowBounds);

	int insertNotice(Notice notice);

	

}
