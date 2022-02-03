package com.ms.product.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ms.product.model.Product;
import com.ms.product.service.ProductService;

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

	@GetMapping(produces = "application/json")
	@ApiOperation(value = "Get Products")
	@ApiResponses(value = {
		    @ApiResponse(responseCode = "200", description = "Comando realizado com sucesso."),
		    @ApiResponse(responseCode = "400", description = "Ocorreu um erro ao ..."),
		})
	public ResponseEntity<List<Product>> getProducts() {

		LOGGER.info("Chamando o servico buscar produtos.");
		
	    return  ResponseEntity.status(HttpStatus.OK).body(productService.getProducts());
	}
	
	@PutMapping(produces = "application/json")
	@ApiOperation(value = "Set Products")
	@ApiResponses(value = {
		    @ApiResponse(responseCode = "200", description = "Comando realizado com sucesso."),
		    @ApiResponse(responseCode = "400", description = "Ocorreu um erro ao ..."),
		})
	public ResponseEntity<List<Product>> setProducts() {

		LOGGER.info("Chamando o servico inserir produtos.");
		
	    return  ResponseEntity.status(HttpStatus.OK).body(productService.setProducts());
	}	
	
	@DeleteMapping(produces = "application/json")
	@ApiOperation(value = "Delete Products")
	@ApiResponses(value = {
		    @ApiResponse(responseCode = "200", description = "Comando realizado com sucesso."),
		    @ApiResponse(responseCode = "400", description = "Ocorreu um erro ao ..."),
		})
	public ResponseEntity<String> deleteProducts() {

		LOGGER.info("Chamando o servico deletar produtos.");
		productService.deleteProducts();
		
	    return  ResponseEntity.status(HttpStatus.OK).body("Produtos Deletados");
	}
}
