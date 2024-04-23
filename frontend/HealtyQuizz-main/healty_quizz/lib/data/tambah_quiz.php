<?php

include 'conn.php';

$id = '';
$question = $_POST['question'];
$option_a = $_POST['option_a'];
$option_b = $_POST['option_b'];
$option_c = $_POST['option_c'];
$option_d = $_POST['option_d'];
$answear = $_POST['answear'];
$correct_option = $_POST['correct_option'];

$queryResult = $connect->query("INSERT INTO quiz VALUES ('$id','$question','$option_a','$option_b','$option_c','$option_d','$answear','$correct_option')");



?>