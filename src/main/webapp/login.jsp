 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Authentication</title>

   <jsp:include page="shared/header.html"></jsp:include>
    
</head>
<body class="sidebar-dark">
 
 <div class="main-wrapper">
		<div class="page-wrapper full-page">
			<div class="page-content d-flex align-items-center justify-content-center">

				<div class="row w-100 mx-0 auth-page">
					<div class="col-md-8 col-xl-6 mx-auto">
						<div class="card">
							<div class="row">
                
                <div class="col-md-12 ps-md-0">
                  <div class="auth-form-wrapper px-4 py-5">
                    <a href="#" class="noble-ui-logo d-block mb-2">Job <span>Consultant</span></a>

                    <form action="LoginControllerServlet" method="post">
                    
                     <div class=" text-center col-md-12 ${exceptionerrorshow}" id="divShowError" >
								<span id="showerrormsg" class="text-light">${exceptionerror}</span>
								<input type="hidden" id="showerrormsg" value="${exceptionerror}" >
					</div>
                    
                      <div class="mb-3">
                        
                        <input type="email" class="form-control" name="email" placeholder="Email">
                      </div>
                      <div class="mb-3">
                      
                        <input type="password" class="form-control" name="password" autocomplete="current-password" placeholder="Password">
                      </div>
                        <div>
                        <input type="submit" value="Login" class="btn btn-primary me-2 mb-2 mb-md-0 text-white"/>
                      
                      </div>
                     
                    </form>
                  </div>
                </div>
              </div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

   <script type="text/javascript">
 
	
	 

    </script>

</body>

</html>


 