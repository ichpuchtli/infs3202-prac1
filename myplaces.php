<?php

  $title = 'My Places';

?>

<div class="row">
  <div class="col-sm-8">
    <div id="map-canvas" class="map"></div>
  </div>
  <div class="col-sm-4" id="places">
        <div class="media">
              <div class="media-left">
                <a href="img/littlecupcakes1.jpeg" class="lightbox-trigger" data-lightbox="littlecupcakes">
                  <img class="media-object thumbnail" alt="64x64" src="img/littlecupcakes1.jpeg">
                </a>
                <a href="img/littlecupcakes.jpeg" data-lightbox="littlecupcakes"></a>
                <a href="img/littlecupcakes2.jpeg" data-lightbox="littlecupcakes"></a>
              </div>
              <div class="media-body">
                <h4 class="media-heading"> <img src="img/markers/letter_a.png"> <a href="/page1.php" class="text location" id="littlecupcakes">Little Cupcakes &raquo;</a></h4>
                <address class="text">
                  Shop 7 Degraves Street<br>
                  Melbourne VIC 3000<br>
                  <span class="glyphicon glyphicon-earphone"></span> (03) 9077 0413
                </address>
              </div>
            </div>

        <div class="media">
              <div class="media-left">
                <a href="img/grilldlogo.jpeg" class="lightbox-trigger" data-lightbox="grilld">
                  <img class="media-object thumbnail" alt="64x64" src="img/grilldlogo.jpeg">
                </a>
                <a href="img/grilld.jpeg" data-lightbox="grilld"></a>
              </div>
              <div class="media-body">
                <h4 class="media-heading"><img src="img/markers/letter_b.png"> <a href="/page2.php" class="text">Grill'd &raquo;</a></h4>
                <address class="text">
                  15 Degraves Street<br>
                  Melbourne VIC 3000<br>
                  <span class="glyphicon glyphicon-earphone"></span> (03) 9654 7666
                </address>
              </div>
          </div>

        <div class="media">
              <div class="media-left">
                <a href="img/youngandjacksons0.jpeg" class="lightbox-trigger" data-lightbox="young">
                  <img class="media-object thumbnail" alt="64x64" src="img/youngandjacksons0.jpeg">
                </a>
                <a href="img/youngandjacksons1.jpeg" data-lightbox="young"></a>
              </div>
              <div class="media-body">
                <h4 class="media-heading"><img src="img/markers/letter_c.png"> <a href="/page3.php" class="text">Young and Jacksons &raquo;</a></h4>
                <address class="text">
                  Swanston Street<br>
                  Melbourne VIC 3000 <br>
                  <span class="glyphicon glyphicon-earphone"></span> (07) 1233 2392
                </address>
              </div>
          </div>


        <div class="media">
              <div class="media-left">
                <a href="img/transit.jpg" class="lightbox-trigger" data-lightbox="transit">
                  <img class="media-object thumbnail" alt="64x64" src="img/transit.jpg">
                </a>
                <a href="img/transit2.jpg" data-lightbox="transit"></a>
              </div>
              <div class="media-body">
                <h4 class="media-heading"><img src="img/markers/letter_d.png"> <a href="/page4.php" class="text">Transit Rooftop Bar &raquo;</a></h4>
                <address class="text">
                  Level 2 Corner Flinders Street &amp; Swanston Street<br>
                  Melbourne VIC 3000<br>
                  <span class="glyphicon glyphicon-earphone"></span> (03) 9654 2058
                </address>
              </div>
          </div>
        <div class="media">
              <div class="media-left">
                <a href="img/sheben0.jpeg" class="lightbox-trigger" data-lightbox="shebeen">
                  <img class="media-object thumbnail" alt="64x64" src="img/sheben0.jpeg">
                </a>
                <a href="img/shebeen1.jpeg" data-lightbox="shebeen"></a>
              </div>
              <div class="media-body">
                <h4 class="media-heading"><img src="img/markers/letter_e.png"> <a href="/page5.php" class="text">Shebeen &raquo;</a></h4>
                <address class="text">
                  36 Manchester Lane<br>
                  Melbourne VIC 3000<br>
                  <span class="glyphicon glyphicon-earphone"></span> (03) 9650 6931
                </address>
              </div>
          </div>
  </div>
</div>

<? ob_start(); // custom js ?>

<script src="js/lightbox.js"></script>
<script src="js/jquery.searchable-1.1.0.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBL5l-Lz9gJox_JGXWFqRoI8DN-3CAwqBY"></script>
<script type="text/javascript" src="js/main.js"></script>

<? $js = ob_get_clean(); ?>
