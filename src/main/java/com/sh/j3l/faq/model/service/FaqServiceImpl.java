package com.sh.j3l.faq.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.j3l.faq.model.dao.FaqDao;
import com.sh.j3l.faq.model.dto.Faq;

@Service
public class FaqServiceImpl implements FaqService{
	
	@Autowired
	private FaqDao faqDao;

	@Override
	public int insertFaq(Faq faq) {
		return faqDao.insertFaq(faq);
	}

	@Override
	public List<Faq> selectAllFaq(RowBounds rowBounds) {
		return faqDao.selectAllFaq(rowBounds);
	}

	@Override
	public List<Faq> searchByTitle(String title) {
		return faqDao.searchByTitle(title);
	}

	@Override
	public Faq selectOneFaq(int no) {
		return faqDao.selectOneFaq(no);
	}



}
