<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<title>Create Account Form</title>
</head>
<body>

	<main>

		<div class="container-md mt-4">

			<h2 class="text-center display-4 mt-3">Student Registration</h2>

			<div class="card mt-4">
				<div class="card-header">Student Registration Form</div>
				<div class="card-body">

					<form action="./addStudent" method="post">
						<div class="card-header mb-2">Student Details</div>
						<div class="row">

							<div class="form-group col-md-4">
								<label for="sNameId">Student Name</label> <input type="text"
									class="form-control" id="sNameId" name="sName"
									placeholder="Enter Student Name">
							</div>

							<div class="form-group col-md-4">
								<label for="emailId">Email</label> <input type="text"
									class="form-control" id="emailId" name="email"
									placeholder="Enter email">
							</div>

							<div class="form-group col-md-4">
								<label for="dobId">Date of Birth</label> <input type="date"
									class="form-control" id="dobId" name="dob"
									placeholder="Enter Date of Birth</">
							</div>
						</div>

						<div class="row">

							<div class="form-group col-md-4">
								<label for="cgpaId">Email</label> <input type="text"
									class="form-control" id="cgpaId" name="cgpa"
									placeholder="Enter CGPA">
							</div>


							<div class="form-group col-md-4">
								<label for="dobId">Date of Admission</label> <input type="date"
									class="form-control" id="doaId" name="doa"
									placeholder="Enter Date of Admission</">
							</div>


							<div class="form-group col-md-4">
								<label for="branchId">Branch</label> <select
									class="form-control" name="branch" id="branchId">
									<option value="0">--select--</option>
									<c:forEach items="${branches}" var="branch">
									<option value="${branch.branchId}">${branch.branchName}</option>
									</c:forEach>
								</select>
							</div>

						</div>

						<div class="card-header mb-2">Address Details</div>

						<div class="row">

							<div class="form-group col-md-3">
								<label for="laneId">Lane</label> <input type="text"
									class="form-control" id="laneId" name="lane"
									placeholder="Enter Lane">
							</div>


							<div class="form-group col-md-3">
								<label for="stateId">Select State</label> <select
									class="form-control" name="state" id="stateId" onchange="getCitiesByState()">
									<option value="0">--select--</option>
									<c:forEach items="${states}" var="state">
									<option value="${state.stateId}">${state.stateName}</option>
									</c:forEach>
									
								</select>
							</div>

							<div class="form-group col-md-3">
								<label for="cityId">Select City</label> <select
									class="form-control" name="city" id="cityId">
								</select>
							</div>

							<div class="form-group col-md-3">
								<label for="zipCodeId">ZipCode</label> <input type="text"
									class="form-control" id="zipCodeId" name="zipCode"
									placeholder="Enter ZipCode">
							</div>

						</div>

						<div class="card-header mb-2">Address Details</div>

						<div class="row">
							<div class="form-group col-md-3">
								<label for="courseId">Select Course</label> <select
									class="form-control" name="course" id="courseId">
								</select>
							</div>


							<div class="form-group col-md-3">
								<label for="courseFeeId">Course Fee</label> <input type="text"
									class="form-control" id="courseFeeId" name="courseFee"
									readonly="readonly">
							</div>

						</div>

						<div class="mt-2 text-center">
							<input type="submit" class="btn btn-success" value="Save">
							<input type="reset" class="btn btn-warning" value="Clear">
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>

	<script type="text/javascript">
	
	function getCitiesByState(){
		var sId = $("#stateId").val();
		$.ajax({
			type : 'GET',
			url : 'getCitiesByState', // Replace with the actual API endpoint
			data : {
				stateId : sId
			},
			success : function(data) {
				// Assuming 'data' is HTML content, use .html() to set it inside the element with id 'tbid'
				$('#cityId').html(data);
			},
			error : function(xhr, status, error) {
				console.error('Error fetching data:', status, error);
			}
		});
	}
		
	</script>
</body>
</html>