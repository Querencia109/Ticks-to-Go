
<?php
session_start();
include('config.php');
extract($_POST);
mysqli_query($eve, "insert into  tbl_registration values(NULL,'$name','$email','$phone','$age','$gender','500','CURRENT_TIMESTAMP()')");
$id = mysqli_insert_id($eve);
mysqli_query($eve, "insert into  tbl_users values('$id','$email','$password', '0')");
$_SESSION['user'] = $id;
header('location:index.php');
?>