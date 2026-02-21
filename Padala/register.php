<?php
include 'config.php';
include 'auth.php';

if (is_logged_in()) {
    header('Location: index.php');
    exit;
}

$error_message = '';
$success_message = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($username === '' || $password === '') {
        $error_message = 'Username and password are required.';
    } elseif (strlen($password) < 6) {
        $error_message = 'Password must be at least 6 characters.';
    } else {
        $checkSql = 'SELECT id FROM users WHERE username = :username LIMIT 1';
        $checkStmt = $conn->prepare($checkSql);
        $checkStmt->execute([':username' => $username]);

        if ($checkStmt->fetch()) {
            $error_message = 'Username already exists.';
        } else {
            $insertSql = 'INSERT INTO users (username, password_hash) VALUES (:username, :password_hash)';
            $insertStmt = $conn->prepare($insertSql);
            $insertStmt->execute([
                ':username' => $username,
                ':password_hash' => password_hash($password, PASSWORD_DEFAULT),
            ]);

            $success_message = 'Account created successfully. You can now log in.';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - PadalaX</title>
    <link rel="stylesheet" href="css/auth.css">
</head>
<body>
    <div class="auth-container">
        <h2>Create Account</h2>

        <?php if ($error_message !== ''): ?>
            <p class="error"><?= htmlspecialchars($error_message); ?></p>
        <?php endif; ?>

        <?php if ($success_message !== ''): ?>
            <p class="success"><?= htmlspecialchars($success_message); ?></p>
        <?php endif; ?>

        <form method="POST" action="">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" minlength="6" required>

            <button type="submit">Register</button>
        </form>

        <p class="auth-footer">Already have an account? <a href="login.php">Log in</a></p>
    </div>
</body>
</html>
