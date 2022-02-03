package com.spring.keyclock.template.model;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import lombok.Data;

@Data
public class Product implements Serializable{

	private static final long serialVersionUID = 1L;

    private UUID id;
	private String name;
	private Date createDate;
	private Double price;
	private String description;
	private String image;
	
}