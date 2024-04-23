<?php

include 'conn.php';

$id = $_POST['id'];
$username = $_POST['username'];
$level = 'admin';

$queryResult = $connect->query("UPDATE admin SET level='".$level."' WHERE id='".$id."'" );



?>

