[#ftl]

[#import "/spring.ftl" as spring /]
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register</title>
    <link  href="[@spring.url '/css/bootstrap.min.css' /]" rel="stylesheet">
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="[@spring.url '/js/bootstrap.min.js' /] "></script>
	

</head>

[#escape x as x?html]

<div class="container">

<body background="http://wallpapercave.com/wp/9du1l5b.jpg">

  <div class="row" id="pwd-container">
    <div class="col-md-4"></div>
    
    <div class="col-md-4">
      <section class="register-form">
        <form method="post" action="#" role="register">
          
          <img src="http://www.clipartkid.com/images/201/kicking-soccer-ball-clip-art-clipart-panda-free-clipart-images-4YnTr3-clipart.png" class="img-responsive" alt="" />
          
        <div class="login-register">
			<a href="/football">Back to Games!</a>
		</div>
		
          <input type="name" name="name" placeholder="Username" required class="form-control input-lg" />
          
          <input type="text" class="form-control input-lg" name="email" id="email"  placeholder="Enter your Email"/>
          
          <input type="password" class="form-control input-lg" name="password" id="password"  placeholder="Enter your Password"/>
          
          <input type="password" class="form-control input-lg" name="confirm" id="confirm"  placeholder="Confirm your Password"/>
          
          
          <div class="pwstrength_viewport_progress"></div>
          
          
          <div class="form-group ">
							<button type="button" class="btn btn-primary btn-lg btn-block login-button">Register</button>
						
				            <a href="/login">Login</a>
				         </div>
          
        </form>
        
  </div>
  
</div>


[/#escape]