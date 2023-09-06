<!-- partial:partials/_sidebar.html -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<nav class="sidebar">
	      <div class="sidebar-header">
	        <a href="#" class="sidebar-brand">
	          Job<span>Consultant </span>
	        </a>
	        <div class="sidebar-toggler not-active">
	          <span></span>
	          <span></span>
	          <span></span>
	        </div>
	      </div>
	      <div class="sidebar-body">
	        <ul class="nav">
	          <li class="nav-item nav-category">Main</li>
	          <li class="nav-item active">
	            <a href="index.jsp" class="nav-link">
	             
	              <span class="link-title">main </span>
	            </a>
	          </li>
	          <c:if test="${sessionScope.user_type eq 'admin'}">
	          <li class="nav-item nav-category">Admin Controller</li>
	          
	          <li class="nav-item ">
	            <a href="EmployeeControllerServlet" class="nav-link">
	     
	              <span class="link-title">Employee Info</span>
	            </a>
	          </li> 
	          
	           <li class="nav-item ">
	            <a href="ConsultantControllerServlet" class="nav-link">
	     
	              <span class="link-title">Assigned Consultants</span>
	            </a>
	          </li>
	          
	     
	           <li class="nav-item ">
	            <a href="AppointmentControllerServlet?command=SHOW-ALL" class="nav-link">
	     
	              <span class="link-title"> Appointments Info</span>
	            </a>
	          </li> 
	        </c:if>
	        
	         <c:if test="${sessionScope.user_type eq 'normal'}">
	          <li class="nav-item nav-category">Job Sekker Appointment   </li>
	          
	          <li class="nav-item   ">
	            <a href="AppointmentControllerServlet?command=SHOW-NEW" class="nav-link">
	     
	              <span class="link-title">Pending Appointment </span>
	            </a>
	          </li> 
	          
	           <li class="nav-item inactive ">
	            <a href="AppointmentControllerServlet?command=SHOW-ACCEPT" class="nav-link">
	     
	              <span class="link-title">Cuurent Appointment</span>
	            </a>
	          </li> 
	          
	          
	          <li class="nav-item inactive">
	            <a href="AppointmentControllerServlet?command=SHOW-COMPLETE" class="nav-link">
	     
	              <span class="link-title">Completed Appointment</span>
	            </a>
	          </li> 
	        </c:if>
	       
 
	         </ul>
	      </div>
	    </nav>
	    
	    
	    
	    <nav class="settings-sidebar">
	      <div class="sidebar-body">
	        <a href="#" class="settings-sidebar-toggler">
	          <i data-feather="settings"></i>
	        </a>
	        <h6 class="text-muted">Sidebar:</h6>
	        <div class="form-group">
	          <div class="form-check form-check-inline">
	            <label class="form-check-label">
	              <input type="radio" class="form-check-input" name="sidebarThemeSettings" id="sidebarLight" value="sidebar-light" checked>
	              Light
	            </label>
	          </div>
	          <div class="form-check form-check-inline">
	            <label class="form-check-label">
	              <input type="radio" class="form-check-input" name="sidebarThemeSettings" id="sidebarDark" value="sidebar-dark">
	              Dark
	            </label>
	          </div>
	        </div>
	        </div>
	    </nav>
			<!-- partial -->
		>