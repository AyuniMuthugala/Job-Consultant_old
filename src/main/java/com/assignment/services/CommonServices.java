package com.assignment.services;

import javax.sql.DataSource;

import com.assignment.dao.CommonDao;
import com.assignment.entities.NumberFomart;

public class CommonServices {
	
	public static String GetNumberFormat(DataSource dataSource, String tableName) {
		
		NumberFomart numberFormat = CommonDao.GetNumberFormat(dataSource,tableName);
		int numberPart = numberFormat.getNumber_Part();
		String prefix = numberFormat.getPrefix();
		String RetVal = prefix + (String.format("%05d" , ++numberPart));
			 
		
		return RetVal;
	}

	
	public static void SetNumberFormat(DataSource dataSource, String tableName ) {
		
		NumberFomart numberFormat = CommonDao.GetNumberFormat(dataSource,tableName);
		int numberPart = numberFormat.getNumber_Part();
		
		CommonDao.SetNumberFormat(dataSource,tableName,++numberPart );
		
	}
}
