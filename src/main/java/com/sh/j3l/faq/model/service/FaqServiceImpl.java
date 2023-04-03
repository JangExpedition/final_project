package com.sh.j3l.faq.model.service;

import java.util.List;
import java.util.Map;

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
	public List<Faq> searchByTitle(String title) {
		return faqDao.searchByTitle(title);
	}

	@Override
	public Faq selectOneFaq(int no) {
		return faqDao.selectOneFaq(no);
	}

	@Override
	public int deleteFaq(Integer no) {
		return faqDao.deleteFaq(no);
	}

	@Override
	public List<Faq> searchByContent(String keyword) {
		return faqDao.searchByContent(keyword);
	}

	@Override
	public int faqUpdate(Faq faq) {
		return faqDao.faqUpdate(faq);
	}

	@Override
	public List<Faq> selectAllFaq(Map<String, Object> param) {
		return faqDao.selectAllFaq(param);
	}



}
