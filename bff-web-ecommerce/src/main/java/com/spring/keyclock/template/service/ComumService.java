package com.spring.keyclock.template.service;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.spring.keyclock.template.response.BFFResponse;
import com.spring.keyclock.template.response.BuilderResponse;

@Service
public class ComumService {

	
	public BFFResponse getUuidUser(String uuidUser, String token) {
		return BuilderResponse.buildOKCodeZeroWithResult(HttpStatus.OK, uuidUser);
	}
}
