package com.sh.j3l.faq.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.sh.j3l.faq.model.dto.Faq;

public interface FaqService {

	int insertFaq(Faq faq);

	List<Faq> selectAllFaq(Map<String, Object> param);

	List<Faq> searchByTitle(String title);

	Faq selectOneFaq(int no);

	int deleteFaq(Integer no);

	List<Faq> searchByContent(String keyword);

	int faqUpdate(Faq faq);

}
