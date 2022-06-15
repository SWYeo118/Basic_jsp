package com.jsp.domain.repository;

import java.util.List;

import com.jsp.data.ProductRepositoryDbImpl;
import com.jsp.data.dao.MySqlProductDaoImpl;
import com.jsp.domain.model.Product;

public interface ProductRepository {

	public static ProductRepository getInstance() {
		return new ProductRepositoryDbImpl(new MySqlProductDaoImpl());
	}

	public List<Product> getAllProducts();

	public Product getProductById(String id);

	public void addProduct(Product product);

}
