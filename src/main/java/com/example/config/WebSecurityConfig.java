package com.example.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.StandardPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private DataSource dataSource;

	@Autowired
	public void configure(AuthenticationManagerBuilder auth) throws Exception{
		auth
		    .jdbcAuthentication()
		        .dataSource(dataSource)
		            .usersByUsernameQuery("select username,password,enabled from user where username=?")
		            .authoritiesByUsernameQuery("select username,rolename from user_role where username=?")
//		            .passwordEncoder(new StandardPasswordEncoder())  //使用转码后的密码
		            ;
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http
//		    .csrf().disable()
			.authorizeRequests()			    
			    .antMatchers("/main").access("hasRole('ROLE_USER') or hasRole('ROLE_VIP')")
			    .mvcMatchers("/back").hasRole("ADMIN")
			    .antMatchers("/VIP").hasRole("VIP")
			    .antMatchers("/helloworld").authenticated()
				.anyRequest().authenticated()
			    .anyRequest().permitAll()
			.and()
//			.requiresChannel()
//			    .antMatchers("/main").requiresSecure()  //需要HTTPS传输
//			.and()
			.rememberMe()
			    .tokenValiditySeconds(2419200)
			.and()
			.logout()
			    .deleteCookies("JSESSIONID")  //退出成功后删除cookies
//			    .logoutUrl("")  //设置触发注销操作的URL(默认是logout)
			    .logoutSuccessUrl("/index.jsp")  //注销成功后跳转的页面
			    .invalidateHttpSession(true)  //注销时使session无效
			    .clearAuthentication(true) //注销时清除身份验证
			.and()
			.exceptionHandling()
			    .accessDeniedPage("/DenyAccess")
			.and()
			.formLogin()
			    .loginPage("/login")  //自定义登录页
			    .permitAll()
			    .defaultSuccessUrl("/index.jsp")   //登录成功后默认跳转页面
			    .failureUrl("/failure")	  //登录失败后跳转的页面
			.and()
			.httpBasic()
		    .and()
		    .sessionManagement()  ////启动session并发管理
		        .maximumSessions(1)  //最大同时登录人数
//		        .maxSessionsPreventsLogin(true) //如果true，达到最大人数后再认证会被拒绝
		        .expiredUrl("/session") //如果认证已过期，当前用户尝试访问会跳转的界面
		        ;
	}
	
}
