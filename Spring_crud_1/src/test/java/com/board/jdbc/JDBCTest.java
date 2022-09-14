package com.board.jdbc;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTest {

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnneciton() {
		try(Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/sys?serverTimezone=Asia/Seoul",
				"root",
				"1234")){
			System.out.println("0831 성공");
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}
}
