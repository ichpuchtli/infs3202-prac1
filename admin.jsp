<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.channels.FileChannel" %>


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
          <a class="navbar-brand" href="/admin.jsp">INFS3202 - Admin</a>
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

      if(request.getMethod().equals("POST")){

        String metadataPath = session.getServletContext().getRealPath("") + "/metadata.txt";

        File file = new File(metadataPath);

        BufferedReader reader = new BufferedReader(new FileReader(file));

        String line;
        StringBuilder builder = new StringBuilder();

        while ((line = reader.readLine()) != null) {

          String[] meta = line.split(",");

          String id = meta[0];

          if(id.equals(request.getParameter("id"))){

            String newTitle = request.getParameter("title");
            String newAddress = request.getParameter("address");
            String newLat = request.getParameter("latlng").split(",")[0];
            String newLng = request.getParameter("latlng").split(",")[1];
            String icon = meta[5];
            String thumb = request.getParameter("thumb");

            builder.append(id + "," + newTitle + "," + newAddress + "," + newLat + "," + newLng + "," + icon + "," + thumb + "\n");

          }else {
            builder.append(line + "\n");
          }

        }

        reader.close();

        file = new File(metadataPath);

        FileChannel outChan = new FileOutputStream(file, true).getChannel();
        outChan.truncate(0);
        outChan.close();

        file = new File(metadataPath);

        FileWriter writer = new FileWriter(file);
        
        writer.write(builder.toString());

        writer.close();

      }
      else if(request.getParameter("edit") != null && !request.getParameter("edit").equals("")){

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
     
      <div class="row">

      <form class="col-sm-6" method="post" class="">

        <input type="hidden" name="id" value="<%= id %>" />

        <div class="form-group">
        <label class="control-label">Title</label>
        <input name="title" class="form-control validate" value="<%= title %>" required/>
        <p class="alert alert-danger hidden">Title must be more than 4 charactors</p>
      </div>

        <div class="form-group">
        <label class="control-label">Address</label>
        <input name="address" class="form-control validate" value="<%= address %>" required/>
        <p class="alert alert-danger hidden">Address is required</p>
      </div>

        <div class="form-group">
        <label class="control-label">Latitude & Longitutde</label>
        <input name="latlng" class="form-control" value="<%= lat %>, <%= lng %>" />
      </div>

        <div class="form-group">
        <label class="control-label">Thumbnail</label>
        <input name="thumb" class="form-control" value="<%= thumb %>" />
        </div>

      <button type="submit" class="btn btn-primary">Submit</button>
      <a href="admin.jsp" class="btn btn-default">Cancel</a>

      </form>

      <img src="img/<%= thumb %>" class="col-sm-6">

    </div>
      
    <div class="clearfix"></div>

      <hr>
      
      <%

      }


      String metadataPath = session.getServletContext().getRealPath("") + "/metadata.txt";

      File file = new File(metadataPath);

      BufferedReader reader = new BufferedReader(new FileReader(file));

      String line;

      %>
      
      <table class="table table-bordered">

        <tr>
          <th>Title</td>
          <th>Address</td>
          <th>LatLng</td>
          <th>Action</td>
        </tr>
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
          <td><%= address %></td>
          <td><%= lat %>,<%= lng %></td>
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

    <script type="text/javascript">

      jQuery(document).ready(function() { 

          $('input.validate').keyup(function() {

            var $input = $(this);
            var $warning = $input.next('p');
            var $submit = $input.parents('form').find('input[type=submit]');

            if($input.val() == undefined || $input.val().length < 4 || $input.val() == ""){
              $warning.removeClass('hidden');
              $submit.prop('disabled', true);
            } else {
              $warning.addClass('hidden');
              $submit.prop('disabled', false);
            }

          });

      });

    </script>
    </body>
</html>
