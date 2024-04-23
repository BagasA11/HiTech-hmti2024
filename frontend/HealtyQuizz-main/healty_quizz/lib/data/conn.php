<?php

$connect = new mysqli("localhost","root","","my_store");

if ($connect) {
    
}else {
    echo "connect failed";
    exit();
}

?>