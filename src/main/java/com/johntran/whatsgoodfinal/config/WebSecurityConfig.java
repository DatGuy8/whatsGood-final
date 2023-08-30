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
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {
	// =============SECURITY================
	@Autowired
	private UserDetailsService userDetailsService;

	@Autowired
	HandlerMappingIntrospector introspector;

	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.authorizeHttpRequests(auth -> auth.requestMatchers(new MvcRequestMatcher(introspector, "/admin/**"))
				.hasRole("ADMIN")
				.requestMatchers(
						new MvcRequestMatcher(introspector, "/"), 
						new MvcRequestMatcher(introspector, "/home"),
						new MvcRequestMatcher(introspector, "/business/**"),
						new MvcRequestMatcher(introspector, "/item/**"),
						new MvcRequestMatcher(introspector, "/user/**"))
				.authenticated().anyRequest().permitAll())
				.formLogin(form -> form.loginPage("/login").defaultSuccessUrl("/home").usernameParameter("email")
						.permitAll())
				.logout(logout -> logout.permitAll())
				.exceptionHandling(exceptionHandling -> exceptionHandling.accessDeniedPage("/access-denied"))

		;

		return http.build();
	}

//	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception{	
//		http
//		    	.authorizeHttpRequests()
//	            	.requestMatchers("/admin/**").hasRole("ADMIN")
//	            	.requestMatchers("/", "/home","/business/**","/item/**","/user/**").authenticated()
//	                .anyRequest().permitAll()
//	                .and()
//	            .formLogin()
//	                .permitAll()
//	                .loginPage("/login")  
//	                .usernameParameter("email") // Use email instead of userName for login purposes
//	                .defaultSuccessUrl("/home")
//	                .and()
//	            .logout()
//	                .permitAll()
//	                .and()
//	            .exceptionHandling()
//	                .accessDeniedPage("/access-denied");
//	                ;
//		
//		return http.build();
//	}

	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
	}
}