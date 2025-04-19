<?php
include 'db.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $game = $_POST['game_type'];
  $uid = $_POST['user_id'];
  $wa = $_POST['wa_number'];
  $nick = $_POST['nickname'];
  $method = $_POST['payment_method'];
  $proof = $_FILES['payment_proof']['name'];
  $tmp = $_FILES['payment_proof']['tmp_name'];
  move_uploaded_file($tmp, "../uploads/$proof");
  $stmt = $conn->prepare("INSERT INTO orders (game_type, user_id, wa_number, nickname, payment_method, payment_proof, status) VALUES (?, ?, ?, ?, ?, ?, 'pending')");
  $stmt->bind_param("ssssss", $game, $uid, $wa, $nick, $method, $proof);
  $stmt->execute();
  echo "success";
}
?>