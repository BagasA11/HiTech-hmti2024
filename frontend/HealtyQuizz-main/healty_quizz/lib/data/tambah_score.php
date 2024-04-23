<?php

include 'conn.php';

$id = $_POST['id'];
$score = $_POST['score'];

$queryResult = $connect->query("UPDATE admin SET score='".$score."' WHERE id='".$id."'" );



?>