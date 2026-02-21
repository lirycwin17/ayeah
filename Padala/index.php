<?php
include 'config.php';
include 'auth.php';
require_login();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PadalaX</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h2>PadalaX</h2>
        <p>Welcome, <?= htmlspecialchars($_SESSION['username']); ?> | <a href="logout.php">Log out</a></p>
        <a href="add_job.php" class="add-job-button">+ Add Job</a>
           <div id="job-list">
    <?php include 'fetch_jobs.php'; ?>
</div>
 

    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
</html>