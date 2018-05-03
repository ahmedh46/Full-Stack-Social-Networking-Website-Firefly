<?php
require '../../config/config.php';

if(isset($_GET['post_id'])) {
    $post_id = $_GET['post_id'];
    $userLoggedIn = $_SESSION['user_name'];
}

if(isset($_POST['result'])) {
    if($_POST['result'] == 'true') {
        $query = mysqli_query($con, "UPDATE posts SET deleted='yes' WHERE id='$post_id'");
        $query = mysqli_query($con, "UPDATE users SET num_posts = num_posts -1 WHERE user_name ='$userLoggedIn'");
    }
}
?>