<?php
include("includes/header.php");

$message_obj = new Message($con, $userLoggedIn);


if (isset($_GET['profile_username'])) {
    $username = $_GET['profile_username'];
    $user_details_query = mysqli_query($con, "SELECT * FROM users WHERE user_name='$username'");
    $user_array = mysqli_fetch_array($user_details_query);

    $num_friends = (substr_count($user_array['friend_array'], ",")) - 1;
}

if (isset($_POST['remove_friend'])) {
    $user = new User($con, $userLoggedIn);
    $user->removeFriend($username);
}
if (isset($_POST['add_friend'])) {
    $user = new User($con, $userLoggedIn);
    $user->sendRequest($username);
}
if (isset($_POST['respond_request'])) {
    header("Location: requests.php");
}

if (isset($_POST['post_message'])) {
    if (isset($_POST['message_body'])) {
        $body = mysqli_real_escape_string($con, $_POST['message_body']);
        $date = date("Y-m-d H:i:s");
        $message_obj->sendMessage($username, $body, $date);
    }

    $link = '.profileheader a[href="#messages_div"]';
    echo "<script>
        $(function() {
        $('" . $link . "').tab('show');

        });
    </script>";
}
?>



<div class="profile_left">
    <img src="<?php echo $user_array['profile_pic']; ?>">

    <div class="profile_info">
        <p style='font-size: 25px;'><?php echo $user_array['first_name'] . " " . $user_array['last_name']; ?></p>
        <p><?php echo "Posts: " . $user_array['num_posts']; ?></p>
        <p><?php echo "Likes: " . $user_array['num_likes']; ?></p>
        <p><?php echo "Friends: " . $num_friends; ?></p> 
        <?php
        $logged_in_user_obj = new User($con, $userLoggedIn);
        if ($userLoggedIn != $username) {

            echo '<span style="margin-left: 20;" >' . $logged_in_user_obj->getMutualFriends($username) . " Mutual Friends" . '</span>';
        }
        ?>

    </div>

    <form action="<?php echo $username; ?>" method="POST">
        <?php
        $profile_user_obj = new User($con, $username);
        if ($profile_user_obj->isClosed()) {
            header("Location: user_closed.php");
        }
//$logged_in_user_obj = new User($con, $userLoggedIn);

        if ($userLoggedIn != $username) {
            if ($logged_in_user_obj->isFriend($username)) {
                echo '<input type="submit" name ="remove_friend" class="danger" value="Remove Friend"><br>';
            } else if ($logged_in_user_obj->didReceiveRequest($username)) {
                echo '<input type="submit" name ="respond_request" class="warning" value="Respond to Request"><br>';
            } else if ($logged_in_user_obj->didSendRequest($username)) {
                echo '<input type="submit" name ="" class="default" value="Request Sent"><br>';
            } else {
                echo '<input type="submit" name ="add_friend" class="success" value="Add Friend"><br>';
            }
        }
        ?>

    </form>

   
    
    <input type="submit" class="warning" data-toggle="modal" data-target="#post_form" value="Post Something">


</div>

<div class="profile_main_column column"> 

    <div class="profileheader">

        <span role="presentation" class="active"><a href="#newsfeed_div" aria-controls="newsfeed_div" role="tab" data-toggle="tab">Timeline</a></span>
       <!-- <span role="presentation"><a href="#about_div" aria-controls="about_div" role="tab" data-toggle="tab">About</a></span> -->
        <span role="presentation"><a href="#messages_div" aria-controls="messages_div" role="tab" data-toggle="tab">Messages</a></span>
    </div>
    <hr>
<?php  if($user_array['num_posts'] == 0){
    echo "<div class='welcome'> No posts to show! </div>";
}  
    

?>
    <div class='tab-content'>
        <div role="tabpanel" class="tab-pane fade in active" id="newsfeed_div"> 
            <div class="posts_area"> </div>
            <img  id="loading" src="assets/icons/loading.gif">

        </div>
        <!--
        <div role="tabpanel" class="tab-pane fade " id="about_div"> 

        </div>
        -->
        <div role="tabpanel" class="tab-pane fade " id="messages_div"> 
            <?php
            echo "<h4>You and <a href ='" . $username . "'>" . $profile_user_obj->getFirstAndLastName() . "</a></h4><hr><br>";

            echo "<div class='loaded_messages' id='scroll_messages'>";
            echo $message_obj->getMessages($username);
            echo "</div>";
            ?>
            <div class="message_post">
                <form action="" method="POST"> 
                    <textarea name='message_body' id='message_textarea'  style='resize:none;overflow: auto; border-radius: 5px;font-family: Helvetica ,sans-serif; font-size: 12;' placeholder='Write your message ....' required></textarea>
                    <input type='submit' style='margin-right: 30;'name='post_message' class='info' id='comment_form_submit' value='Send'>
                </form>
            </div>
            <script>
                var div = document.getElementById("scroll_messages");
                div.scrollTop = div.scrollHeight;
            </script>

        </div>
    </div>



</div>


<!-- Modal -->
<div class="modal fade" id="post_form" tabindex="-1" role="dialog" aria-labelledby="postModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Post something</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>This will appear on the user's profile page and also on their newsfeed for your friends to see!</p>

                <form class="profile_post" action="" method="POST">
                    <div class="form-group">
                        <textarea class="form-control" name="post_body" ></textarea>
                        <input type="hidden" name="user_from" value="<?php echo $userLoggedIn; ?>">
                        <input type="hidden" name="user_to" value="<?php echo $username; ?>">
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" name="post-button" id="submit_profile_post" class="btn btn-primary">Post</button>
            </div>
        </div>
    </div>
</div>
<script>
    var userLoggedIn = '<?php echo $userLoggedIn; ?>';
    var profileUsername = '<?php echo $username; ?>';

    $(document).ready(function () {

        $('#loading').show();

        //Original ajax request for loading first posts 
        $.ajax({
            url: "includes/handlers/ajax_load_profile_posts.php",
            type: "POST",
            data: "page=1&userLoggedIn=" + userLoggedIn + "&profileUsername=" + profileUsername,
            cache: false,

            success: function (data) {
                $('#loading').hide();
                $('.posts_area').html(data);
            }
        });

        $(window).scroll(function () {
            var height = $('.posts_area').height(); //Div containing posts
            var scroll_top = $(this).scrollTop();
            var page = $('.posts_area').find('.nextPage').val();
            var noMorePosts = $('.posts_area').find('.noMorePosts').val();

            if ((document.body.scrollHeight == document.body.scrollTop + window.innerHeight) && noMorePosts == 'false') {
                $('#loading').show();

                var ajaxReq = $.ajax({
                    url: "includes/handlers/ajax_load_profile_posts.php",
                    type: "POST",
                    data: "page=" + page + "&userLoggedIn=" + userLoggedIn + "&profileUsername=" + profileUsername,
                    cache: false,

                    success: function (response) {
                        $('.posts_area').find('.nextPage').remove(); //Removes current .nextpage 
                        $('.posts_area').find('.noMorePosts').remove(); //Removes current .nextpage 

                        $('#loading').hide();
                        $('.posts_area').append(response);
                    }
                });

            } //End if 

            return false;

        }); //End (window).scroll(function())


    });

</script>


</div>
</body>
</html>
