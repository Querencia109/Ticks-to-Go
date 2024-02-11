<?php
    $host = "127.0.0.1";
    $user = "root";                    
    $pass = "";                                  
    $db = "db_events";
    $port = 3306;
        $eve = mysqli_connect($host, $user, $pass, $db, $port)or $mysqli->error;
?>