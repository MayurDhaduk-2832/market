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
header('Access-Control-Allow-Method: POST');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Request-With');

$requestMethod = $_SERVER["REQUEST_METHOD"];

if ($requestMethod === "POST") {
    // Get latitude and longitude from the request body
    $data = json_decode(file_get_contents("php://input"), true);
    $userLatitude = $data['latitude'];
    $userLongitude = $data['longitude'];

    // Perform necessary operations to retrieve data within 5 km
    $query = "SELECT *,
        (6371 * acos(cos(radians($userLatitude)) * cos(radians(latitude)) * cos(radians(longitude) - radians($userLongitude)) + sin(radians($userLatitude)) * sin(radians(latitude)))) AS distance 
        FROM business_products_data 
        HAVING distance <= 10";
    
    $result = mysqli_query($conn, $query);

    if ($result) {
        $data = array();

        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }

        if (!empty($data)) {
            $response = [
                'isSuccess' => true,
                'data' => $data
            ];
        } else {
            $response = [
                'isSuccess' => true,
                'message' => 'No data found within 5 km'
            ];
        }
    } else {
        $response = [
            'isSuccess' => false,
            'message' => 'Failed to retrieve data: ' . mysqli_error($conn)
        ];
        http_response_code(500); // Set the response code to indicate an internal server error
    }

    echo json_encode($response);
} else {
    $response = [
        'status' => 405,
        'message' => $requestMethod . ' Method not Allowed'
    ];
    http_response_code(405); // Set the response code to indicate the method not allowed
    echo json_encode($response);
}
?>
