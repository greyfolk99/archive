package com.example.server.config;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    // server.cors.allowed-origins: http://localhost:3000
    // server.cors.allowed-methods: GET,POST,PUT
    // server.cors.with-credentials: false

    @Value("${server.cors.allowed-origins}")
    private String allowedOrigins;
    @Value("${server.cors.allowed-methods}")
    private String allowedMethods;
    @Value("${server.cors.with-credentials}")
    private boolean withCredentials;

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry
            .addMapping("/**")
            .allowedMethods(allowedMethods.split(","))
            .allowedOrigins(allowedOrigins.split(","))
            .allowCredentials(withCredentials)
            .maxAge(3600);
    }
}