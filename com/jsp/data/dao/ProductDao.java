package com.jsp.data.dao;

import java.util.List;

import com.jsp.domain.model.Product;

// DataAccessObject

public interface ProductDao {
	
	// interface 안에 작성한 멤버 = public final static이 생략되어 있는 것과 같다.
	String TABLE_NAME = "product";
	
	// interface 안에서는 public만 됨
	
	List<Product> getAll();
	
	void insert(Product product);
	void update(Product product);
	void delete(Product product);

}
