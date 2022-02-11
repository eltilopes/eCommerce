package com.spring.keyclock.template.model;

import java.io.Serializable;
import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product implements Serializable{

	private static final long serialVersionUID = 1L;

	private String name;
	private Double price;
	private String description;
	private String image;
	private String nameFileImage;
	private String typeFileImage;
	private byte[] dataFileImage;
	private UUID idFornecedor;
	
}