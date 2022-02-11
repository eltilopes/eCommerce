package com.spring.keyclock.template.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.spring.keyclock.template.response.BFFResponse;
import com.spring.keyclock.template.service.ProductService;
import com.spring.keyclock.template.utils.Constaints;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@RestController
@RequestMapping("product")
@Api(tags="Product Controller")
public class ProductController {

	private static final Logger LOGGER = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@GetMapping()
	@ApiOperation(value = "Get Products")
	@ApiResponses(value = {
		    @ApiResponse(responseCode = "200", description = "Comando realizado com sucesso."),
		    @ApiResponse(responseCode = "400", description = "Ocorreu um erro ao ..."),
		})
	public ResponseEntity<BFFResponse> getProducts(
			@RequestHeader(Constaints.UUID_USER) String uuidUser,
			@RequestHeader(Constaints.AUTORIZATION) String token) {

		LOGGER.info("Chamando o servico buscar produtos.");
		LOGGER.info("UUID User : " + uuidUser);
		
	    return  ResponseEntity.status(HttpStatus.OK).body(productService.getProducts());
	}
	

	  @PostMapping(consumes = { MediaType.APPLICATION_JSON_VALUE,MediaType.MULTIPART_FORM_DATA_VALUE })
	  @ApiOperation(value = "Save Product")
	  @ApiResponses(value = {
			    @ApiResponse(responseCode = "200", description = "Comando realizado com sucesso."),
			    @ApiResponse(responseCode = "400", description = "Ocorreu um erro ao ..."),
			})
	  public ResponseEntity<BFFResponse> uploadFile(
				@RequestHeader(Constaints.UUID_USER) String uuidUser,
			  	@RequestPart("product")  String productJson,
	            @RequestPart("file") MultipartFile fileImage) {

	    return  ResponseEntity.status(HttpStatus.OK).body(productService.saveProduct(uuidUser, productJson, fileImage));
	   
	  }


}
