package com.ms.product.config;


import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;

@Configuration
@EnableJpaRepositories(
		basePackages = "com.ms.product.repository",
		entityManagerFactoryRef = "mysqlEntityManager")
public class MySqlConfiguration {

	@Bean
	@Primary
	@ConfigurationProperties(prefix = "mysql.datasource")
	public DataSource mysqlDatasource () {
		return DataSourceBuilder.create().build();
	}

	@Bean
	@Primary
	public LocalContainerEntityManagerFactoryBean mysqlEntityManager(EntityManagerFactoryBuilder builder,
			@Qualifier("mysqlDatasource") DataSource dataSource) {

		LocalContainerEntityManagerFactoryBean emf = new LocalContainerEntityManagerFactoryBean();
		emf.setDataSource(dataSource);
		
		packagesToScan(emf, "com.ms.product.model");

		emf.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
		emf.setJpaProperties(additionalProperties());

		return emf;

	}
	
	private void packagesToScan(LocalContainerEntityManagerFactoryBean emf, String ... args) {
		emf.setPackagesToScan(args);
	}	

	private Properties additionalProperties() {
		Properties properties = new Properties();
		properties.setProperty("hibernate.hbm2ddl.auto", "update");
		properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
		properties.setProperty("hibernate.show_sql", "true");
		return properties;
	}
	
}
