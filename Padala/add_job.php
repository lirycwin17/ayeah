<?php
include 'config.php';

$success_message = "";
$error_message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $client_name = trim($_POST["client_name"]);
    $origin = trim($_POST["origin"]);
    $destination = trim($_POST["destination"]);
    $full_address = trim($_POST["full_address"]);
    $contact_number = trim($_POST["contact_number"]);
    $delivery_notes = trim($_POST["delivery_notes"]);
    $price = trim($_POST["price"]);

    // Validate input
    if (empty($client_name) || empty($origin) || empty($destination) || empty($full_address) || empty($contact_number) || empty($price)) {
        $error_message = "All fields are required.";
    } else {
        try {
            // Insert into job_postings table
            $sql = "INSERT INTO job_postings (client_name, origin, destination, price) VALUES (:client_name, :origin, :destination, :price)";
            $stmt = $conn->prepare($sql);
            $stmt->execute([
                ':client_name' => $client_name,
                ':origin' => $origin,
                ':destination' => $destination,
                ':price' => $price
            ]);

            // Get last inserted job ID
            $job_id = $conn->lastInsertId();

            // Insert into job_details table
            $sql = "INSERT INTO job_details (job_id, full_address, contact_number, delivery_notes) VALUES (:job_id, :full_address, :contact_number, :delivery_notes)";
            $stmt = $conn->prepare($sql);
            $stmt->execute([
                ':job_id' => $job_id,
                ':full_address' => $full_address,
                ':contact_number' => $contact_number,
                ':delivery_notes' => $delivery_notes
            ]);

            $success_message = "Job added successfully!";
        } catch (PDOException $e) {
            $error_message = "Error: " . $e->getMessage();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Job</title>
    <link rel="stylesheet" href="css/add_job.css">
</head>
<body>
    <div class="container">
        <h2>Add a New Job</h2>

        <?php if (!empty($error_message)) { ?>
            <p class="error"><?php echo $error_message; ?></p>
        <?php } ?>
        <?php if (!empty($success_message)) { ?>
            <p class="success"><?php echo $success_message; ?></p>
        <?php } ?>

        <form action="" method="POST">
            <label>Client Name:</label>
            <input type="text" name="client_name" required>

            <label>Origin:</label>
            <input type="text" name="origin" required>

            <label>Destination:</label>
            <input type="text" name="destination" required>

            <label>Full Address:</label>
            <input type="text" name="full_address" required>

            <label>Contact Number:</label>
            <input type="text" name="contact_number" required>

            <label>Delivery Notes:</label>
            <textarea name="delivery_notes"></textarea>

            <label>Price:</label>
            <input type="number" name="price" required>

            <button type="submit">Add Job</button>
        </form>

        <a href="index.php" class="back-button">« Back to Listings</a>
    </div>
</body>
</html>
