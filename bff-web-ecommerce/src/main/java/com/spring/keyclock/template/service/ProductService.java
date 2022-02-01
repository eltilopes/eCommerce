package com.spring.keyclock.template.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.keyclock.template.response.BFFResponse;
import com.spring.keyclock.template.service.restclient.ProductServiceRestClient;

@Service
public class ProductService {


	@Autowired
	private ProductServiceRestClient productServiceRestClient;
	
	public BFFResponse getProducts() {
		return productServiceRestClient.getProducts();
	}
}
