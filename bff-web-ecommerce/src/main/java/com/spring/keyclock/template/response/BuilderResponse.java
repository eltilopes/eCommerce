package com.spring.keyclock.template.response;

import org.springframework.http.HttpStatus;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.keyclock.template.enums.MessageEnum;
import com.spring.keyclock.template.enums.ResponseMessageExceptionEnum;
import com.spring.keyclock.template.exceptions.BffNotCommunicateExternalServiceException;

public class BuilderResponse {

	private BuilderResponse() {
		throw new IllegalStateException("Utility class");
	}
	
	public static BFFResponse build(String code, String description, Object result, HttpStatus httpStatus) {
		
		BFFResponse response = new BFFResponse();
		MessageResponse messageResponse = new MessageResponse();
		messageResponse.setCode(code);
		messageResponse.setDescription(description);
		response.setResult(result);
		response.getMessages().add(messageResponse);
		response.getMetadata().put(MessageEnum.HTTP_STATUS.getName(), httpStatus.value());		
		return response;
		
	}
	
	public static BFFResponse buildWithError(ResponseMessageExceptionEnum messageExceptionEnum, Object result) {
		
		BFFResponse response = new BFFResponse();
		MessageResponse messageResponse = new MessageResponse();
		messageResponse.setCode(String.valueOf(messageExceptionEnum.getCode()));
		messageResponse.setDescription(messageExceptionEnum.getDescription());
		response.setResult(result);
		response.getMessages().add(messageResponse);
		response.getMetadata().put(MessageEnum.HTTP_STATUS.getName(), messageExceptionEnum.getStatus());		
		return response;
		
	}
	
	public static BFFResponse buildCreated(Object result) {
		
		BFFResponse response = new BFFResponse();
		MessageResponse messageResponse = new MessageResponse();
		messageResponse.setCode("1");
		messageResponse.setDescription("Recurso criado com sucesso");
		response.setResult(result);
		response.getMessages().add(messageResponse);
		response.getMetadata().put(MessageEnum.HTTP_STATUS.getName(), HttpStatus.CREATED.value());		
		return response;
		
	}
		
	public static BFFResponse buildOKCodeZero() {
		
		BFFResponse response = new BFFResponse();
		MessageResponse messageResponse = new MessageResponse();
		messageResponse.setCode("0");
		messageResponse.setDescription("Comando realizado com sucesso");
		response.getMessages().add(messageResponse);
		response.getMetadata().put(MessageEnum.HTTP_STATUS.getName(), HttpStatus.OK.value());
		return response;		
	}
	
	public static BFFResponse buildOKCodeZeroWithResult(HttpStatus httpStatus, Object result) {
		
		BFFResponse response = new BFFResponse();
		response.setHttpStatus(httpStatus);
		MessageResponse messageResponse = new MessageResponse();
		messageResponse.setCode("0");
		messageResponse.setDescription("Comando realizado com sucesso");
		response.setResult(result);
		response.getMessages().add(messageResponse);
		response.getMetadata().put(MessageEnum.HTTP_STATUS.getName(), HttpStatus.OK.value());
		return response;		
	}
	
	public static BFFResponse convertErrorAPI(String url, HttpStatus httpStatus, String responseString) {
		
		ObjectMapper om = new ObjectMapper();
		try {
			
			BFFResponse response = om.readValue(responseString, BFFResponse.class);
			response.setHttpStatus(httpStatus);
			handleMessage(response);
			return response;
			
		} catch (Exception e) {
			throw new BffNotCommunicateExternalServiceException("Erro de comunicação com o serviço: " + url);		
		}	
		
	}
	
	private static void handleMessage(BFFResponse response) {
		
		for (MessageResponse message : response.getMessages()) {
			message.setDescription(ResponseMessageExceptionEnum.getDescription(Integer.parseInt(message.getCode())).getDescription());
		}
 
	}
	
}
