[#ftl]
[#import "/spring.ftl" as spring /]
<head>
 <meta charset="utf-8">
 	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>StartToBet</title>
    <link  href="[@spring.url '/css/bootstrap.min.css' /]" rel="stylesheet">
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="[@spring.url '/js/bootstrap.min.js' /] "></script>
    <link  href="[@spring.url '/maxcdn/3.3.7/css/bootstrap.min.css' /]" rel="stylesheet">
    
    <link  href="[@spring.url '/css/bootstrap.min.css' /]" rel="stylesheet">
    <link  href="[@spring.url '/css/ionicons.min.css' /]" rel="stylesheet">

  	
	
</head>
<style>
	body {
	  background: #466368;
	  background: -webkit-linear-gradient(#f7f7f7, #dbdbdb, #bfbfbf);
	  background:    -moz-linear-gradient(#f7f7f7, #dbdbdb, #bfbfbf);
	  background:         linear-gradient(#f7f7f7, #dbdbdb, #bfbfbf);
	}
	.table-nonfluid {
	   width: auto !important;
	}
	container2{margin-top:50px;}
	.panel-body { padding:0px; }
	.panel-body ul { padding-left: 15px }
	
	li{
		border: 1px solid rgba(211, 211, 211, .3);
	}
	
	ul{
		border: 1px inset rgba(211, 211, 211, .3);
		
	}
	.ion-ios-tennisball{
		font-size: 20px;
	}
	
	.ion-ios-football{
		font-size: 20px;
	}
	.ion-social-dribbble{
		font-size: 20px;
	}
	.ion-ios-baseball{
		font-size: 20px;
	}
	.ion-ios-americanfootball{
		font-size: 20px;
	}
	.clickable
	{
		
	    cursor: pointer;
	}
		.clickable:hover{
   	 	background-color: rgba(211, 211, 211, .5);
	}
	
	a {
	  -webkit-user-select:none;
	  -khtml-user-select:none;
	  -moz-user-select:none;
	  -ms-user-select:none;
	  -o-user-select:none;
	  user-select:none;
	  display : block;
	  
	}
	
	a {
	    text-decoration: none !important;
	}
	a.clickable { color: inherit; }
	a.clickable:hover { text-decoration:none; }
	
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
      		<a class="dropdown-toggle" data-toggle="dropdown" href="./football"><span class="glyphicon glyphicon-user"> ${currentUser.userName!''}</span></a>
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

<div class="container2">
    
        <div class="col-sm-3 col-md-3">
            <div class="panel-group" id="accordion" >
                <div class="panel panel-default">
                    <div class="panel-heading clickable"  aria-expanded="false" aria-controls="collapseExample">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" data-target="#collapseOne"><span class="ionicons ion-ios-football">
                            </span>   Football</a>
                        </h4>
                    </div>
                    
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                           <ul class="nav" style="padding-left:0px;">
                                <li>
                                    <a href="/football">Premier League</a>
                                </li>
                                <li>
                                    <a href="http://www.jquery2dotnet.com">Primera Division</a>
                                </li>
                            
                                <li>
                                    <a href="http://www.jquery2dotnet.com">Ligue One</a>
                                </li>
                                <li>
                                    <a href="http://www.jquery2dotnet.com">Bundesliga</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading clickable">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" data-target="#collapseTwo"><span class="ionicons ion-ios-tennisball">
                            </span>   Tennis</a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                          <ul class="nav" style="padding-left:0px;">
                               <li>
                                    <a href="http://www.jquery2dotnet.com">ATP Tennis</a>
                               </li>
                               <li>
                                    <a href="http://www.jquery2dotnet.com">WTA Tennis</a>
                               </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading clickable">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" data-target="#collapseThree"><span class="ion-social-dribbble">
                            </span>   Basketball</a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                          <ul class="nav" style="padding-left:0px;">
                               <li>
                                    <a href="http://www.jquery2dotnet.com">NBA</a>
                               </li>
                                 <li>
                                    <a href="http://www.jquery2dotnet.com">EuroLeague</a>
                               </li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="panel panel-default">
                    <div class="panel-heading clickable">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" data-target="#collapseFour"><span class="ion-ios-baseball">
                            </span>   Baseball</a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse">
                        <div class="panel-body">
                          <ul class="nav" style="padding-left:0px;">
                               <li>
                                    <a href="http://www.jquery2dotnet.com">MLB</a>
                               </li>
                                 <li>
                                    <a href="http://www.jquery2dotnet.com">LMB</a>
                               </li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                 <div class="panel panel-default">
                    <div class="panel-heading clickable">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" data-target="#collapseFive"><span class="ion-ios-americanfootball">
                            </span>   American Football</a>
                        </h4>
                    </div>
                    <div id="collapseFive" class="panel-collapse collapse">
                        <div class="panel-body">
                          <ul class="nav" style="padding-left:0px;">
                               <li>
                                    <a href="http://www.jquery2dotnet.com">CFL</a>
                               </li>
                                 <li>
                                    <a href="http://www.jquery2dotnet.com">NFL</a>
                               </li>
                            </ul>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
   
</div>


[#escape x as x?html]


  <style>
	table, th, td {
    	border-collapse: collapse;
	}
	
	th, td {
    padding: 9px;
	}
	tr, td, th{
		border: 1px solid #aaa;
	}
	.table-bordered2 {
	  border: 1px solid #aaa;
	}
  </style>



 <div class="table-responsive">
 	<div class="panel panel-default">
    	<div class="panel-heading text-center"><b>Premier League</b></div>
 			<table class="table table-nonfluid table-bordered2 table-striped table-condense">
				  <thead class="thead-default">
					<tr>
						<th><p align="center">Date</th>
						<th><p align="center">Match Title</th>
						<th><p align="center">1</th>
						<th><p align="center">2</th>
						<th><p align="center">x</th>
						<th><p align="center">1x</th>
						<th><p align="center">x2</th>
						<th><p align="center">12</th>
						
					</tr>
					 <thead> <tbody>
					<!-- begin iteration -->
					[#if matches??]
						[#list matches as match] 
							<tr>
								<td align="center">${match.matchDate}</td>
								<td align="center">${match.matchTitle}</td>
								<td><button type="button" class="btn btn-info center-block">${match.hWin?string["0.00"]}</button></td>
								<td><button type="button" class="btn btn-info center-block">${match.aWin?string["0.00"]}</button></td>
								<td><button type="button" class="btn btn-info center-block">${match.draw?string["0.00"]}</button></td>
								<td><button type="button" class="btn btn-info center-block">${match.hOrDraw?string["0.00"]}</button></td>
								<td><button type="button" class="btn btn-info center-block">${match.aOrDraw?string["0.00"]}</button></td>
								<td><button type="button" class="btn btn-info center-block">${match.hOra?string["0.00"]}</button></td>				
							</tr>
						[/#list]
					[/#if]
				<!-- end iteration -->
 				</tbody>
			</table>
 		</div>
 	</div>
 </div>

[/#escape]
