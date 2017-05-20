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
public class TestQueryService {
	
	@Autowired
	private QueryService queryService;
	
	@Test
	public void testGetInformations(){
		System.out.println(queryService.getInformations("测试").toArray().toString());
	}

}
