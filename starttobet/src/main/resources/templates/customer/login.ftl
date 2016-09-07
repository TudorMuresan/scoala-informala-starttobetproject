[#ftl]

[#import "/spring.ftl" as spring /]
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome!</title>
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
      <section class="login-form">
        <form method="POST" action="/login/save">
          <img src="http://www.clipartkid.com/images/201/kicking-soccer-ball-clip-art-clipart-panda-free-clipart-images-4YnTr3-clipart.png" class="img-responsive" alt="" />
          <input type="text" name="userName" placeholder="Username" required class="form-control input-lg" />
          
          <input type="password" class="form-control input-lg" id="password" placeholder="Password" required="" />
          
          
          <div class="pwstrength_viewport_progress"></div>
          
          
          <button type="submit" name="go" class="btn btn-lg btn-primary btn-block">Sign in</button>
          <div>
            <a href="/login/register">Create account</a>
          </div>
          
        </form>
        
  </div>
  
</div>


[/#escape]