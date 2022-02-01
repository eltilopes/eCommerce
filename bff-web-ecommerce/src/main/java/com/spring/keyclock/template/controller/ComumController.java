package com.spring.keyclock.template.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.keyclock.template.response.BFFResponse;
import com.spring.keyclock.template.service.ComumService;
import com.spring.keyclock.template.utils.Constaints;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@RestController
@RequestMapping("comum")
@Api(tags="Comum Controller")
public class ComumController {

	private static final Logger LOGGER = LoggerFactory.getLogger(ComumController.class);
	
	@Autowired
	private ComumService comumService;
	
	@GetMapping("/uuid")
	@ApiOperation(value = "Get UUID User")
	@ApiResponses(value = {
		    @ApiResponse(responseCode = "200", description = "Comando realizado com sucesso."),
		    @ApiResponse(responseCode = "400", description = "Ocorreu um erro ao ..."),
		})
	public ResponseEntity<BFFResponse> getUuidUser(
			@RequestHeader(Constaints.UUID_USER) String uuidUser,
			@RequestHeader(Constaints.AUTORIZATION) String token) {

		LOGGER.info("Chamando o servico Get UUID User.");
		LOGGER.info("UUID User : " + uuidUser);
		LOGGER.info("Token : " +  token);
		
	    return  ResponseEntity.status(HttpStatus.OK).body(comumService.getUuidUser(uuidUser, token));
	}

}
