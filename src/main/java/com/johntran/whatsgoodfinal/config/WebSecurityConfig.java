package com.johntran.whatsgoodfinal.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {
	//=============SECURITY================
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception{	
		http
		    	.authorizeHttpRequests()
	            	.requestMatchers("/admin/**").hasRole("ADMIN")
	            	.requestMatchers("/", "/home","/business/**","/item/**","/user/**").authenticated()
	                .anyRequest().permitAll()
	                .and()
	            .formLogin()
	                .permitAll()
	                .loginPage("/login")
	                .usernameParameter("email") // Use email instead of userName for login purposes
	                .defaultSuccessUrl("/home")
	                .and()
	            .logout()
	                .permitAll()
	                .and()
	            .exceptionHandling()
	                .accessDeniedPage("/access-denied");  
	                ;
		
		return http.build();
	}
	
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
    } 
}