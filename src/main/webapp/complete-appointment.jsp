  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Appointments</title>
	 
		<jsp:include page="shared/header.html"></jsp:include>
</head>
<body class="sidebar-dark">
 <%
	   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		if(session.getAttribute("employee_id") == null  ){
			response.sendRedirect("login.jsp");
			
		}
	%>
	 
	<div class="main-wrapper">

		<jsp:include page="shared/sidebar.jsp">
			<jsp:param name="Completed" value="active"/>
		</jsp:include>
		<div class="page-wrapper">
					
		<jsp:include page="shared/searchbar.jsp"></jsp:include>

		<div class="page-content">
	
	        <div class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
		          <div>
		            <h4 class="mb-3 mb-md-0"> Completed Appointments Details </h4>
		          </div>
            </div>
            
            
			<div class="row">
			    <div class="col-md-12 grid-margin stretch-card">
			        <div class="card">
			            <div class="card-body p-2 p-md-3">
			
			                
			                <div class="row justify-content-md-start justify-content-center">
			
			                    <div class="p-1 pl-0">
			                        <input type="search" class="form-control form-control" id="txtKeyW" autofocus="autofocus" onkeyup="SearchStart()" placeholder="Search Here">
			                    </div>
			
			                </div>
							<div class="alert alert-danger ${exceptionerrorshow}" role="alert">
								<span class="text-danger">${exceptionerror}</span>
							</div>
			              
			                <div id="divRecords" class="m-0 p-0 mt-2">
								<div class="table-responsive">
									<table class="table table-centered">
										<thead>
											<tr>
												<th class="">Name </th>
												<th>Contatct num</th>
												
													<th class="">Email </th>
												<th>Address</th>
												<th>Apointment Time</th>
												<th>Job Type</th>
												<th>Country</th>
												 
											</tr>
										</thead>
										<tbody id="tblBody">
											<c:forEach  items="${appointmentDetails_lists}" var="appointmentDetails_lists">
													
												<tr id="row_${appointmentDetails_lists.appointment_id}">
													<td >${appointmentDetails_lists.job_seekers_full_name}</td>
													<td >${appointmentDetails_lists.job_seekers_contact_number}</td>
													<td>${appointmentDetails_lists.job_seekers_email}</td>
													<td>${appointmentDetails_lists.job_seekers_address}</td>
													
													<td >${appointmentDetails_lists.appointment_date} ${appointmentDetails_lists.appointment_time}</td>
													<td>${appointmentDetails_lists.job_type_specialization_job_type_name}</td>
													<td>${appointmentDetails_lists.country_specialization_country_name}</td>
													
													 
												</tr>
											</c:forEach>
										</tbody>
										
									</table>
								</div>
			                
			                </div>
			
			            </div>
			        </div>
			    </div>
			</div>

         <div class="modal fade" id="ConfirmReject" role="dialog" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h4 class="modal-title" id="bottomModalLabel">Reject Appointment</h4>
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			            </div>
			            <div class="modal-body">
			                <p>Are you sure you want to Reject  this Appointment of Customer?</p>
							
			    			<input type="hidden" id="txtID">
			                
			            </div>
			            <div class="modal-footer">
			
			                <button type="button" class="btn btn-primary"  id="bDelete" onclick="RejectRecord()">Reject</button>
			                <button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
			            </div>
			        </div><!-- /.modal-content -->
			    </div><!-- /.modal-dialog -->
			</div>
		
		
		
		  <div class="modal fade" id="ConfirmBooking" role="dialog" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h4 class="modal-title" id="bottomModalLabel">Accept Appointment</h4>
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			            </div>
			            <div class="modal-body">
			                <p>Are you sure you want to Confirm  this Appontment of Customer?</p>
							
			    			<input type="hidden" id="txtBID">
			                
			            </div>
			            <div class="modal-footer">
			
			                <button type="button" class="btn btn-primary"  id="bDelete" onclick="ConfirmRecord()">Confirm</button>
			                <button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
			            </div>
			        </div><!-- /.modal-content -->
			    </div><!-- /.modal-dialog -->
			</div>
		
		</div>
		

			<jsp:include page="shared/footer.html"></jsp:include>
		
		</div>
	</div>
	<script title="Task">

	$(document).ready(function () {
		
		 $("#ConfirmReject").modal('hide');
		 $("#ConfirmBooking").modal('hide');
	   });

		
		
		var ConfirmBtnReject = function (ID) {
			$("#txtID").val(ID);
	       $("#ConfirmReject").modal('show');
	   }
		
		var ConfirmBtnBooking = function (ID) {
			$("#txtBID").val(ID);
	       $("#ConfirmBooking").modal('show');
	   }
		
		
		var RejectRecord = function (){
			 	var booking_Id = $("#txtID").val();
	          	var command = "UPDATE-REJECT";

	           var url = 'BookingControllerServlet';

	           var ParamPart = "&";
	           ParamPart = ParamPart + ((command != "") ? '&command=' + command : '');
	           ParamPart = ParamPart + ((booking_Id != "") ? '&booking_Id=' + booking_Id : '');
	        

	           ParamPart = ParamPart.replace("&&", "");

	           window.location.href = url + '?' + ParamPart;
	           event.preventDefault();
		}
		
		var ConfirmRecord = function (){
		 	var appointment_id = $("#txtBID").val();
	      	var command = "UPDATE-ACCEPTED";

	       var url = 'AppointmentControllerServlet';

	       var ParamPart = "&";
	       ParamPart = ParamPart + ((command != "") ? '&command=' + command : '');
	       ParamPart = ParamPart + ((appointment_id != "") ? '&appointment_id=' + appointment_id : '');
	    

	       ParamPart = ParamPart.replace("&&", "");

	       window.location.href = url + '?' + ParamPart;
	       event.preventDefault();
	}
	
   function SearchStart() {
       // Declare variables
       var input, filter, table, tr, td, i, txtValue;
       input = document.getElementById("txtKeyW");
       filter = input.value.toUpperCase();
       table = document.getElementById("tblBody");
       tr = table.getElementsByTagName("tr");

       for (i = 0; i < tr.length; i++) {
           td = tr[i].getElementsByTagName("td")[0];
           td1 = tr[i].getElementsByTagName("td")[1];

           if (td) {
               txtValue = td.textContent || td.innerText;
               txtValue = txtValue + ' ' + td1.textContent || td1.innerText;
               if (txtValue.toUpperCase().indexOf(filter) > -1) {
                   tr[i].style.display = "";
               } else {
                   tr[i].style.display = "none";
               }
           }
       }
   }

    
  </script>

	
</body>
</html>