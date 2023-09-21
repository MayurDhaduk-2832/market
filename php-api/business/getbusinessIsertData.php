<?php

$host = "localhost";
$username = "id20929652_md";
$password = "sell@2Products";
$dbname = "id20929652_sell_products";

$conn = mysqli_connect($host, $username, $password, $dbname);

if (!$conn) {
    die("Connection Failed " . mysqli_connect_error());
}

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Method: GET, POST'); // Allow both GET and POST requests
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Request-With');

$requestMethod = $_SERVER["REQUEST_METHOD"];

if ($requestMethod === "GET") {
    // Check if a user ID parameter is provided in the URL
    if (isset($_GET['user_id'])) {
        $user_id = $_GET['user_id'];

        // Query the database to retrieve business data for the specified user ID
        $query = "SELECT * FROM business_data WHERE user_id = '$user_id'";
        $result = mysqli_query($conn, $query);

        if ($result) {
            // Fetch the data and return it as JSON
            $businessData = mysqli_fetch_assoc($result);
            echo json_encode($businessData);
        } else {
            $response = [
                'isSuccess' => false,
                'message' => 'Failed to fetch BusinessData: ' . mysqli_error($conn)
            ];
            http_response_code(500); // Set the response code to indicate an internal server error
            echo json_encode($response);
        }
    } else {
        $response = [
            'isSuccess' => false,
            'message' => 'Missing user_id parameter'
        ];
        http_response_code(400); // Set the response code to indicate a bad request
        echo json_encode($response);
    }
} elseif ($requestMethod === "POST") {
    // Handle POST requests (as in your existing code)
    // ...
} else {
    $response = [
        'status' => 405,
        'message' => $requestMethod . ' Method not Allowed'
    ];
    http_response_code(405); // Set the response code to indicate the method not allowed
    echo json_encode($response);
}
?>
