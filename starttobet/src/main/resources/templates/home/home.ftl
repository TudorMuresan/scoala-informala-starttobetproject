[#ftl]
[#import "/spring.ftl" as spring /]
<head>
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
    <link  href="[@spring.url '/css/font-awesome.min.css' /]" rel="stylesheet">
    
    <link  href="[@spring.url '/css/bootstrap.min.css' /]" rel="stylesheet">
    <link  href="[@spring.url '/css/ionicons.min.css' /]" rel="stylesheet">
    <script src="[@spring.url '/js/angular.js' /] "></script>

</head>

<style>
	body {
	  background: #466368;
	  background: -webkit-linear-gradient(#f7f7f7, #dbdbdb, #bfbfbf);
	  background:    -moz-linear-gradient(#f7f7f7, #dbdbdb, #bfbfbf);
	  background:         linear-gradient(#f7f7f7, #dbdbdb, #bfbfbf);
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
<body>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
		<style>
			h1.serif {
			    font-family: "Arial Black", Gadget, sans-serif;
			}
			p.serif {
			    font-family: "Arial Black", Gadget, sans-serif;
			    font color="black";
			    align="right";
			}		
		</style>
      <a class="navbar-brand" href=""><span class="fa fa-dribbble pull-left fa-lg"></span>STARTTOBET.com</a>
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


<!--
<div class="ui-layout-west hidden-phone hidden-tablet ui-layout-pane ui-layout-pane-west" style="display: block; position: absolute; margin: 0px; left: 2px; right: auto; top: 55px; bottom: 349px; height: 562px; z-index: 0; width: 242px; visibility: visible;" id="menu">
	<div class="accordion" id="acc">
        <div class="accordion-group">
            <div class="accordion-heading">
	            <button type="button" class="btn btn-default btn-lg btn-block" a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#acc"  title="All Sports" href="#resources">
	            <h2><span class="fa fa-soccer-ball-o pull-left"></span>Sports</h2></a></button>     	
            </div>
            
            <div id="resources" class="accordion-body collapse" style="height: auto;">
                <div class="accordion-inner">
                    <ul class="nav" style="padding-left:0px;">
	                    <a class="btn btn-info btn-lg btn-block" href="/football">
	                    <li>Football</li></a>
	                    
	                    <a class="btn btn-info btn-lg btn-block" href="/tennis">
	                    <li>Tennis</li></a>
                    </ul>
                </div>
            </div>
        </div>
 	</div>
</div>
-->

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
            </div>
        </div>
   
</div>


