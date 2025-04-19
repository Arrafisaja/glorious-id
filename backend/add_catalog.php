<?php
include 'db.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $name = $_POST['game_name'];
  $price = $_POST['price'];
  $img = $_FILES['image']['name'];
  $tmp = $_FILES['image']['tmp_name'];
  move_uploaded_file($tmp, "../uploads/$img");
  $stmt = $conn->prepare("INSERT INTO catalog (game_name, price, image) VALUES (?, ?, ?)");
  $stmt->bind_param("sis", $name, $price, $img);
  $stmt->execute();
  header('Location: ../admin.html');
}
?>