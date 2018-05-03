<?php
require 'config/config.php';
include("includes/classes/User.php");
include("includes/classes/Post.php");
include("includes/classes/Message.php");
include("includes/classes/Notification.php");

if (isset($_SESSION['user_name'])) {
    $userLoggedIn = $_SESSION['user_name'];
    $user_details_query = mysqli_query($con, "SELECT * FROM users where user_name='$userLoggedIn'");
    $user = mysqli_fetch_array($user_details_query);
} else {
    header("Location: signin.php");
}
?>



<html>
    <head>

        <title>Welcome to fireFly</title>
        <!-- javascript/jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src="assets/javascript/bootstrap.js"></script>
        <script src="assets/javascript/bootbox.min.js"></script>
        <script src="assets/javascript/full.js"></script>
        <script src="assets/javascript/jquery.Jcrop.js"></script>
        <script src="assets/javascript/jcrop_bits.js"></script>

        <!-- css -->
        <link rel="stylesheet" type="text/css" href="assets/stylesheets/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="assets/stylesheets/bootstrap.css" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="shortcut icon" href="assets/icons/logo.ico" >
        <link rel="stylesheet" type="text/css" href="assets/stylesheets/style.css" />
        <link rel="stylesheet" media="(max-width: 1550px)" href="assets/stylesheets/header_1550.css" />
        <link rel="stylesheet" typ="text/css" href="assets/stylesheets/jquery.Jcrop.css">


    </head>
    <body>


        <div class="top_bar">
            <div class="logo">
                <a  href="index.php"><img id="toplogo" src =assets/images/logo/logo.png></a>
                <a id="toplogobar" href="index.php">fireFly</a>
            </div>
            <div class="search">

                <form action="search.php" method="GET" name="search_form">
                    <input type="text" onkeyup="getLiveSearchUsers(this.value, '<?php echo $userLoggedIn; ?>')" name="q" placeholder="Search and add users" autocomplete="off" id="search_text_input">

                    <span class="button_holder">
                        <img style='height: 20px; width: 40%;'src="assets/icons/Search-icon.png">
                    </span>

                </form>

                <div class="search_results">
                </div>

                <div class="search_results_footer_empty">
                </div>



            </div>

            <br> <nav>
                <?php
                //Unread messages
                $messages = new Message($con, $userLoggedIn);
                $num_messages = $messages->getUnreadNumber();

                //Unread notifications
                $notifications = new Notification($con, $userLoggedIn);
                $num_notifications = $notifications->getUnreadNumber();

                //Unread requests
                $user_obj = new User($con, $userLoggedIn);
                $num_requests = $user_obj->getNumberOfFriendRequests();
                ?>
                <a href="<?php echo $userLoggedIn ?>" id="navahover"><?php echo $user['first_name'] . " " . $user['last_name'] ?> </a> |
                <a href="index.php" id="navahover">News Feed</a> |

                <a href="javascript:void(0);" onclick="getDropdownData('<?php echo $userLoggedIn; ?>', 'message')" id="navahover">Messages

                    <?php
                    if ($num_messages > 0)
                        echo '<span class="notification_badge" id="unread_message">' . "(" . $num_messages . ")" . '</span>';
                    ?>

                </a> | &nbsp
               	<a href="javascript:void(0);" onclick="getDropdownData('<?php echo $userLoggedIn; ?>', 'notification')"><i class="fa fa-bell-o fa-lg" ></i>

                    <?php
                    if ($num_notifications > 0)
                        echo '<span class="notification_badge" id="unread_notification">' . "(" . $num_notifications . ")" . '</span>';
                    ?>

                </a>   &nbsp
                <a href="requests.php">
                    <i class="fa fa-users fa-lg"></i>
                    <?php
                    if ($num_requests > 0)
                        echo '<span class="notification_badge" id="unread_requests">' . "(" . $num_requests . ")" . '</span>';
                    ?>
                </a>
                &nbsp
                <a href="settings.php"><i class="fa fa-cog fa-lg" ></i></a> &nbsp
                <a href="includes/handlers/logout.php"><i class="fa fa-sign-out fa-lg" ></i></a>
            </nav>

            <div class="dropdown_data_window" style="height:0px; border: none;">
                <input type="hidden" id="dropdown_data_type" value="">
            </div>

            <script>
                var userLoggedIn = '<?php echo $userLoggedIn; ?>';

                $(document).ready(function () {

                    $('.dropdown_data_window').scroll(function () {
                        var inner_height = $('.dropdown_data_window').innerHeight(); //Div containing data
                        var scroll_top = $('.dropdown_data_window').scrollTop();
                        var page = $('.dropdown_data_window').find('.nextPageDropdownData').val();
                        var noMoreData = $('.dropdown_data_window').find('.noMoreDropdownData').val();

                        if ((scroll_top + inner_height >= $('.dropdown_data_window')[0].scrollHeight) && noMoreData == 'false') {

                            var pageName; //Holds name of page to send ajax request to
                            var type = $('#dropdown_data_type').val();


                            if (type == 'notification')
                                pageName = "ajax_load_notifications.php";
                            else if (type = 'message')
                                pageName = "ajax_load_messages.php"


                            var ajaxReq = $.ajax({
                                url: "includes/handlers/" + pageName,
                                type: "POST",
                                data: "page=" + page + "&userLoggedIn=" + userLoggedIn,
                                cache: false,

                                success: function (response) {
                                    $('.dropdown_data_window').find('.nextPageDropdownData').remove(); //Removes current .nextpage
                                    $('.dropdown_data_window').find('.noMoreDropdownData').remove(); //Removes current .nextpage


                                    $('.dropdown_data_window').append(response);
                                }
                            });

                        } //End if

                        return false;

                    }); //End (window).scroll(function())


                });

            </script>

        </div>

        <div class="wrapper">
