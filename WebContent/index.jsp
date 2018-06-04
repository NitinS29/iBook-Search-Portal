<html>
<link href="styles/Home.css" rel="stylesheet">
<link href="styles/bootstrap-datepicker3.min.css" rel="stylesheet">
<link href="styles/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<body>
	<h1>iBook Search Portal</h1>
	<div class="container">
		<div class="row">
			<div id="custom-search-input">
				<form action="searchBooks" method="POST">
					<div class="input-group col-md-12">
						<input type="hidden" name="action" value="searchBooks" /> <input
							type="text" class="  search-query form-control" name="search"
							id="search" placeholder="Search" /> <span
							class="input-group-btn">
							<button type="submit" class="btn btn-danger" type="button">
								<span class=" glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>

	<section id="content w3-container">

		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<div>
			<c:forEach var="book" items="${books}">

				<div>
					<div class="col-md-3 animated slideInUp">
						<div class="card">
							<div class="card-image">
								<img class="img-responsive" src="${book.artworkUrl100}"> <span
									class="card-title"></span>
							</div>

							<div class="card-content">
								<p>
								<div class="title">${book.collectionName}</div>
								</p>
							</div>

							<div class="card-action">

								<form action="bookDetail" method="POST">
									<input type="hidden" name="action" value="bookDetail" /> <input
										type="hidden" name="selectedBook" value="${book.collectionId}" />
									<button type="submit" class="btn btn-default btn-link">
										More <span class="glyphicon glyphicon-chevron-right"></span>
									</button>
								</form>

							</div>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>

	</section>
</body>
</html>