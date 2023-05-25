package com.johntran.whatsgoodfinal.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class WebSecurityConfig {
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
	            	.requestMatchers("/", "/dashboard","/business/**","/item/**").authenticated()
	                .anyRequest().permitAll()
	                .and()
	            .formLogin()
	                .permitAll()
	                .loginPage("/login")
	                .usernameParameter("email") // Use email instead of userName for login purposes
	                .defaultSuccessUrl("/")
	                .and()
	            .logout()
	                .permitAll();
		
		return http.build();
	}
	
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
    } 
}