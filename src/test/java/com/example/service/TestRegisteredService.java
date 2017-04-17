package com.example.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class TestRegisteredService {
	
	@Autowired
	private RegisteredService registeredService;
	
	@Test
	public void testRegisteredService(){
		
		registeredService.registered("yangwang", "123");
		
	}

}
