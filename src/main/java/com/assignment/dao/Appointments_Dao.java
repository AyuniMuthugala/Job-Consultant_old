package com.assignment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.assignment.entities.AppointmentDetails;
import com.assignment.entities.Appointments;
 
import com.assignment.util.CustomException;

public class Appointments_Dao {
	
	public static void Add(DataSource datasource, Appointments appointments) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
		String sql = null;
	    
	    try {
	        con = datasource.getConnection();
	        sql = "INSERT INTO tbl_appointments (appointment_id, consultant_id, job_seeker_id, appointment_date, appointment_time,status,job_type_specialization_id,country_specialization_id	) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	        
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, appointments.getAppointment_id());
            pstmt.setString(2, appointments.getConsultant_id());
            pstmt.setString(3, appointments.getJob_seeker_id());  
            pstmt.setString(4, appointments.getAppointmentDate());
            pstmt.setString(5, appointments.getAppointmentTime());
            pstmt.setString(6, appointments.getStatus());
            pstmt.setString(7, appointments.getJob_type_specialization_id());
            pstmt.setString(8, appointments.getCountry_specialization_id());
            pstmt.execute();
	        
	    } catch (Exception e) {
	        throw new CustomException(e.getMessage());
	    } finally {
	    	close(con,pstmt,null);
	    }
	     
	}
	
	
	public static List<AppointmentDetails> GetAll(DataSource datasource){
		List<AppointmentDetails> appointmentDetails = new ArrayList<AppointmentDetails>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rset  = null;
		String sql = null;
		try {
			con = datasource.getConnection();
			sql ="SELECT \r\n"
					+ "     \r\n"
					+ "    tbl_seekers.full_name as job_seekers_full_name,\r\n"
					+ "    tbl_seekers.contact_number as job_seekers_contact_number,\r\n"
					+ "    tbl_seekers.email as job_seekers_email,\r\n"
					+ "    tbl_seekers.address as job_seekers_address,\r\n"
					+ "\r\n"
					+ "    tbl_appointments.job_seeker_id,\r\n"
					+ "    tbl_appointments.appointment_id ,\r\n"
					+ "    tbl_appointments.consultant_id,\r\n"
					+ "    tbl_appointments.appointment_date,\r\n"
					+ "    tbl_appointments.appointment_time as appointment_time,\r\n"
					+ "    tbl_appointments.status,\r\n"
					+ "    tbl_appointments.job_type_specialization_id,\r\n"
					+ "    tbl_appointments.country_specialization_id,\r\n"
					+ "    \r\n"
					+ "    tbl_job_type.job_type_name as job_type_specialization_job_type_name,\r\n"
					+ "    tbl_country.country_name as country_specialization_country_name,\r\n"
					+ "	\r\n"
					+ "    tbl_employee.full_name as  employee_full_name,\r\n"
					+ "    tbl_employee.contact_no as  employee_contact_no,\r\n"
					+ "    tbl_employee.email as  employee_email \r\n"
					+ "   \r\n"
					+ "FROM \r\n"
					+ "    tbl_appointments\r\n"
					+ "INNER JOIN \r\n"
					+ "    tbl_seekers ON tbl_seekers.job_seeker_id = tbl_appointments.job_seeker_id \r\n"
					+ "INNER JOIN \r\n"
					+ "    tbl_job_type ON tbl_job_type.job_type_specialization_id = tbl_appointments.job_type_specialization_id\r\n"
					+ "INNER JOIN \r\n"
					+ "    tbl_country ON tbl_country.country_specialization_id = tbl_appointments.country_specialization_id \r\n"
					+ "\r\n"
					+ "LEFT JOIN \r\n"
					+ "    tbl_consultants ON tbl_consultants.consultant_id = tbl_appointments.country_specialization_id \r\n"
					+ "\r\n"
					+ "\r\n"
					+ "LEFT JOIN \r\n"
					+ "    tbl_employee ON tbl_employee.employee_id = tbl_consultants.employee_id; ";
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			while(rset.next()) {
					 
			  
               String job_seekers_full_name = rset.getString("job_seekers_full_name");
               String job_seekers_contact_number = rset.getString("job_seekers_contact_number");
               String job_seekers_email = rset.getString("job_seekers_email");
               String job_type_specialization_id = rset.getString("job_type_specialization_id");
               String job_seekers_address = rset.getString("job_seekers_address");
               String job_seeker_id = rset.getString("job_seeker_id");
               String consultant_id = rset.getString("consultant_id");
               String appointment_id = rset.getString("appointment_id");
               String appointment_date = rset.getString("appointment_date");
               String appointment_time = rset.getString("appointment_time");
               
               String status = rset.getString("status");
               String country_specialization_id = rset.getString("country_specialization_id");
               String job_type_specialization_job_type_name = rset.getString("job_type_specialization_job_type_name");
               String country_specialization_country_name = rset.getString("country_specialization_country_name");
               
               String employee_full_name = rset.getString("employee_full_name");
               String employee_contact_no = rset.getString("employee_contact_no");
               String employee_email = rset.getString("employee_email");
               
               
               AppointmentDetails aDetails = new AppointmentDetails(job_seekers_full_name,   job_seekers_contact_number,   job_seekers_email,
           			  job_seekers_address,   job_seeker_id,   appointment_id,   consultant_id,
        			  appointment_date,   appointment_time,   status,   job_type_specialization_id,
        			  country_specialization_id,   job_type_specialization_job_type_name,
        			  country_specialization_country_name,   employee_full_name,   employee_contact_no,
        			  employee_email) ;
               appointmentDetails.add(aDetails);
			}
		}
		catch(Exception e)
		{
			throw new CustomException(e.getMessage());
		}
		finally {
			close(con,stmt,rset);
		}
		return appointmentDetails;
	}

	
	
	public static List<AppointmentDetails> GetAppointment(DataSource datasource, String Status, String Job_type_specialization_id , String Country_specialization_id){
		List<AppointmentDetails> appointmentDetails = new ArrayList<AppointmentDetails>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rset  = null;
		String sql = null;
		try {
			con = datasource.getConnection();
			sql ="SELECT \r\n"
					+ "     \r\n"
					+ "    tbl_seekers.full_name as job_seekers_full_name,\r\n"
					+ "    tbl_seekers.contact_number as job_seekers_contact_number,\r\n"
					+ "    tbl_seekers.email as job_seekers_email,\r\n"
					+ "    tbl_seekers.address as job_seekers_address,\r\n"
					+ "\r\n"
					+ "    tbl_appointments.job_seeker_id,\r\n"
					+ "    tbl_appointments.appointment_id ,\r\n"
					+ "    tbl_appointments.consultant_id,\r\n"
					+ "    tbl_appointments.appointment_date,\r\n"
					+ "    tbl_appointments.appointment_time as appointment_time,\r\n"
					+ "    tbl_appointments.status,\r\n"
					+ "    tbl_appointments.job_type_specialization_id,\r\n"
					+ "    tbl_appointments.country_specialization_id,\r\n"
					+ "    \r\n"
					+ "    tbl_job_type.job_type_name as job_type_specialization_job_type_name,\r\n"
					+ "    tbl_country.country_name as country_specialization_country_name,\r\n"
					+ "	\r\n"
					+ "    tbl_employee.full_name as  employee_full_name,\r\n"
					+ "    tbl_employee.contact_no as  employee_contact_no,\r\n"
					+ "    tbl_employee.email as  employee_email \r\n"
					+ "   \r\n"
					+ "FROM \r\n"
					+ "    tbl_appointments\r\n"
					+ "INNER JOIN \r\n"
					+ "    tbl_seekers ON tbl_seekers.job_seeker_id = tbl_appointments.job_seeker_id \r\n"
					+ "INNER JOIN \r\n"
					+ "    tbl_job_type ON tbl_job_type.job_type_specialization_id = tbl_appointments.job_type_specialization_id\r\n"
					+ "INNER JOIN \r\n"
					+ "    tbl_country ON tbl_country.country_specialization_id = tbl_appointments.country_specialization_id \r\n"
					+ "\r\n"
					+ "LEFT JOIN \r\n"
					+ "    tbl_consultants ON tbl_consultants.consultant_id = tbl_appointments.country_specialization_id \r\n"
					+ "\r\n"
					+ "\r\n"
					+ "LEFT JOIN \r\n"
					+ "    tbl_employee ON tbl_employee.employee_id = tbl_consultants.employee_id "
					+ "WHERE tbl_appointments.status = ? ";
				 
			stmt = con.prepareStatement(sql);
	 
			stmt.setString(1,Status);
			rset= stmt.executeQuery();
			
			while(rset.next()) {
					 
			  
               String job_seekers_full_name = rset.getString("job_seekers_full_name");
               String job_seekers_contact_number = rset.getString("job_seekers_contact_number");
               String job_seekers_email = rset.getString("job_seekers_email");
               String job_type_specialization_id = rset.getString("job_type_specialization_id");
               String job_seekers_address = rset.getString("job_seekers_address");
               String job_seeker_id = rset.getString("job_seeker_id");
               String consultant_id = rset.getString("consultant_id");
               String appointment_id = rset.getString("appointment_id");
               String appointment_date = rset.getString("appointment_date");
               String appointment_time = rset.getString("appointment_time");
               
               String status = rset.getString("status");
               String country_specialization_id = rset.getString("country_specialization_id");
               String job_type_specialization_job_type_name = rset.getString("job_type_specialization_job_type_name");
               String country_specialization_country_name = rset.getString("country_specialization_country_name");
               
               String employee_full_name = rset.getString("employee_full_name");
               String employee_contact_no = rset.getString("employee_contact_no");
               String employee_email = rset.getString("employee_email");
               
               
               AppointmentDetails aDetails = new AppointmentDetails(job_seekers_full_name,   job_seekers_contact_number,   job_seekers_email,
           			  job_seekers_address,   job_seeker_id,   appointment_id,   consultant_id,
        			  appointment_date,   appointment_time,   status,   job_type_specialization_id,
        			  country_specialization_id,   job_type_specialization_job_type_name,
        			  country_specialization_country_name,   employee_full_name,   employee_contact_no,
        			  employee_email) ;
               appointmentDetails.add(aDetails);
			}
		}
		catch(Exception e)
		{
			throw new CustomException(e.getMessage());
		}
		finally {
			close(con,stmt,rset);
		}
		return appointmentDetails;
	}
	
	
	
	public static void updateAppointment(DataSource dataSource, String consultant_id, String status,String appointment_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			
			con = dataSource.getConnection();
			sql= "UPDATE tbl_appointments Set consultant_id =?,status=? where appointment_id=?";
					
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, consultant_id);
			pstmt.setString(2, status);
			pstmt.setString(3, appointment_id);
			
			pstmt.execute();
			
		} catch (Exception e) {
			throw new CustomException(e.getMessage());
		}finally {
			
				close(con,pstmt,null);
		}
		
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
