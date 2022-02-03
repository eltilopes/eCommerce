package com.ms.product.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.product.model.Product;
import com.ms.product.repository.ProductRepository;

@Service
public class ProductService {

	@Autowired
	ProductRepository productRepository;
	
	public List<Product> getProducts() {
		return productRepository.findAll();
	}
	
	public void deleteProducts() {
		productRepository.deleteAll();
	}

	public List<Product> setProducts() {
		List<Product> products = new ArrayList<>();
		Product product = new Product();
		product.setName("Produto 1");
		product.setCreateDate(new Date());
		product.setDescription("Descrição Produto 1");
		product.setPrice(100.0);
		product.setImage("https://images.unsplash.com/photo-1491528323818-fdd1faba62cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80");
		products.add(product);
		
		Product product2 = new Product();
		product2.setName("Produto 2");
		product2.setCreateDate(new Date());
		product2.setDescription("Descrição Produto 2");
		product2.setPrice(200.0);
		product2.setImage("https://images.unsplash.com/photo-1550525811-e5869dd03032?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80");
		products.add(product2);
		
		Product product3 = new Product();
		product3.setName("Produto 3");
		product3.setCreateDate(new Date());
		product3.setDescription("Descrição Produto 3");
		product3.setPrice(300.0);
		product3.setImage("https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80");
		products.add(product3);
		
		productRepository.saveAll(products);
		return products;
	}	
}
