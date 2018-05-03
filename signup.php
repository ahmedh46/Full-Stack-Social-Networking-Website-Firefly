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
           
            <div class="register_box">

                <div class="register_header">
                    <img style="height:50px;position: absolute;left:155;top:42.5;" src="assets/images/logo/logo.png" >
                    <h1>fireFly</h1><span>Social Networking Platform.</span>
                    <h3>Sign up Below!</h3> 
                </div>



                <form action="signup.php" method="POST">
                    <input type="text" name="reg_fname" placeholder="First Name" value="<?php
                    if (isset($_SESSION['reg_fname'])) {
                        echo $_SESSION['reg_fname'];
                    }
                    ?>" required>
                    <br>
                    <?php if (in_array("Your first name must be between 2 and 25 characters<br>", $error_array)) echo "Your first name must be between 2 and 25 characters<br>"; ?>




                    <input type="text" name="reg_lname" placeholder="Last Name" value="<?php
                    if (isset($_SESSION['reg_lname'])) {
                        echo $_SESSION['reg_lname'];
                    }
                    ?>" required>
                    <br>
                    <?php if (in_array("Your last name must be between 2 and 25 characters<br>", $error_array)) echo "Your last name must be between 2 and 25 characters<br>"; ?>

                    <input type="email" name="reg_email" placeholder="Email" value="<?php
                    if (isset($_SESSION['reg_email'])) {
                        echo $_SESSION['reg_email'];
                    }
                    ?>" required>
                    <br>


                    <?php
                    if (in_array("Email already in use<br>", $error_array))
                        echo "Email already in use<br>";
                    else if (in_array("Invalid email format<br>", $error_array))
                        echo "Invalid email format<br>";
                    ?>

                    <input type="password" name="reg_password" placeholder="Password" required>
                    <br>
                    <input type="password" name="reg_password2" placeholder="Confirm Password" required>
                    <br>
                    <?php
                    if (in_array("Your passwords do not match<br>", $error_array))
                        echo "Your passwords do not match<br>";
                    else if (in_array("Your password can only contain english characters or numbers<br>", $error_array))
                        echo "Your password can only contain english characters or numbers<br>";
                    else if (in_array("Your password must be betwen 5 and 30 characters<br>", $error_array))
                        echo "Your password must be between 5 and 30 characters<br>";
                    ?>


                    <input type="submit" name="register_button" value="Register">
                    <br>


                    <br>
                    Already have an account? <a href="signin.php"> Login here </a>
                </form>
            </div>
            <div id="footer">
                Copyright &copy <?php echo date("Y"); ?> fireFly&trade;  All Rights Reserved <br>
                Developed by Ahmed Faisal
            </div>

        </div>


    </body>
</html>