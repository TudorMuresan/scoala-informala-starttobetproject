[#ftl]
[#import "/spring.ftl" as spring /]
<head>
 <meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Matches List</title>
    <link  href="[@spring.url '/css/bootstrap.min.css' /]" rel="stylesheet">
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="[@spring.url '/js/bootstrap.min.js' /] "></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<style>
	body {
	  background: #466368;
	  background: -webkit-linear-gradient(#f7f7f7, #dbdbdb, #bfbfbf);
	  background:    -moz-linear-gradient(#f7f7f7, #dbdbdb, #bfbfbf);
	  background:         linear-gradient(#f7f7f7, #dbdbdb, #bfbfbf);
	}
</style>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
			      <style>
						h1 {
					    	text-shadow: 2px 2px 2px black, 1px 2px 15px gray;
						}
					</style>
					<style>
						h1.serif {
						    font-family: "Arial Black", Gadget, sans-serif;
						}
						h3.serif {
						    font-family: "Arial Black", Gadget, sans-serif;
						}
					</style>
				
      <a class="navbar-brand" href="/..">STARTTOBET.com</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">

      <ul class="nav navbar-nav navbar-right">
      	<li>[#if currentUser??]
      		<a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"> ${currentUser.userName!''}</span></a>
      		<ul class="dropdown-menu">
	            <li><a href="#">Sign out</a></li>
	          </ul>
      		[/#if]
      	</li>
      		
        <li>[#if currentUser??]
			[#else]
				<a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a>
			[/#if]
        </li>   
      </ul>
    </div>
  </div>
</nav>

[#escape x as x?html]

<div class="panel panel-default">

  
  <style>
	table, th, td {
    	border-collapse: collapse;
	}
	
	th, td {
    padding: 9px;
	}
  </style>
 
  <table class="table table-striped">
	<tr class="info" >
		<th>Date</th>
		<th>Match Title</th>
		<th><p style="margin-left: 25px">1</th>
		<th><p style="margin-left: 25px">2</th>
		<th><p style="margin-left: 25px">x</th>
		<th><p style="margin-left: 20px">1x</th>
		<th><p style="margin-left: 20px">x2</th>
		<th><p style="margin-left: 20px">12</th>
		<th></th>
	</tr>
	<!-- begin iteration -->
	[#if matches??]
		[#list matches as match] 
			<tr>
				<td>${match.matchDate}</td>
				<td>${match.matchTitle}</td>
				<td><button type="button" class="btn btn-warning">${match.hWin?string["0.00"]}</button></td>
				<td><button type="button" class="btn btn-warning">${match.aWin?string["0.00"]}</button></td>
				<td><button type="button" class="btn btn-warning">${match.draw?string["0.00"]}</button></td>
				<td><button type="button" class="btn btn-warning">${match.hOrDraw?string["0.00"]}</button></td>
				<td><button type="button" class="btn btn-warning">${match.aOrDraw?string["0.00"]}</button></td>
				<td><button type="button" class="btn btn-warning">${match.hOra?string["0.00"]}</button></td>				
			</tr>
		[/#list]
	[/#if]
	
	<!-- end iteration -->

</table>
</div>



[/#escape]
