package com.assignment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.assignment.entities.JobType;
import com.assignment.util.CustomException;

public class JobType_Dao {
	
	public static List<JobType> GetAll(DataSource datasource){
		List<JobType> jobtypes = new ArrayList<JobType>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rset  = null;
		String sql = null;
		try {
			con = datasource.getConnection();
			sql ="select job_type_specialization_id,job_type_name from job_type_specialization";
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			while(rset.next()) {
				String job_type_specialization_id = rset.getString("job_type_specialization_id");
				String job_type_name =rset.getString("job_type_name");
				
				JobType jobtype = new JobType(job_type_specialization_id, job_type_name);
				jobtypes.add(jobtype);
			}
		}
		catch(Exception e)
		{
			throw new CustomException(e.getMessage());
		}
		finally {
			close(con,stmt,rset);
		}
		return jobtypes;
	}
	
	public static JobType Get(DataSource datasource, String job_type_id) {
	    JobType jobtypes = null;
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rset = null;
	    String sql = null;
	    try {
	        con = datasource.getConnection();
	        sql = "select job_type_specialization_id,job_type_name from job_type_specialization where job_type_specialization_id =?";
	        stmt = con.prepareStatement(sql);
	        stmt.setString(1, job_type_id);
	        rset = stmt.executeQuery();
	        while (rset.next()) {
	            String job_type_specialization_id = rset.getString("job_type_specialization_id");
	            String job_type_name = rset.getString("job_type_name");
	            jobtypes = new JobType(job_type_specialization_id, job_type_name);
	        }
	    } catch (Exception e) {
	    	  throw new CustomException(e.getMessage());
	    } finally {
	        close(con, stmt, rset);
	    }
	    return jobtypes;
	}


	private static void close(Connection con, Statement stmt, ResultSet rset) {
		 try {
			 	if(rset != null)
				{
					rset.close();
				}
				if(stmt != null)
				{
					stmt.close();
				}
				
				if(con != null)
				{
					con.close();
				}
		 }
		 catch (SQLException e) {
			throw new CustomException(e.getMessage());
		}
	}

	
}
