<?php
include 'db.php';
$result = $conn->query("SELECT * FROM catalog ORDER BY id DESC");
$catalog = [];
while($row = $result->fetch_assoc()) {
  $catalog[] = $row;
}
echo json_encode($catalog);
?>