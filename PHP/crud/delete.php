<?php

    require('config.php');

    $id = $_POST['id'];

    $delete = $conn->query("DELETE FROM user WHERE id = '$id' ");
    if ($delete) {
        echo "Success";
    }
    $conn->close();
    return;