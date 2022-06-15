package com.jsp.data.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jsp.domain.model.Product;

public class MySqlProductDaoImpl implements ProductDao {

	private final static String COLUMN_ID = "p_id";
	
	public MySqlProductDaoImpl() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new IllegalStateException("jdbc 드라이버 로드 실패");
		}
	}

	@Override
	public List<Product> getAll() {
		String sql = "SELECT * FROM product";
		List<Product> results = new ArrayList<>();
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
				"CJDghd9311@"); Statement stmt = conn.createStatement();) {
			try (ResultSet rs = stmt.executeQuery(sql)) {
				while (rs.next()) {
					String id = rs.getString(1);
					String name = rs.getString(2);
					int unitPrice = rs.getInt(3);
					String description = rs.getString(4);
					String category = rs.getString(5);
					String manufacturer = rs.getString(6);
					Long unitsInStock = rs.getLong(7);
					String condition = rs.getString(8);

					Product product = new Product(id, name, unitPrice);
					product.setDescription(description);
					product.setCategory(category);
					product.setManufacturer(manufacturer);
					product.setUnitsInStock(unitsInStock);
					product.setCondition(condition);

					results.add(product);
				}
			}

		} catch (SQLException e) {
			throw new IllegalStateException("db연결 실패" + e.getMessage());
		}
		return results;
	}

	@Override
	public void insert(Product product) {
		// PreparedStatement를 쓰면 여러번 지우고 쓸 때 빠르다.
		// 동적 쿼리 생성
		String sql = "INSERT INTO product VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
				"CJDghd9311@"); 
				PreparedStatement stmt = conn.prepareStatement(sql);){
			stmt.setString(1, product.getId());
			stmt.setString(2, product.getName());
			stmt.setInt(3, product.getUnitPrice());
			stmt.setString(4, product.getDescription());
			stmt.setString(5, product.getCategory());
			stmt.setString(6, product.getManufacturer());
			stmt.setLong(7, product.getUnitsInStock());
			stmt.setString(8, product.getCondition());
			// execute가 아니라 executeUpdate 쓰면 결과를 리턴받는다.
			stmt.executeUpdate();
		} catch (SQLException e) {
			throw new IllegalStateException("insert 실패" + e.getMessage());
		}

	}

	@Override
	public void update(Product product) {
		String sql = "UPDATE ? SET p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitsInStock=?, p_condition=?";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
				"CJDghd9311@"); 
				PreparedStatement stmt = conn.prepareStatement(sql);){
			stmt.setString(1, product.getId());
			stmt.setString(2, product.getName());
			stmt.setInt(3, product.getUnitPrice());
			stmt.setString(4, product.getDescription());
			stmt.setString(5, product.getCategory());
			stmt.setString(6, product.getManufacturer());
			stmt.setLong(7, product.getUnitsInStock());
			stmt.setString(8, product.getCondition());
			// execute가 아니라 executeUpdate 쓰면 결과를 리턴받는다.
			stmt.executeUpdate();
		} catch (SQLException e) {
			throw new IllegalStateException("insert 실패" + e.getMessage());
		}

	}

	@Override
	public void delete(Product product) {
		String sql = "DELETE FROM ? WHERE p_id=?";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
				"CJDghd9311@"); 
				PreparedStatement stmt = conn.prepareStatement(sql);){
			stmt.setString(1, product.getId());
			stmt.setString(2, product.getName());
			// execute가 아니라 executeUpdate 쓰면 결과를 리턴받는다.
			stmt.executeUpdate();
		} catch (SQLException e) {
			throw new IllegalStateException("insert 실패" + e.getMessage());
		}

	}

}
