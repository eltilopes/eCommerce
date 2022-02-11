package com.ms.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ms.product.model.Product;
import com.ms.product.service.ProductService;

import io.swagger.annotations.Api;

@RestController
@RequestMapping("file")
@Api(tags="Product Controller")
public class FileImageController {


	@Autowired
	private ProductService productService;
	
	  @GetMapping("/{id}")
	  public ResponseEntity<byte[]> getFile(@PathVariable String id) {
	    Product product = productService.getProduct(id);
	
	    return ResponseEntity.ok()
	        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + product.getNameFileImage() + "\"")
	        .body(product.getDataFileImage());
	  }
}
