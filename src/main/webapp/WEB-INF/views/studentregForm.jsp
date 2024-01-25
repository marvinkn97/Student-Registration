<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
<title>Student Registration</title>
</head>
<body>

	<main>

		<div class="container-md mt-4">

			<c:if test="${msg ne null}">
				<div class="alert alert-success" id="alId">${msg}</div>
			</c:if>


			<h2 class="text-center display-4 mt-3">Student Registration</h2>

			<div class="card mt-4">
				<div class="card-header">Student Registration Form</div>
				<div class="card-body">

					<form action="./registerStudent" method="post">
						<div class="card-header mb-2">Student Details</div>
						<div class="row">

							<div class="form-group col-md-4">
								<label for="sNameId">Student Name</label> <input type="text"
									class="form-control" id="sNameId" name="name"
									placeholder="Enter Student Name">
							</div>

							<div class="form-group col-md-4">
								<label for="emailId">Email</label> <input type="text"
									class="form-control" id="emailId" name="email"
									placeholder="Enter email">
							</div>

							<div class="form-group col-md-4">
								<label for="dobId">Date of Birth</label> <input type="date"
									class="form-control" id="dobId" name="dateOfBirth"
									placeholder="Enter Date of Birth</">
							</div>
						</div>

						<div class="row">

							<div class="form-group col-md-4">
								<label for="cgpaId">CGPA</label> <input type="text"
									class="form-control" id="cgpaId" name="cgpa"
									placeholder="Enter CGPA">
							</div>



							<div class="form-group col-md-4">
								<label for="yroaId">Year of Admission</label> <select
									class="form-control" name="yearOfAdmission" id="yroaId">
									<option value="0">--select--</option>
									<c:forEach items="${years}" var="year">
										<option value="${year}">${year}</option>
									</c:forEach>
								</select>
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
									class="form-control" id="laneId" name="addresses[0].lane"
									placeholder="Enter Lane">
							</div>


							<div class="form-group col-md-3">
								<label for="stateId">Select State</label> <select
									class="form-control" name="addresses[0].state" id="stateId"
									onchange="getCitiesByState()">
									<option value="0">--select--</option>
									<c:forEach items="${states}" var="state">
										<option value="${state.stateId}">${state.stateName}</option>
									</c:forEach>

								</select>
							</div>

							<div class="form-group col-md-3">
								<label for="cityId">Select City</label> <select
									class="form-control" name="addresses[0].state.cities[0].cityId"
									id="cityId">
								</select>
							</div>

							<div class="form-group col-md-3">
								<label for="zipCodeId">ZipCode</label> <input type="text"
									class="form-control" id="zipCodeId" name="addresses[0].zip"
									placeholder="Enter ZipCode">
							</div>

						</div>

						<div class="card-header mb-2">Course Details</div>

						<div class="row">
							<div class="form-group col-md-3">
								<label for="courseId">Select Course</label> <select
									class="form-control" name="courses[0].courseId" id="courseId"
									onchange="getCourseFee()">
									<option value="0">--select--</option>
									<c:forEach items="${courses}" var="course">
										<option value="${course.courseId}">${course.courseTitle}</option>
									</c:forEach>
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

				<div class="mt-2 p-3">
					<div class="h3">All Student Data</div>

					<table class="table table-bordered table-striped mt-2">
						<thead>
							<tr>
								<th>Sl.#</th>
								<th>Name</th>
								<th>Email</th>
								<th>Date Of Birth</th>
								<th>CGPA</th>
								<th>Year of Admission</th>
								<th>Branch Name</th>
								<th>Course Name</th>
							</tr>

						</thead>

						<tbody>
							<c:forEach items="${students}" var="s" varStatus="counter">
								<tr>
									<td>${counter.count}</td>
									<td>${s.name}</td>
									<td>${s.email}</td>
									<td><fmt:formatDate value="${s.dateOfBirth}"
											pattern="yyyy-MM-dd" /></td>
									<td>${s.cgpa}</td>
									<td>${s.yearOfAdmission}</td>
									<td>${s.branch.branchName}</td>
									<td>${s.courses[0].courseTitle}</td>
								</tr>
							</c:forEach>

						</tbody>

					</table>

				</div>
			</div>
		</div>
	</main>

	<script type="text/javascript">
	
	$(document).ready(function() {
		setTimeout(function() {
			document.getElementById("alId").style.display = 'none';
		}, 3000);
	});
	
		function getCitiesByState() {
			var sId = $("#stateId").val();
			$.ajax({
				type : 'GET',
				url : 'getCitiesByState',
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

		function getCourseFee() {
			var cId = $("#courseId").val();
			$.ajax({
				type : 'GET',
				url : 'getCourseFee',
				data : {
					courseId : cId
				},
				success : function(data) {
					console.log(data);
					$('#courseFeeId').val(data);
				},
				error : function(xhr, status, error) {
					console.error('Error fetching data:', status, error);
				}
			});
		}
	</script>
</body>
</html>