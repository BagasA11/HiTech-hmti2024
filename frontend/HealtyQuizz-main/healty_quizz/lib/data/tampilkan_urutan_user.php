<?php

include 'conn.php';



$queryResult = $connect->query("SELECT * FROM admin ORDER BY 'score' ASC");

$result = array();

while ($fetchData = $queryResult->fetch_array()) {
    $result[]= $fetchData;
}

echo json_encode($result);

?>