<?php

    require('config.php');

    $result = $conn->query("SELECT * FROM user ORDER BY name");
    $data = array();
    while($row = $result->fetch_assoc()){
        $data[]=$row;
    }
    echo json_encode($data);
    $conn->close();
    return;
