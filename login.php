
<?php
  $title = 'Login';
?>

<?php ob_start(); // custom css ?>
<link rel="stylesheet" href="css/signin.css">
<?php $css = ob_get_clean(); ?>

<?php 
  if(@$this->viewbag['error'])
  { 
?>

<div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Warning!</strong> Incorrect Username or Password
</div>

<?php
  }
?>

<?php 
  if(@$this->viewbag['timeout'])
  { 
?>

<div class="alert alert-info alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Warning!</strong> Your session has expired
</div>

<?php
  }
?>

<form class="form-signin" action="/?login" method="post">
  <h2 class="form-signin-heading">Please sign in</h2>
  <label for="inputEmail" class="sr-only">Email address</label>
  <input type="text" name="username" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>

  <div class="form-group">
    <label for="timeout" class="control-label">
      Stay logged in for: 
      <select name="timeout" id="timeout" class="" placeholder="Session Length" required>
        <option value="10">10 Seconds</option>
        <option value="86400">1 Day</option>
      </select>
    </label>
  </div>

  <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
</form>

<?php ob_start(); // custom js ?>

<script type="text/javascript">

jQuery(document).ready(function() {

  $('form').submit(function() {

    var offset = $('#timeout').val();

    localStorage.setItem('timeout', new Date().getTime() + (offset * 1000));

  });


});

</script>

<?php $js = ob_get_clean(); ?>
