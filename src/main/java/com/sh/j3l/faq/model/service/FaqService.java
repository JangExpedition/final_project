package com.sh.j3l.faq.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.sh.j3l.faq.model.dto.Faq;

public interface FaqService {

	int insertFaq(Faq faq);

	List<Faq> selectAllFaq(RowBounds rowBounds);

	List<Faq> searchByTitle(String title);

}
