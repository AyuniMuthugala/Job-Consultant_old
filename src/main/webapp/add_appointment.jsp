 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
       	<jsp:include page="shared/headercus.html"></jsp:include>
</head>

<body>
        
      <!-- Navbar Start -->
    <div class="container-fluid fixed-top px-0 wow fadeIn" data-wow-delay="0.1s">
        <div class="top-bar row gx-0 align-items-center d-none d-lg-flex">
            <div class="col-lg-6 px-5 text-start">
                <small><i class="fa fa-map-marker-alt text-primary me-2"></i>123 Street, New York, USA</small>
                <small class="ms-4"><i class="fa fa-clock text-primary me-2"></i>9.00 am - 9.00 pm</small>
            </div>
            <div class="col-lg-6 px-5 text-end">
                <small><i class="fa fa-envelope text-primary me-2"></i>info@example.com</small>
                <small class="ms-4"><i class="fa fa-phone-alt text-primary me-2"></i>+012 345 6789</small>
            </div>
        </div>

        <nav class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
            <a href="index.html" class="navbar-brand ms-4 ms-lg-0">
                <h1 class="display-5 text-primary m-0">Job Consultant</h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="jobseeker.jsp" class="nav-item nav-link active">Home</a>
                    <a href="about.html" class="nav-item nav-link">About</a>
                    <a href="service.html" class="nav-item nav-link">Services</a>
                    <div class="nav-item dropdown">
                 
                    <a href="AppointmentControllerServlet?command=SHOW-ADDDATA" class="nav-item nav-link">Appointment</a>
                </div>
                
            </div>
        </nav>
    </div>
    <!-- Navbar End -->


    
   <!-- Page Header Start -->
 <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
     <div class="container">
         <h1 class="display-3 mb-4 animated slideInDown">Appointment</h1>
         <nav aria-label="breadcrumb animated slideInDown">
             <ol class="breadcrumb mb-0">
                 <li class="breadcrumb-item"><a href="#">Home</a></li>
                 <li class="breadcrumb-item"><a href="#">Pages</a></li>
                 <li class="breadcrumb-item active" aria-current="page">Appointment</li>
             </ol>
         </nav>
     </div>
 </div>
 <!-- Page Header End -->
 <!-- Callback Start -->
 <div class="container-fluid callback mt-5 py-5">
     <div class="container pt-5">
         <div class="row justify-content-center">
             <div class="col-lg-7">
                 <div class="bg-white border rounded p-4 p-sm-5 wow fadeInUp" data-wow-delay="0.5s">
                     <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                         <p class="d-inline-block border rounded text-primary fw-semi-bold py-1 px-3">Get In Touch</p>
                         <h1 class="display-5 mb-5">Request A Appointment</h1>
                     </div>
                    <form action="AppointmentControllerServlet" method="post">
                <div class="alert alert-danger col-md-12 ${exceptionerrorshow}" id="divShowError" role="alert">
							<span id="showerrormsg"class="text-danger">${exceptionerror}</span>
						</div>
							<div class="form-group row d-none">
	                       <input type="hidden" name="command" value="ADDDATA">
	                    </div>
                    <div class="row g-3">
                        <div class="col-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="full_name" id="form-floating-1" placeholder="John Doe">
                                <label for="form-floating-1">Full Name</label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="contact_number"  id="form-floating-2" placeholder="name@example.com">
                                <label for="form-floating-2">Contact Number</label>
                            </div>
                        </div>
                        
                         <div class="col-6">
                            <div class="form-floating">
                                <input type="email" class="form-control" name="email"  id="form-floating-1" placeholder="John Doe">
                                <label for="form-floating-1">Email</label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="address"  id="form-floating-2" placeholder="name@example.com">
                                <label for="form-floating-2">Address</label>
                            </div>
                        </div>
                        
                          <div class="col-6">
                            <div class="form-floating">
                                <input type="date" class="form-control" name="appointmentDate"  id="form-floating-1" placeholder="John Doe">
                                <label for="form-floating-1">Appointment Date</label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-floating">
                                <input type="time" class="form-control" name="appointmentTime"  id="form-floating-2" placeholder="name@example.com">
                                <label for="form-floating-2">Appointment Time</label>
                            </div>
                        </div>
                        
                        <div class="col-6">
                       <div class="row">
						    <div class="col-md-12">
						        <div class="form-floating">
						            <select name="country_specialization_id" class="form-control">
						                <c:forEach items="${Country_SpecializationDrp}" var="Country_SpecializationDrp">
						                    <option value="${Country_SpecializationDrp.country_specialization_id}">
						                        ${Country_SpecializationDrp.country_name}
						                    </option>
						                </c:forEach>
						            </select>
						            <label for="txtcountry_specialization_id"> Select Country</label>
						        </div>
						    </div>
						</div>
                        </div>
                        
                          <div class="col-6">
                       <div class="row">
						    <div class="col-md-12">
						        <div class="form-floating">
						            <select name="job_type_specialization_id" class="form-control">
						                <c:forEach items="${jobTypesDrp}" var="jobTypesDrp">
						                    <option value="${jobTypesDrp.job_type_specialization_id}">
						                        ${jobTypesDrp.job_type_name}
						                    </option>
						                </c:forEach>
						            </select>
						            <label for="txtjob_type_specialization_id"> Select Job </label>
						        </div>
						    </div>
						</div>
                        </div>
                        
                        <div class="col-12">
                            <button class="btn btn-primary w-100 py-3" type="submit">Submit</button>
                        </div>
                    </div>
                </form>
            
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!-- Callback End -->
        
  


 <jsp:include page="shared/footercus.html"></jsp:include>
     <script type="text/javascript">

	$(document).ready(function () {

		show_Error();
    });

	function show_Error() {
		var showerror = $("#showerrormsg").text();
		if(showerror ==""){
			$("#divShowError").hide();
		}


	}


    </script>
</body>

</html>