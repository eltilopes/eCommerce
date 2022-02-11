package com.spring.keyclock.template.service;

import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.keyclock.template.enums.ResponseMessageExceptionEnum;
import com.spring.keyclock.template.model.Product;
import com.spring.keyclock.template.response.BFFResponse;
import com.spring.keyclock.template.response.BuilderResponse;
import com.spring.keyclock.template.service.restclient.ProductServiceRestClient;

@Service
public class ProductService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ProductService.class);
	
	@Autowired
	private ProductServiceRestClient productServiceRestClient;
	
	public BFFResponse getProducts() {
//		  String fileDownloadUri = ServletUriComponentsBuilder
//		          .fromCurrentContextPath()
//		          .path("/files/")
//		          .path(dbFile.getId())
//		          .toUriString();
		return productServiceRestClient.getProducts();
	}

	public BFFResponse saveProduct(String uuidUser, String productJson, MultipartFile fileImage) {
		Product product = null;
		try {
			product = new ObjectMapper().readValue(productJson, Product.class);

		    String fileName = StringUtils.cleanPath(fileImage.getOriginalFilename());
			product.setNameFileImage(fileName);
			product.setTypeFileImage(fileImage.getContentType());
			product.setDataFileImage(fileImage.getBytes());
			product.setIdFornecedor(UUID.fromString(uuidUser));
		} catch (Exception e) {
			LOGGER.error("[saveProduct] Erro de conversão de objeto : {}", productJson, e);	
			return BuilderResponse.buildWithError(ResponseMessageExceptionEnum.CODE_N_17, productJson);
		}
		return productServiceRestClient.saveProduct(product);
	}
}
