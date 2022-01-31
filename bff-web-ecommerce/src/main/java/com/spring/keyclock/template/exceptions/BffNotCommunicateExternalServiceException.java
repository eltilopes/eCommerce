package com.spring.keyclock.template.exceptions;

public class BffNotCommunicateExternalServiceException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public BffNotCommunicateExternalServiceException() {
	}
	
	public BffNotCommunicateExternalServiceException(String message) {
		super(message);
	}

}
