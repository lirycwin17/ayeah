<?php
include 'config.php';

$limit = 10; // Number of jobs per page
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $limit;

// Get total jobs count
$total_query = $conn->query("SELECT COUNT(*) AS total FROM job_postings");
$total_jobs = $total_query->fetch(PDO::FETCH_ASSOC)['total'];
$total_pages = ceil($total_jobs / $limit);

// Fetch paginated jobs
$sql = "SELECT id, client_name, origin, destination, price 
        FROM job_postings 
        ORDER BY id DESC 
        LIMIT :limit OFFSET :offset";
$stmt = $conn->prepare($sql);
$stmt->bindParam(':limit', $limit, PDO::PARAM_INT);
$stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
$stmt->execute();
$jobs = $stmt->fetchAll(PDO::FETCH_ASSOC);

foreach ($jobs as $job): ?>
    <div class="job-box">
        <h3><a href="details.php?id=<?= $job['id']; ?>"><?= htmlspecialchars($job['client_name']); ?></a></h3>
        <p><strong>Origin:</strong> <?= htmlspecialchars($job['origin']); ?></p>
        <p><strong>Destination:</strong> <?= htmlspecialchars($job['destination']); ?></p>
        <p><strong>Price:</strong> PHP<?= htmlspecialchars($job['price']); ?></p>
    </div>
<?php endforeach; ?>

<!-- Pagination Links -->
<div class="pagination">
    <?php if ($page > 1): ?>
        <a href="?page=<?= $page - 1 ?>">Prev</a>
    <?php endif; ?>

    <?php for ($i = 1; $i <= $total_pages; $i++): ?>
        <a href="?page=<?= $i ?>" <?= $i == $page ? 'style="font-weight: bold;"' : '' ?>><?= $i ?></a>
    <?php endfor; ?>

    <?php if ($page < $total_pages): ?>
        <a href="?page=<?= $page + 1 ?>">Next</a>
    <?php endif; ?>
</div>
