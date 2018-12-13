<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value='/productadd' var="url"></c:url>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
tr:nth-child(even) {
	background-color: #fbf2ad
}

tr:nth-child(odd) {
	background-color: #b0bf35
}

.linesa {
	border-bottom: 8px solid #225378;
	width: 100%;
	position: relative;
}

.linesa:before {
	content: "";
	position: absolute;
	height: 12px;
	width: 50%;
	background: green;
	left: 25%;
	margin-top: -2px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#table_id').dataTable({
			"pagingType" : "full_numbers",
			"lengthMenu" : [ [ 2, 5, 10, -1 ], [ 2, 5, 10, "All" ] ],
			"ordering" : true,
		});
	});
</script>
<div class="container">

	<div>
		<c:if test="${errstatus}">
			<span class="alert alert-danger form-control">Failed to process the data</span>
		</c:if>
		<c:if test="${succstatus}">
			<span class="alert alert-danger form-control"> Added Successfully</span>
		</c:if>


		<form:form modelAttribute="product" action="${url}" method="post" enctype="multipart/form-data">
			<c:if test="${editmode}">
				<form:input type="text" name="psname" path="productid" readonly="true" />
				<form:errors path="name" cssStyle="color:red"></form:errors>
			</c:if>
			<form:input type="text" placeholder="Enter product name"
				name="psname" path="name" />
			<form:errors path="name" cssStyle="color:red"></form:errors>
			<form:input type="text" placeholder="Descripton" name="desic"
				path="description" />
			<form:select path="catid" class="form-control">
				<c:forEach var="p" items="${catlist}">
					<form:option value="${p.catid }">${p.categoryName}</form:option>
				</c:forEach>
			</form:select>
			<form:input type="text" placeholder="Enter The price" name="Price"
				path="price" />
			<form:errors path="price" cssStyle="color:red"></form:errors>
			<form:input type="text" placeholder="Enter the Quantity"
				name="Quantity" path="quantity" />
			<form:errors path="quantity" cssStyle="color:red"></form:errors>
			<form:input type="file" path="image" class="form-control"/>
			<button type="submit">submit</button>
		</form:form>
	</div>

	<div class="line text-center">
		<div class="linesa"></div>
	</div>
	<div class="table-responsive" style="padding-top: 20px">
		<table id="table_id" name="table_id" class="display">
			<thead>
				<tr>
					<th>PRODUCT IMAGE</th>
					<th>PRODUCT ID</th>
					<th>PRODUCT NAME</th>
					<th>DESCRIPTION</th>
					<th>QUANTITY(kg)</th>
					<th>PRICE/Kg</th>
					<th>EDIT</th>
					<th>DELETE</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${productlist}" var="m">
					<tr>
						<td><img src="resources/productimages/${m.productid}.jpg" class="responsive" height="100" width="100"/></td>
					
						<td>${m.productid}</td>
						<td>${m.name}</td>
						<td>${m.description}</td>
						<td>${m.quantity}</td>
						<td>${m.price}</td>
						<td><a class='btn btn-success btn-xs'
							href="editproduct?productid=${m.productid}"><span
								class="glyphicon glyphicon-edit"></span> Edit</a></td>
						<td><a class='btn btn-danger btn-xs'
							href="removeproduct?productid=${m.productid}"><span
								class="glyphicon glyphicon-trash"></span> Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>