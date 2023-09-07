package com.assignment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.assignment.entities.Country_Specialization;
import com.assignment.util.CustomException;

public class Country_Dao {
	
	public static List<Country_Specialization> GetAll(DataSource datasource){
		List<Country_Specialization> countries = new ArrayList<Country_Specialization>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rset  = null;
		String sql = null;
		try {
			con = datasource.getConnection();
			sql ="select country_specialization_id,country_name from tbl_country";
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			while(rset.next()) {
				String country_specialization_id = rset.getString("country_specialization_id");
				String country_name =rset.getString("country_name");
				
				Country_Specialization country_Specialization = new Country_Specialization(country_specialization_id, country_name);
				countries.add(country_Specialization);
			}
		}
		catch(Exception e)
		{
			throw new CustomException(e.getMessage());
		}
		finally {
			close(con,stmt,rset);
		}
		return countries;
	}
	
	public static Country_Specialization Get(DataSource datasource, String country_specialization_id) {
	    Country_Specialization countries = null;
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rset = null;
	    String sql = null;
	    try {
	        con = datasource.getConnection();
	        sql = "select country_specialization_id,country_name from tbl_country where country_specialization_id =?";
	        stmt = con.prepareStatement(sql);
	        stmt.setString(1, country_specialization_id);
	        rset = stmt.executeQuery();
	        while (rset.next()) {
	            String country_specializationid = rset.getString("country_specialization_id");
	            String country_name = rset.getString("country_name");
	            countries = new Country_Specialization(country_specializationid, country_name);
	        }
	    } catch (Exception e) {
	    	  throw new CustomException(e.getMessage());
	    } finally {
	        close(con, stmt, rset);
	    }
	    return countries;
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
