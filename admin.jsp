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
          <a class="navbar-brand" href="/">INFS3202 - Admin</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
              <p class="navbar-text pull-right">Sam</p>
              <li><a href="login.jsp">Logout</a></li>
          </ul>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <div class="container main-content">

      <% 

      if(session.getAttribute("logged_in") == null || !session.getAttribute("logged_in").toString().equals("true")){
          response.sendRedirect("login.jsp");
      }

      if(request.getParameter("edit") != null && !request.getParameter("edit").equals("")){

        String metadataPath = session.getServletContext().getRealPath("") + "/metadata.txt";

        File file = new File(metadataPath);

        BufferedReader reader = new BufferedReader(new FileReader(file));

        String line;
        String[] meta = new String[7];

        while ((line = reader.readLine()) != null) {

          meta = line.split(",");

          String id = meta[0];

          if(id.equals(request.getParameter("edit"))){
            break;
          }

        }

        String id = meta[0];
        String title = meta[1];
        String address = meta[2];
        String lat = meta[3];
        String lng = meta[4];
        String icon = meta[5];
        String thumb = meta[6];


        reader.close();

      %>
     
      <form class="form-signin" method="post">

        <div class="form-group">
        <label class="control-label">Title</label>
        <input name="title" class="form-control" value="<%= title %>" />
      </div>

        <div class="form-group">
        <label class="control-label">Address</label>
        <input name="address" class="form-control" value="<%= address %>" />
      </div>

        <div class="form-group">
        <label class="control-label">Lat Lng</label>
        <input name="latlng" class="form-control" value="<%= lat %>, <%= lng %>" />
      </div>

      <button type="submit" class="btn btn-primary">Submit</button>
      <a href="admin.jsp" class="btn btn-default">Cancel</a>

      </form>

      <hr>
      
      <%

      }


      String metadataPath = session.getServletContext().getRealPath("") + "/metadata.txt";

      File file = new File(metadataPath);

      BufferedReader reader = new BufferedReader(new FileReader(file));

      String line;

      %>
      
      <table class="table">

      <%

      while ((line = reader.readLine()) != null) {

        String[] meta = line.split(",");

        String id = meta[0];
        String title = meta[1];
        String address = meta[2];
        String lat = meta[3];
        String lng = meta[4];
        String icon = meta[5];
        String thumb = meta[6];

        %>
        <tr>
          <td><%= title %></td>
          <td><a href="?edit=<%= id %>">Edit</a></td>
        </tr>
        <%
      }

      reader.close();

    %>
    
  </table>

    </div> <!-- .container -->
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>,
    <script src="js/vendor/bootstrap.min.js"></script>

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBL5l-Lz9gJox_JGXWFqRoI8DN-3CAwqBY"></script>
    </body>
</html>
