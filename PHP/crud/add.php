<?php

    require('config.php');

    $name = $_POST['name'];
    $cname = $_POST['cname'];
    $email = $_POST['email'];
    $jvacant = $_POST['jvacant'];
    $sneed = $_POST['sneed'];
    $cno = $_POST['cno'];
    $id = $_POST['id'];

    $insert = $conn->query("INSERT INTO user (name,cname,email,jvacant,sneed,cno)VALUES('$name' ,'$cname', '$email', '$jvacant' , '$sneed' , '$cno')");
    if ($insert) {
        echo "Success";
    }
    $conn->close();
    return;