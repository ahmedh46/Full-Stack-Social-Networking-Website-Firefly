<?php  
require 'config/config.php';

if(isset($_SESSION['user_name'])) {
    $userLoggedIn = $_SESSION['user_name'];
    $user_details_query = mysqli_query($con, "SELECT * FROM users where user_name='$userLoggedIn'");
    $user = mysqli_fetch_array($user_details_query);
}
else {
    header("Location: signin.php");
}
?>



<html>
<head>
	<title>Welcome to fireFly</title>
        <!-- javascript/jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="assets/javascript/bootstrap.js"></script>
        <!-- css -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/stylesheets/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="assets/stylesheets/style.css" />
        <link rel="shortcut icon" href="assets/icons/logo.ico" >
        
</head>
<body>