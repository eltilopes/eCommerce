package com.ms.product.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ms.product.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, UUID>{
	@Query("select c from Product c where c.id = :id")
	   Optional<Product> findById(UUID id);
}