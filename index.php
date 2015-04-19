<?php

error_reporting(E_ALL | E_STRICT);

session_start();

class Controller
{
    // View Data
    private $viewbag = [];
    private $template;
  
    private $session;
    private $server;
    private $get;
    private $post;
    private $method;

    function __construct(&$session, $server, $get, $post)
    {
      $this->session = &$session;
      $this->server = $server;
      $this->get = $get;
      $this->post = $post;
      $this->method = $this->server['REQUEST_METHOD'];

      date_default_timezone_set("Australia/Brisbane"); 

      $this->route();
    }

    function logger($path){

      $myfile = fopen("logs/logs.txt", "a") or die("Unable to open file!");
      fwrite($myfile,  date("Y-m-d h:i ") . 'INFS ' . $path . "\n");
      fclose($myfile);

    }
  
    function route()
    {
      if($this->method === 'GET' && isset($this->get['login']))
      {
        return $this->Login();
      }
      
      if ($this->method === 'GET' && isset($this->get['logout']))
      {
        return $this->Logout();
      }
      
      if ($this->method === 'POST' && isset($this->get['login']))
      {
        $username = strtolower($this->post['username']);
        $password = $this->post['password'];
        $timeout = $this->post['timeout']; // inforce 10s or 1 day

        return $this->LoginPost($username, $password, $timeout);
      }
      
      // Session not set
      if (!isset($this->session['logged_in']))
      {
        return $this->Login();
      }
      
      // Timeout has occured
      if ((time() - $this->session['time']) > $this->session['timeout'])
      {
        return $this->Timeout();
      }

      // If we get here show the homepage
      return $this->MyPlaces();
    }
  
    public function Logout()
    {
      session_unset();
      return $this->render('login.php');
    }
  
    public function Login()
    {
      if(in_array("logged_in", $this->session) && $this->session["logged_in"] == true)
      {
        header("Location: /"); // Redirecto Home
      }

      $this->logger("Login");
      return $this->render('login.php');
    }
  
    public function LoginPost($username, $password, $timeout)
    {
      if($username == 'infs' && $password == '3202')
      {
        $this->session["logged_in"] = true;
        $this->session["username"] = $username;

        $this->session["time"] = time();
        $this->session["timeout"] = $timeout;
        
        header("Location: /"); // Redirecto Home
      }
      else
      {
        $this->viewbag['error'] = true;
        return $this->Login();
      }
    }
  
    public function MyPlaces()
    {
      $this->logger("My Places");
      return $this->render('myplaces.php');
    }
  
    public function Timeout()
    {
      $this->viewbag['timeout'] = true;
      $this->logger("Timeout");
      return $this->Logout();
    }
  
    private function render($path)
    {
      $this->template = $path;
      
      // Infect Scope with template before rendering layout, throw away output.
      ob_start();
      include($this->template);
      ob_get_clean();

      // Render Layout
      include('layout.html');
      
      return 200;
    }
  
}

new Controller($_SESSION, $_SERVER, $_GET, $_POST);

?>
