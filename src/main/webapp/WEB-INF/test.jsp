<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Dropdown Menu Button</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <h1>Dropdown Menu Button</h1>
        <div class="dropdown">
            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                Dropdown button
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <li><a class="dropdown-item" href="#">Action 1</a></li>
                <li><a class="dropdown-item" href="#">Action 2</a></li>
                <li><a class="dropdown-item" href="#">Action 3</a></li>
            </ul>
        </div>
    </div>

    <!-- jQuery -->
    <script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="/webjars/bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
