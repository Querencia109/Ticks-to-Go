<?php
session_start();
$_SESSION['show'] = $_GET['show'];
$_SESSION['event'] = $_GET['event'];
$_SESSION['stage'] = $_GET['stage'];
if (isset($_SESSION['user'])) {
    header('location:booking.php');
} else {
    header('location:login.php');
}
?>