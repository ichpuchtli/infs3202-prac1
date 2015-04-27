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
        <link href="css/lightbox.css" rel="stylesheet" />
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
          <a class="navbar-brand" href="/">INFS3202 - My Places</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
              <li><a href="login.jsp">Login</a></li>
          </ul>
          <div class="navbar-form navbar-right">
            <div class="form-group has-feedback">
              <input type="text" placeholder="Search..." class="form-control" id="search" />
              <span class="glyphicon glyphicon-search form-control-feedback"></span>
            </div>
          </div>
          <p class="navbar-text pull-right" id="location"></p>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <div class="container main-content">
      
      <div class="row">

        <div class="col-sm-8">
          <div id="map-canvas" class="map"></div>
        </div>

        <div class="col-sm-4" id="places">

          <%

          String metadataPath = session.getServletContext().getRealPath("") + "/metadata.txt";

          File file = new File(metadataPath);

          BufferedReader reader = new BufferedReader(new FileReader(file));

          String line;

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
            
          <div class="media">

            <div class="media-left">
              <a href="?page=<%= id %>">
                <img class="media-object thumbnail" alt="64x64" src="img/<%= thumb %>">
              </a>
            </div>

            <div class="media-body">
              <h4 class="media-heading"> <img src="img/markers/<%= icon %>"> <a href="?page=<%= id %>" class="text location" id=""><%= title %> &raquo;</a></h4>
              <a href="#" class="btn btn-xs btn-primary moreinfo">More Info</a>
              <div class="hidden">
                <address class="text">
                  <%= address %><br>
                  <span class="glyphicon glyphicon-earphone"></span> (03) 9077 0413
                </address>
              </div>
            </div>

          </div> <!-- .media -->
            
            <%
          }

          reader.close();

          %>

        </div> <!-- .col -->

      </div> <!-- .row -->

    </div> <!-- .container -->
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>,
    <script src="js/vendor/bootstrap.min.js"></script>

    <script src="js/lightbox.js"></script>
    <script src="js/jquery.searchable-1.1.0.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBL5l-Lz9gJox_JGXWFqRoI8DN-3CAwqBY"></script>
    <script type="text/javascript" src="js/main.js"></script>
    </body>
</html>
