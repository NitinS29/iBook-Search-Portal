$(document).ready(function () {

	$('#retrieveList').click(function () {
		var displayResources = $('#displayList');

		displayResources.text('Loading books....');

		$.ajax({
			url: "https://itunes.apple.com/search?term=+"+encodeURIComponent($("#search").val())+"&entity=audiobook",
			dataType: "text",
			success: function(result){
				var data = JSON.parse(result);

				console.log(data);
				$("tr").addClass("list");
				var output="<table id='dataTable'><tbody>";
				for (var i in data.results)
				{
					output+="<tr class = 'details w3-card animated slideInUp'><td><div class='title'>" + data.results[i].collectionName + "</div><div>" + data.results[i].description.substring(0,100) + "..</div></td><td>$" + data.results[i].collectionPrice + "</td>"+
					"<td class='id'><input type='hidden' id='bookId' name = 'bookId' class='bookId' name='bookId' value="+i+" />"
					+"<button type='submit' class='btn btn-default btn-link'>Details" 
					+"<span class='glyphicon glyphicon-chevron-right'></span>"
					+"</button>"
					+"</form>"
					+"</td></tr>";
				}

				output+="</tbody></table>";

				displayResources.html(output);

				$("#dataTable").on("click", "tr",$(".bookId").val(),function (value) {

					$.ajax({
						type: "POST",
						url: "bookDetail",
						data: {collectionId: "$(this).bookId.val()", action: "bookDetail"},
						success: function(res){
							//document.location.href = 'bookDetail.jsp';
							var id = $(this).closest("tr").find('.bookId').val();
							console.log("id: " + value.data);
							$("#dataTable").remove();


							var newOutput = "<table id='detailsTable' class='contentTable w3-card animated bounceInRight'>"+
							+ "<tr><td>Title</td><td>" + data.results[id].collectionName +"</td></tr>" +
							+ "<tr><td>Description</td><td>" +data.results[id].description + "</td></tr>"	;	

							newOutput+="</table>";
							$(newOutput).appendTo(document.body);
						},
						dataType: "html"
					});


				});

			}
		});
	});

});