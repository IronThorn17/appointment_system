<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login</title>
  <link href="styles.css" rel="stylesheet" />
</head>

<body>
  <header>
    <div class="container">
      <div id="branding">
        <h1>Online Appointment System</h1>
      </div>
      <nav>
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="services.html">Services</a></li>
          <li class="current"><a href="login.php">Login</a></li>
          <li><a href="register.php">Register</a></li>
        </ul>
      </nav>
    </div>
  </header>

  <div class="container">
    <h1>Login</h1>

    <?php
    // Check if an error parameter is present in the URL
    if (isset($_GET["error"]) && $_GET["error"] == 1) {
      echo '<p class="error-message">Login failed. Please check your username and password and try again.</p>';
    }
    ?>

    <form action="login_process.php" method="post">
      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required />
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required />
      </div>
      <button type="submit">Login</button>
    </form>
  </div>
</body>

</html>