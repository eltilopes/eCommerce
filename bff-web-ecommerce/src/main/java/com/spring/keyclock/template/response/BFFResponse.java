package com.spring.keyclock.template.response;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.Data;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class BFFResponse {

	private HttpStatus httpStatus;
	
	private List<MessageResponse> messages = new ArrayList<>();
    
	private Object result;
    
	private Map<String, Object> metadata = new LinkedHashMap<>();
    
}