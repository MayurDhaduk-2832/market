
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
header('Access-Control-Allow-Method: GET');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Request-With');

$requestMethod = $_SERVER["REQUEST_METHOD"];

if ($requestMethod === "GET") {
    // Perform necessary operations to retrieve data
    $query = "SELECT * FROM business_data";
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
                'message' => 'No data found'
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
