[#ftl]
[#import "/spring.ftl" as spring /]
<head>
 	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>StartToBet</title>
    
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="[@spring.url '/js/bootstrap.js' /] "></script>
    
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    
    
    <link  href="[@spring.url '/maxcdn/3.3.7/css/bootstrap.css' /]" rel="stylesheet">
    <link  href="[@spring.url '/css/bootstrap.css' /]" rel="stylesheet">
    <link  href="[@spring.url '/css/ionicons.css' /]" rel="stylesheet">
	
	<script>
	function searchViaAjax() {

		var search = {}
		search["username"] = $("#username").val();
		search["email"] = $("#email").val();

		$.ajax({
			type : "GET",
			url : "football",
			success : function(response) {
				
				var $result = $(response).filter('#matchesDiv');
				console.log("SUCCESS: ", $result);
				$('#matchesDiv').replaceWith($result);
				updateFields();
			},
		});

	}</script>
	<script>
		function addEventToReceipt(buttonValue, prediction ,mTitle, buttonId) {
		 	var res;
		 	var exists = false;
		 	var buttonGroup = buttonId.split("_");
	 		window.scrollTo(0,document.body.scrollHeight);
		 	$("button").each(function(e) {
				var currentButtonSelected = this.id.split("_");
			  	if(currentButtonSelected[0]===buttonGroup[0]){
			  	$(this).prop('disabled',true);
			  }			  
			});
			
			$('td:first-child').each(function() {
				res = $(this).text().slice(0,$(this).text().length-1);
			   
		 	
			    if(mTitle==res){
			   	 	exists = true;
			    }
			});
			
			if(exists == false){
			
				$('#recTable tr:last').prev().prev().before('<tr><td>' + mTitle + '<button type="button" class="btn btn-default btn-xs pull-right" onClick="$(this).parent().parent().remove(); updateFields()">X</button></td><td>' + prediction + '</td><td>' + buttonValue + '</td>');
				$('#receptDiv').show();
				
				var floatRegex = /^((\d+(\.\d *)?)|((\d*\.)?\d+))$/;
		     	var totalOdd=1;
		     	var totalMatches =0;
		     	var currentValue = $('#myTotalValue').val();
		     	var lastRow = $('#recTable tr:last');
		     	
		     	$("#receptDiv td:first-child").not(":last").next().next().each(function() {
		     		
		     		res = $(this).text();
		     	
		     		
		     		if(floatRegex.test(res)) {
		     			totalMatches++;
						totalOdd *=res;
					   
					}
		     		
				});
				if($('#myTotalValue').val().length >0){
					$('#placeButton').show();
				}
				
				
				
		     	lastRow.show();
		     	
		     	setRowTotalOdd(lastRow,totalOdd.toFixed(2));
	     		setTotalMatches(lastRow,totalMatches);
	     		setTotalEarnings(lastRow,(currentValue * totalOdd).toFixed(2));
			}
			
		}
	</script>
	<script>
		function updateFields()
		{
			var floatRegex = /^((\d+(\.\d *)?)|((\d*\.)?\d+))$/;
	     	var totalOdd=1;
	     	var totalMatches =0;
	     	var lastRow = $('#recTable tr:last');
	     	var currentValue = $('#myTotalValue').val();
	     	$("button").each(function(e) {
	     		$(this).prop('disabled',false);
	     	});
	 		$("#receptDiv td:first-child").not(":last").each(function() {
	 			var resTemp = $(this).text();
	 			var n = resTemp.includes("VS");
	 			if(n==true){
	 				resFinal = resTemp.slice(0,resTemp.length-1);
	 				
	 				$("button").each(function(e) {
	 				
	 				var currentButtonSelected = this.id.split("_");
	 				
					if(resFinal==currentButtonSelected[0]){
						console.log(currentButtonSelected[0] + "   " + resFinal);
						$(this).prop('disabled',true);
					  }	
					});
	 			}
	 			
	 		});
		 	
	     	$("#receptDiv td:first-child").not(":last").next().next().each(function() {
	     		
	     		res = $(this).text();
	     	
	     		
	     		if(floatRegex.test(res)) {
	     			totalMatches++;
					totalOdd *=res;
				   
				}
	     		if(totalMatches==0){
	     			$('#placeButton').hide();
	     			
	     		}
			});
			
	     	lastRow.show();
	     	
	     	setRowTotalOdd(lastRow,totalOdd.toFixed(2));
     		setTotalMatches(lastRow,totalMatches);
     		if(totalMatches>0){
     			setTotalEarnings(lastRow,(currentValue * totalOdd).toFixed(2));
     		}else{
     			setTotalEarnings(lastRow,'N/A - Please select at least one odd!');
     		}  
		};
	
		function saveReceipt()
		{
			var tempValueAppend="";
			var receiptDetails=[];
			var pairValues=0;
	     	var currentValue = $('#myTotalValue').val();
	     	
	 		$("#receptDiv td").not(":last").each(function() {
	 			pairValues++;
	 			var resTemp = $(this).text();
	 			var splittedResult = resTemp.split("\n");
	 			var splittedTempValue;
	 			
	 			if(pairValues==1){
	 				tempValueAppend+=splittedResult[0].substr(0,splittedResult[0].length-1)+"_";
	 			}else{
	 				tempValueAppend+=splittedResult[0]+"_";
	 			}
	 			
	 			if(pairValues==3){
	 				pairValues=0;
	 				tempValueAppend = tempValueAppend.substr(0,tempValueAppend.length-1);
	 				splittedTempValue = tempValueAppend.split("_");
	 				var n = splittedTempValue[0].includes("VS");
	 				if(n==true){
	 					console.log(currentValue);
		 				resFinal = splittedTempValue;
		 				receiptDetails.push(resFinal);
		 				//console.log(receiptDetails);
		 			}
	 			
	 				tempValueAppend="";
	 			}
	 			
	 			
	 			
	 		});
	 		
	 		var myJson = JSON.stringify(receiptDetails);
		  	$.ajax({
			type : "POST",
			url : "saveReceipt",
			data: {recDetails: myJson, betValue:currentValue},
            dataType: "json",
			success : function() {
				console.log('SUCCESS');
				}
			});
		};
		
		function setRowTotalOdd(rowId, newValue)
		{
		    rowId.find('td:first-child').next().html(newValue);
		};
		
		function setTotalMatches(rowId, newValue)
		{
		    rowId.find('td:first-child').html(newValue);
		};
		
		function setTotalEarnings(rowId, newValue)
		{
		    rowId.find('td:first-child').next().next().html(newValue);
		};
		
		function updateInput(){	
		
		$('#myTotalValue').keyup(function(e){
		     	var floatRegex = /^((\d+(\.\d *)?)|((\d*\.)?\d+))$/;
		     	var totalOdd=1;
		     	var totalMatches =0;
		     	var currentValue = $(this).val();
		     	
		     	if(currentValue.length<1){
		     		$('#placeButton').hide();
		     	}
		     	$("#receptDiv td:first-child").not(":last").next().next().each(function() {
		     		
		     		res = $(this).text();
		     		if(floatRegex.test(res)) {
		     			totalMatches++;
						totalOdd *=res;
					   
					}
		     		
				});
				var lastRow = $('#recTable tr:last');
		     	lastRow.show();
		     	
		     	setRowTotalOdd(lastRow,totalOdd.toFixed(2));
	     		setTotalMatches(lastRow,totalMatches);
	     		if(totalMatches>0){
     				setTotalEarnings(lastRow,(currentValue * totalOdd).toFixed(2));
	     		}else{
	     			setTotalEarnings(lastRow,'N/A - Please select at least one odd!');
	     		}  
	     		if(totalMatches>0){
	     			$('#placeButton').show();
	     		}
		    });
	    }
	</script>
	
	<script>
		$(document).ready(function(){    
	    $('#matchesDiv').hide();
	    $('#receptDiv').hide();
	    $('#recTable tr:last').hide();
	    $('#placeButton').hide();
	    
	});
	</script>
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
	    cursor: pointer;
	}
	a.clickable { color: inherit; }
	a.clickable:hover { text-decoration:none; }
	
}
	
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
      		<a class="dropdown-toggle" data-toggle="dropdown" href=""><span class="glyphicon glyphicon-user"> ${currentUser.userName!''}</span></a>
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
                                    <a clickable onclick="searchViaAjax()">Premier League</a>
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
	   border: 2px solid rgba(211, 211, 211, .5);
	  
	  //background-color: rgba(211, 211, 211, .5);
	}
  </style>



 <div id="matchesDiv" class="table-responsive">
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
								<td><button id="${match.matchTitle}_1" type="button" class="btn btn-info center-block" onclick="addEventToReceipt('${match.hWin?string["0.00"]}','1','${match.matchTitle}', this.id)">${match.hWin?string["0.00"]}</button></td>
								<td><button id="${match.matchTitle}_2" type="button" class="btn btn-info center-block" onclick="addEventToReceipt('${match.aWin?string["0.00"]}','2','${match.matchTitle}', this.id)">${match.aWin?string["0.00"]}</button></td>
								<td><button id="${match.matchTitle}_X" type="button" class="btn btn-info center-block" onclick="addEventToReceipt('${match.draw?string["0.00"]}','X','${match.matchTitle}', this.id)">${match.draw?string["0.00"]}</button></td>
								<td><button id="${match.matchTitle}_1X" type="button" class="btn btn-info center-block" onclick="addEventToReceipt('${match.hOrDraw?string["0.00"]}','1X','${match.matchTitle}', this.id)">${match.hOrDraw?string["0.00"]}</button></td>
								<td><button id="${match.matchTitle}_X2" type="button" class="btn btn-info center-block" onclick="addEventToReceipt('${match.aOrDraw?string["0.00"]}','X2','${match.matchTitle}', this.id)">${match.aOrDraw?string["0.00"]}</button></td>
								<td><button id="${match.matchTitle}_12" type="button" class="btn btn-info center-block" onclick="addEventToReceipt('${match.hOra?string["0.00"]}','12','${match.matchTitle}', this.id)">${match.hOra?string["0.00"]}</button></td>				
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


<div id="receptDiv" class="table-responsive">
 	<div class="panel panel-default"> 
    	<div class="panel-heading text-center" ><b>Your Matches</b></div>
 			<table id ="recTable" class="table table-nonfluid table-bordered2 table-striped table-condense">
				  <thead class="thead-default">
					<tr>
						<th><p align="center">Match Title</th>
						<th><p align="center">Prediction</th>
						<th><p align="center">Odd</th>
						
					</tr>
					 <thead> 
					 	<td align="center" style="background-color: #e4e5e5;">
					 	<button id="placeButton" class="btn btn-success btn-md pull-center" onclick="saveReceipt()">Place Bet!</button></td>
						<td align="right" colspan="2" ><b>Your bet</b>
     					
						<input id="myTotalValue" style="background-color: #ebf0f0;" onchange="updateInput();" onkeyup="this.onchange();" onpaste="this.onchange();" oninput="this.onchange();" type="text" placeholder="Place your bet!"></td>
					<tr>
						<td align="center" style="background-color: #45b3e0;"><b>Total Matches</b>
						<td align="center" style="background-color: #45b3e0;"><b>Total Odd</b>
						<td align="center" style="background-color: #45b3e0;"><b>Total Earnings</b></tr>
					<tr>
						<td align="center" style="background-color: #ebf0f0;"><b>1</b>
						<td align="center" style="background-color: #ebf0f0;"><b>2</b>
						<td align="center" style="background-color: #ebf0f0;"><b>N/A</b></tr>
			</table>
 		</div>
 </div>



