<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>INFS3202 - Prac3</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/signin.css">
    </head>
    <body>
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">INFS3202 - Login</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
              <li><a href="?login">Login</a></li>
          </ul>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <div class="container main-content">

      <% 

      session.setAttribute("logged_in", null); // clear session

      if(request.getMethod().equals("POST")){

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if(username.equals("username") && password.equals("password")){

          session.setAttribute("logged_in", "true");

          response.sendRedirect("admin.jsp");

        }else{

        %>

        <div class="alert alert-danger alert-dismissible" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <strong>Warning!</strong> Incorrect Username or Password
        </div>

        <%
        }

      }
      %>
          
          
    <form class="form-signin" action="/login.jsp" method="post">

      <h4 class="page-header">Admin Login</h4>

      <div class="form-group">
        <label for="username" class="control-label">Email address</label>
        <input type="text" name="username" id="username" class="form-control" placeholder="Username" required autocomplete="off">
      </div>

      <div class="form-group">
        <label for="password" class="control-label">Password</label>
        <input type="password" name="password" id="password" class="form-control" placeholder="Password" required autocomplete="off">
      </div>

      <button class="btn btn-lg btn-success pull-right" type="submit">Sign in</button>
    </form>


    </div> <!-- .container -->
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>,
    <script src="js/vendor/bootstrap.min.js"></script>

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBL5l-Lz9gJox_JGXWFqRoI8DN-3CAwqBY"></script>
    </body>
</html>
