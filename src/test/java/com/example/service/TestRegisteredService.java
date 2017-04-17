package com.example.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@SpringBootTest
public class TestRegisteredService {
	
	@Autowired
	private RegisteredService registeredService;
	
	@Test
	public void testRegisteredService(){
		
		registeredService.registered("yangwang", "123");
		
	}

}
