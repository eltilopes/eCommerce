package com.ms.product.model;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import lombok.Data;

@Entity
@Data
@Table(name="product")
public class Product implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "uuid4")
	@GenericGenerator(name = "UUID", strategy = "uuid4")
	@Type(type = "org.hibernate.type.UUIDCharType")
    @Column(name = "id", updatable = false, nullable = false, columnDefinition = "CHAR(36)")
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

	private String nameFileImage;

	private String typeFileImage;

    @Lob
	private byte[] dataFileImage;

	@Type(type = "org.hibernate.type.UUIDCharType")
    @Column(nullable = false, columnDefinition = "CHAR(36)")
	private UUID idFornecedor;
}
