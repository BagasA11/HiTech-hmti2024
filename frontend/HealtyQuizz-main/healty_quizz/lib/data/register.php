<?php

include 'conn.php';

$id = '';
$username = $_POST['username'];
$password = $_POST['password'];
$email = $_POST['email'];
$level = 'member';
$score = '0';

$queryResult = $connect->query("INSERT INTO admin VALUES ('$id','$username','$password','$email','$level','$score')");



?>