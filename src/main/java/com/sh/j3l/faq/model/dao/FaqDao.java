package com.sh.j3l.faq.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.sh.j3l.faq.model.dto.Faq;

@Mapper
public interface FaqDao {

	int insertFaq(Faq faq);

	List<Faq> selectAllFaq(RowBounds rowBounds);

	List<Faq> searchByTitle(String title);

	Faq selectOneFaq(int no);


}
