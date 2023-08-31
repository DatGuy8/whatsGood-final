package com.johntran.whatsgoodfinal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class WhatsGoodFinalApplication {

	public static void main(String[] args) {
		SpringApplication.run(WhatsGoodFinalApplication.class, args);
	}
	
	// for AWS DEPLOYMENT
	
//	@Bean
//    public TomcatServletWebServerFactory servletContainer() {
//        TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();
//        Connector ajpConnector = new Connector("AJP/1.3");
//        ajpConnector.setPort(9090);
//        ajpConnector.setSecure(false);
//        ajpConnector.setAllowTrace(false);
//        ajpConnector.setScheme("http");
//	((AbstractAjpProtocol<?>)ajpConnector.getProtocolHandler()).setSecretRequired(false);
//        tomcat.addAdditionalTomcatConnectors(ajpConnector);
//        return tomcat;
//    }
}
