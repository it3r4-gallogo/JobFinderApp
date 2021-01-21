<?php

    require('config.php');

    $name = $_POST['name'];
    $cname = $_POST['cname'];
    $email = $_POST['email'];
    $jvacant = $_POST['jvacant'];
    $sneed = $_POST['sneed'];
    $cno = $_POST['cno'];
    $id = $_POST['id'];

    $insert = $conn->query("UPDATE user SET name = '$name',cname = '$cname',email = '$email',jvacant = '$jvacant', sneed = '$sneed', cno = '$cno' WHERE id = '$id' ");
    if ($insert) {
        echo "Success";
    }
    $conn->close();
    return;