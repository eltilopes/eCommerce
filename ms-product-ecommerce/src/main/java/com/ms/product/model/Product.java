package com.ms.product.model;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;

@Entity
@Data
@Table(name="product")
public class Product implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(
        name = "UUID",
        strategy = "org.hibernate.id.UUIDGenerator"
    )
    @Column(name = "id", updatable = false, nullable = false)
    private UUID id;

	@Column(name = "name", nullable = false, length = 180)
	private String name;
	
	@Column(name = "create_date", nullable = false)
	@Temporal(TemporalType.DATE)
	private Date createDate;
	
	@Column(nullable = false)
	private Double price;

	@Column(nullable = false, length = 250)
	private String description;

	@Column(nullable = false)
	private String image;
	
}
