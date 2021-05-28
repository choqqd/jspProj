package com.jspProj.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@dongyeong.c6qtc7lxtzca.us-east-2.rds.amazonaws.com:1521:orcl";
	private String user = "dongyeongj";
	private String passwd ="!Qqaazz12";
	public Connection conn;
	
	//생성자를 호출하면 conn을 만듦
	public DAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,passwd);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
