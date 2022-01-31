package com.spring.keyclock.template.enums;


public enum ResponseMessageExceptionEnum {
	
	CODE_99(500, 99, "Fim do range de reserva"), 
	CODE_5(200, 5, "Consulta realizada parcialmente"),
	CODE_4(304, 4, "Sem modificações"), 
	CODE_3(200, 3, "Sem conteúdo"),
	CODE_2(202, 2, "Solicitação foi aceita para processamento"), 
	CODE_1(201, 1, "Recurso criado com sucesso"),
	CODE_0(200, 0, "OK"), 
	CODE_N_1(400, -1, "Body e/ou Header fora do formato esperado"),
	CODE_N_2(400, -2, "Recurso inválido / NULO"), 
	CODE_N_3(422, -3, "Recurso já cadastrado"),
	CODE_N_4(422, -4, "Campo obrigatório"), 
	CODE_N_5(400, -5, "Campo inválido"),
	CODE_N_6(422, -6, "Campo não pode ser alterado"), 
	CODE_N_7(422, -7, "Dados desatualizados"),
	CODE_N_8(422, -8, "Relacionamento inexistente"), 
	CODE_N_9(404, -9, "Recurso não encontrado"),
	CODE_N_10(400, -10, "Campos divergentes"), 
	CODE_N_11(400, -11, "Desabilitado"),
	CODE_N_12(400, -12, "Excedeu o número de tentativas"), 
	CODE_N_13(400, -13, "Token expirou."),
	CODE_N_14(400, -14, "Status inválido"), 
	CODE_N_15(400, -15, "Cadastro do usuário não foi ativado"), 
	CODE_N_16(400, -16, "Token já foi validado"), 
	CODE_N_17(400, -17, "Erro de conversão"), 
	CODE_N_18(400, -18, "Não foi possível se comunicar com o serviço externo"), 
	CODE_N_19(400, -19, "Primeiro acesso já foi registrado"), 
	CODE_N_20(400, -20, "Bloqueado"), 
	CODE_N_21(400, -21, "Ocorreu um erro ao tentar bloquear"),
	CODE_N_22(400, -22, "Ocorreu um erro ao criar senha do cartão"), 
	CODE_N_23(400, -23, "Ocorreu um erro ao alterar a senha do cartão"), 
	CODE_N_24(400, -24, "Ocorreu um erro ao desbloquear"), 
	CODE_N_25(400, -25, "Usuário sem permissão para desbloquear este cartão AR"), 
	CODE_N_26(400, -26, "Código de bloqueio inválido"), 
	CODE_N_27(400, -27, "Nova senha deve ser diferente das anteriores"), 
	CODE_N_28(400, -28, "Senha incorreta"),
	CODE_N_29(400, -29, "A Senha atual não pode ser a mesma que a nova senha"),
	CODE_N_98(500, -98, "Erro causado por paralelismo"),
	CODE_N_99(500, -99, "Sem modificações");

	private final int status;
	private final int code;
	private final String description;

	ResponseMessageExceptionEnum(int status, int code, String description) {
		this.status = status;
		this.code = code;
		this.description = description;
	}

	public static ResponseMessageExceptionEnum getDescription(Integer value) {
		if (value == null)
			return null;
		for (ResponseMessageExceptionEnum e : ResponseMessageExceptionEnum.values()) {
			if (e.code == value)
				return e;
		}
		return null;
	}

	public int getStatus() {
		return status;
	}

	public int getCode() {
		return code;
	}

	public String getDescription() {
		return description;
	}

}
