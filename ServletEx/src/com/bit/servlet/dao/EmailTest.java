package com.bit.servlet.dao;

public class EmailTest {

	public static void main(String[] args) {
		
		Long no = (long) 12;	//	converting
		EmailDao dao = new EmailDaoOrclImpl();
		
		System.out.println(dao.getList());
		
	}
	
}
