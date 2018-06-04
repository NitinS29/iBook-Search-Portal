<html>
<link href="styles/Home.css" rel="stylesheet">
<link href="styles/bootstrap-datepicker3.min.css" rel="stylesheet">
<link href="styles/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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

	<div class="container">
		<div class="row animated bounceInRight">
			<div class="col-xs-12 col-sm-6 col-md-10">
				<div class="well well-sm">
					<div class="row">
						<div class="col-sm-6 col-md-4">
							<div class="fill">
								<img src="${book.artworkUrl100}" alt=""
									class="img-rounded img-responsive" />
							</div>
						</div>
						<div class="col-sm-6 col-md-8">
							<h4>${book.collectionName}</h4>
							<small><i class="glyphicon glyphicon-user">&nbsp;</i>${book.artistName}</small>
							<p>
								<i class="glyphicon glyphicon-star-empty">&nbsp;</i>${book.primaryGenreName}
								<br> <i class="glyphicon glyphicon-usd">&nbsp;</i>${book.collectionPrice}
								<br> <i class="glyphicon glyphicon-heart">&nbsp;</i><a
									href="${book.previewUrl}">Preview</a>
							</p>
							<br> <a href="${book.collectionViewUrl}"
								class="btn btn-primary">Go to iTunes</a>

						</div>
					</div>
				</div>
				<i>Summary:</i><br>
				<i>${book.description}</i>
			</div>
		</div>

	</div>
</body>
</html>