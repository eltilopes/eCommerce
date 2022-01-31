package com.spring.keyclock.template.config;

import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.spring.keyclock.template.security.KeycloakJwtAuthenticationConverter;

@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class ResourceServerConfig extends WebSecurityConfigurerAdapter {

    private final KeycloakJwtAuthenticationConverter keycloakJwtAuthenticationConverter = new KeycloakJwtAuthenticationConverter();

    @Override
    public void configure(final HttpSecurity http) throws Exception {
    	http.cors();
        http
                .authorizeRequests(authz -> authz.antMatchers("/security/**").authenticated())
                .oauth2ResourceServer()
                .jwt().jwtAuthenticationConverter(keycloakJwtAuthenticationConverter)
                ;
    }
}