[#ftl]
[#import "/spring.ftl" as spring /]
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Matches List</title>
    <link  href="[@spring.url '/css/bootstrap.min.css' /]" rel="stylesheet">
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="[@spring.url '/js/bootstrap.min.js' /] "></script>
	
</head>
[#escape x as x?html]

<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">Panel heading</div>
  <div class="panel-body">
  </div>

  <table class="table">
	<tr>
		<th>Date</th>
		<th>Match Title</th>
		<th>1</th>
		<th>2</th>
		<th>x</th>
		<th>1x</th>
		<th>x2</th>
		<th>12</th>
		<th></th>
		
	</tr>
	<!-- begin iteration -->
	[#if matches??]
		[#list matches as match] 
			<tr>
				<td>${match.matchDate}</td>
				<td>${match.matchTitle}</td>
				<td>${match.hWin}</td>
				<td>${match.aWin}</td>
				<td>${match.draw}</td>
				<td>${match.hOrDraw}</td>
				<td>${match.aOrDraw}</td>
				<td>${match.hOrA}</td>				
			</tr>
		[/#list]
	[/#if]
	
	<!-- end iteration -->

</table>
</div>



[/#escape]