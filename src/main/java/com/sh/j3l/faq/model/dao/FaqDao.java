package com.sh.j3l.faq.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.sh.j3l.faq.model.dto.Faq;

@Mapper
public interface FaqDao {

	int insertFaq(Faq faq);

	List<Faq> selectAllFaq();

	List<Faq> searchByTitle(String title);

	Faq selectOneFaq(int no);

	int updateFaq(Faq faq);

	int deleteFaq(Integer no);

	List<Faq> searchByContent(String keyword);

	int faqUpdate(Faq faq);


}
