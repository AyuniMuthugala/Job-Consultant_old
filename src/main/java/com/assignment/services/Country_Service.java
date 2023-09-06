package com.assignment.services;

import java.util.List;

import javax.sql.DataSource;

import com.assignment.dao.Country_Dao;
import com.assignment.entities.Country_Specialization;

public class Country_Service {
	
	public static List<Country_Specialization> GetAll(DataSource datasource){
		return Country_Dao.GetAll(datasource);
	}
	
	public static Country_Specialization Get(DataSource datasource,String country_specialization_id){
		return Country_Dao.Get(datasource,country_specialization_id);
	}
	
 
	
	 
}
