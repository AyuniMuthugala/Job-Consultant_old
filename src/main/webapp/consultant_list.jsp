  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Assigned Consultants</title>
	 
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
			<jsp:param name="Consultant" value="active"/>
		</jsp:include>
		<div class="page-wrapper">
					
		<jsp:include page="shared/searchbar.jsp"></jsp:include>

		<div class="page-content">
	
	        <div class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
		          <div>
		            <h4 class="mb-3 mb-md-0">Consultants</h4>
		          </div>
            </div>
            
            
			<div class="row">
			    <div class="col-md-12 grid-margin stretch-card">
			        <div class="card">
			            <div class="card-body p-2 p-md-3">
			
			                <div class="text-center float-md-right">
			                    <a href="ConsultantControllerServlet?command=SHOW-ADDDATA" class="btn btn-outline-primary btn-icon-text">
			                        <i class="mdi mdi-plus-circle-outline"></i>
			                        Add Consultants
			                    </a>
			                </div>
			
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
									<table class="table table-centered ">
										<thead>
											<tr>
												<th class="d-none">Consultants ID</th>
												<th>Consultants Name</th>
												<th>Date of Birth</th>
												<th>NIC No.</th>
												 
												<th>Address</th>
												<th>Contact No.</th>
												<th>Job Type</th>
												<th>Consulanting Country</th>
												<th style="width:70px;">Action</th>
											</tr>
										</thead>
										<tbody id="tblBody">
											<c:forEach  items="${Consultant_lists}" var="Consultant_lists">
													
												<tr id="row_${Consultant_lists.consultant_id}">
													<td class="d-none">${Consultant_lists.consultant_id}</td>
													<td>${Consultant_lists.fullName}</td>
													<td>${Consultant_lists.nic}</td>
													<td>${Consultant_lists.dob}</td>
												 
													<td>${Consultant_lists.address}</td>
														<td>${Consultant_lists.contactNo}</td>
													<td>${Consultant_lists.job_type_name}</td>
													<td>${Consultant_lists.country_name}</td>
													<td>
									                    
									                	<a href="javascript:void(0);" onclick="ConfirmDelete('${Consultant_lists.consultant_id}')" class="table-icon text-danger"> <i class="mdi mdi-delete"></i></a>
									                </td>
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

         <div class="modal fade" id="ConfirmDelete" role="dialog" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h4 class="modal-title" id="bottomModalLabel">Confirm Delete</h4>
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			            </div>
			            <div class="modal-body">
			                <p>Are you sure you want to delete this record?</p>
							
			    			<input type="hidden" id="txtID">
			                
			            </div>
			            <div class="modal-footer">
			
			                <button type="button" class="btn btn-primary"  id="bDelete" onclick="DeleteRecord()">Confirm</button>
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
	
	 $("#ConfirmDelete").modal('hide');
   });

	
	
	var ConfirmDelete = function (ID) {
		$("#txtID").val(ID);
       $("#ConfirmDelete").modal('show');
   }
	
	
	var DeleteRecord = function (){
		 	var id = $("#txtID").val();
          	var command = "DELETE-LIST";

           var url = 'ConsultantControllerServlet';

           var ParamPart = "&";
           ParamPart = ParamPart + ((command != "") ? '&command=' + command : '');
           ParamPart = ParamPart + ((id != "") ? '&id=' + id : '');
        

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