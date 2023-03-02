package com.sh.j3l.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/customer")
public class CustomerController {
	
//	@Autowired
//	private CustomerService customerService;
	
	@GetMapping("customer.do")
	public void customer() {}
	
	@GetMapping("/faq.do")
	public String faq() {
		
		return "customer/faq";
	}

}
