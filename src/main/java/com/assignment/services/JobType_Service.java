package com.assignment.services;

import java.util.List;

import javax.sql.DataSource;

import com.assignment.dao.JobType_Dao;
import com.assignment.entities.JobType;

public class JobType_Service {
	
	public static List<JobType> GetAll(DataSource datasource){
		return JobType_Dao.GetAll(datasource);
	}
	
	public static JobType Get(DataSource datasource,String job_type_specialization_id){
		return JobType_Dao.Get(datasource,job_type_specialization_id);
	}
	
	 
	
	 
}
