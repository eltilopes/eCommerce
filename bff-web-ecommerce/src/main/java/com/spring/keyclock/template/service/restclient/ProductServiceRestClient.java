package com.spring.keyclock.template.service.restclient;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.spring.keyclock.template.enums.MessageEnum;
import com.spring.keyclock.template.exceptions.BffNotCommunicateExternalServiceException;
import com.spring.keyclock.template.model.Product;
import com.spring.keyclock.template.response.BFFResponse;
import com.spring.keyclock.template.response.BuilderResponse;

@Service
public class ProductServiceRestClient {

	private static final Logger LOGGER = LoggerFactory.getLogger(ProductServiceRestClient.class);

	@Autowired
	private RestTemplate restTemplate;
	
	@Value("${url-base.ms-product}")
	private String urlBaseProduto;

	
	public BFFResponse getProducts() {
		LOGGER.info("Chamando o serviço para buscar produtos");
		
		String url = urlBaseProduto ;
		
		try {
			
			ResponseEntity<List> response = restTemplate.getForEntity(url, List.class);
	        BFFResponse bffProductsResponse = BuilderResponse.buildOKCodeZeroWithResult(response.getStatusCode(), response.getBody());
			return bffProductsResponse;
		
		} catch (HttpClientErrorException e) {	
			LOGGER.error("[getProducts] O serviço retornou um erro ao buscar produtos - response {}",  e.getResponseBodyAsString());
			return BuilderResponse.convertErrorAPI(url, e.getStatusCode(), e.getResponseBodyAsString());	
		} catch (Exception e) {
			LOGGER.error("[getProducts] Erro de comunicação com o serviço - url: {}", url, e);		
			throw new BffNotCommunicateExternalServiceException(MessageEnum.ERRO_DE_COMUNICACAO_COM_O_SERVICO.getName() + ": " + url);
		}
	}	

	
	public BFFResponse saveProduct(Product product) {
		LOGGER.info("Chamando o serviço para salvar produto");
		String url = urlBaseProduto ;
		try {
			HttpHeaders headers = new HttpHeaders();	 
			headers.setContentType(MediaType.APPLICATION_JSON);    	 
	        HttpEntity<Product> request = new HttpEntity<Product>(product, headers);
	      //Product response = restTemplate.postForObject(url,request, Product.class);
	        
	        ResponseEntity<Product> response = restTemplate.postForEntity(url,request, Product.class);
			

	        //ResponseEntity<Product> response = restTemplate.exchange(url, HttpMethod.POST, request, Product.class);
	        
	        
	        BFFResponse bffProductsResponse = BuilderResponse.buildCreated( response);
			return bffProductsResponse;
		} catch (HttpClientErrorException e) {	
			LOGGER.error("[saveProduct] O serviço retornou um erro ao salvar produtos - response {}",  e.getResponseBodyAsString());
			return BuilderResponse.convertErrorAPI(url, e.getStatusCode(), e.getResponseBodyAsString());	
		} catch (Exception e) {
			LOGGER.error("[saveProduct] Erro de comunicação com o serviço - url: {}", url, e);		
			throw new BffNotCommunicateExternalServiceException(MessageEnum.ERRO_DE_COMUNICACAO_COM_O_SERVICO.getName() + ": " + url);
		}
	}	

	
}
