<?php
include 'config.php';

// Check if job ID is provided
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    die("Invalid job ID.");
}

$jobId = $_GET['id'];

// Fetch job details
$sql = "SELECT jp.client_name, jp.origin, jp.destination, jp.price, 
               jd.full_address, jd.contact_number, jd.delivery_notes
        FROM job_postings jp
        LEFT JOIN job_details jd ON jp.id = jd.job_id
        WHERE jp.id = :id";

$stmt = $conn->prepare($sql);
$stmt->bindParam(':id', $jobId, PDO::PARAM_INT);
$stmt->execute();
$job = $stmt->fetch(PDO::FETCH_ASSOC);

// If job not found
if (!$job) {
    die("Job not found.");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Details</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h2>Job Details</h2>

        <table class="job-table">
            <tr>
                <th>Client Name</th>
                <td><?php echo htmlspecialchars($job['client_name']); ?></td>
            </tr>
            <tr>
                <th>Origin</th>
                <td><?php echo htmlspecialchars($job['origin']); ?></td>
            </tr>
            <tr>
                <th>Destination</th>
                <td><?php echo htmlspecialchars($job['destination']); ?></td>
            </tr>
            <tr>
                <th>Full Address</th>
                <td><?php echo htmlspecialchars($job['full_address']); ?></td>
            </tr>
            <tr>
                <th>Contact Number</th>
                <td><?php echo htmlspecialchars($job['contact_number']); ?></td>
            </tr>
            <tr>
                <th>Delivery Notes</th>
                <td><?php echo htmlspecialchars($job['delivery_notes']); ?></td>
            </tr>
            <tr>
                <th>Price</th>
                <td>PHP<?php echo htmlspecialchars($job['price']); ?></td>
            </tr>
        </table>

        <a href="index.php" class="back-button">« Back to Listings</a>
    </div>
</body>
</html>
