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

    <div class="panel-heading">
  		<h3>Welcome aboard!<b>&nbsp&nbsp[#if currentUser??]${currentUser.userName!''}</b></h3>[/#if]
  			
  			<form action="/login">
   				 <input type="image" src="http://www.freeiconspng.com/uploads/login-button-png-4.jpg" alt="Submit" align="right" width="120" height="32">
   			</form>
   	</div>
   	
  <style>
	table, th, td {
    	border-collapse: collapse;
	}
	
	th, td {
    padding: 9px;
	}
  </style>
 
  <table style="width:100%" background="https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Soccer_Field_Transparant.svg/2000px-Soccer_Field_Transparant.svg.png">
  <body>
	<tr>
		<th>Date</th>
		<th>Match Title</th>
		<th>1</th>
		<th>x</th>
		<th>2</th>
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
				<td><button type="button" class="btn btn-success">${match.hWin?string["0.00"]}</button></td>
				<td><button type="button" class="btn btn-danger">${match.draw?string["0.00"]}</button></td>
				<td><button type="button" class="btn btn-success">${match.aWin?string["0.00"]}</button></td>
				<td><button type="button" class="btn btn-warning">${match.hOrDraw?string["0.00"]}</button></td>
				<td><button type="button" class="btn btn-warning">${match.aOrDraw?string["0.00"]}</button></td>
				<td><button type="button" class="btn btn-primary">${match.hOra?string["0.00"]}</button></td>				
			</tr>
		[/#list]
	[/#if]
	
	<!-- end iteration -->
</body>
</table>
</div>



[/#escape]
