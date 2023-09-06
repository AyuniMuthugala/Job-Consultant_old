package com.assignment.services;

import javax.sql.DataSource;

import com.assignment.dao.Job_Seekers_Dao;
import com.assignment.entities.Job_Seekers;

public class Job_Seekers_Services {
	
	public static void Add(DataSource datasource, Job_Seekers job_Seekers) {
		Job_Seekers_Dao.Add(datasource, job_Seekers);
	}
}
