<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>Admin - Glorious.ID</title>
</head>
<body>
  <h1>Admin Panel</h1>
  <h2>Tambah Katalog</h2>
  <form action="backend/add_catalog.php" method="POST" enctype="multipart/form-data">
    Nama Game: <input type="text" name="game_name" required><br>
    Harga: <input type="decimal" name="price" required><br>
    Gambar: <input type="file" name="image" required><br>
    <button type="submit">Tambah</button>
  </form>

  <h2>Pesanan Masuk</h2>
  <div id="orders"></div>

  <script>
    function loadOrders() {
      fetch('backend/get_orders.php')
        .then(res => res.json())
        .then(data => {
          const container = document.getElementById('orders');
          container.innerHTML = '';
          data.forEach(o => {
            const div = document.createElement('div');
            div.innerHTML = `
              <b>${o.game_type}</b> - ${o.nickname} (${o.user_id})<br>
              WA: ${o.wa_number} | Metode: ${o.payment_method}<br>
              <img src="${o.payment_proof}" width="100"><br>
              Status: ${o.status}<br>
              <button onclick="update(${o.id}, 'success')">Tandai Sukses</button>
              <button onclick="update(${o.id}, 'pending')">Tandai Pending</button>
              <hr>
            `;
            container.appendChild(div);
          });
        });
    }

    function update(id, status) {
      fetch(`backend/update_status.php?id=${id}&status=${status}`)
        .then(() => loadOrders());
    }

    loadOrders();
  </script>
</body>
</html>
