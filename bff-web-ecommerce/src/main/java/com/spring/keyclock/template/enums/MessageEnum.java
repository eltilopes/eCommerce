package com.spring.keyclock.template.enums;


public enum MessageEnum {

	HTTP_STATUS("httpstatus"),
	NAO_FOI_POSSIVEL_CONVERTER_TIPO_DO_ERRO("Não foi possível converter o tipo do erro"),
	ACCEPT("Accept"),
	ERRO_DE_COMUNICACAO_COM_O_SERVICO("Erro de comunicação com o serviço");
	
	private final String name;

	MessageEnum(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
}