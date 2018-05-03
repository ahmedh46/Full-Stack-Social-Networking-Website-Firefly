<?php
require 'config/config.php';
require 'includes/form_handlers/register_handler.php';
require 'includes/form_handlers/login_handler.php';
?>
<html>
    <head>
        <title>Welcome to fireFly</title>
        <link href="assets/stylesheets/register_style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" media="(max-width: 1550px)" href="assets/stylesheets/1550.css" />
        <link rel="stylesheet" media="(max-width: 950px) " href="assets/stylesheets/800.css" />
        <link rel="shortcut icon" href="assets/icons/logo.ico" >
    </head>
    <body>
        <div class="wrapper">
            <div class="info_box">
                Add users and chat with friends.<br>
                Show off your pictures, videos and see what's trending! <br> <br>
                Android App coming soon!
            </div>

            <div style="margin-top: 70;"class="register_box">

                <div class="register_header">
                    <img style="height:50px;position: absolute;left:155;top:42.5" src="assets/images/logo/logo.png" >
                    <h1>fireFly</h1><span>Social Networking Platform.</span>
                    <h3>Login Below! </h3> 
                </div>
                <form action="signin.php" method="POST">
                    <?php if (isset($_SESSION['registered'])) {
                    echo "<span style='color: rgb(255, 249, 0);'>You're all set! Go ahead and login!</span><br>"; } ?>
                    <input type="email" name="log_email" placeholder="Email Address" value="<?php
                    if (isset($_SESSION['log_email'])) {
                        echo $_SESSION['log_email'];
                    }
                    ?>" required>
                    <br>
                    <input type="password" name="log_password" placeholder="Password">
                    <br>
                    <?php if (in_array("Email or password was incorrect<br>", $error_array)) echo "Email or password was incorrect<br>"; ?>
                    <input type="submit" name="login_button" value="Login"> <br>
                    <br> <br>
                    
                    Don't have an account? <a href="signup.php"> Sign Up Here </a>
                </form>
            </div>
             <div id="footer">
                Copyright &copy <?php echo date("Y"); ?> fireFly&trade;  All Rights Reserved <br>
                Developed by Ahmed Faisal
            </div>
        </div>
    </body>
</html>