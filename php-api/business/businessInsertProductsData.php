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
    // Get the JSON data from the request body and decode it into an associative array
    $requestData = json_decode(file_get_contents('php://input'), true);

    // Extract data from the decoded JSON
    $seller_brand_name = $requestData['seller_brand_name'];
    $product_name = $requestData['product_name'];
    $original_price = $requestData['original_price'];
    $sale_price = $requestData['sale_price'];
    $product_description = $requestData['product_description'];
    $contact_no = $requestData['contact_no'];
    $address = $requestData['address'];
    $longi = $requestData['longi']; // Changed variable name to avoid using the reserved keyword "long"
    $lat = $requestData['lat'];

    // Perform necessary operations with the provided data
    // For example, you can insert the data into a database
    $query = "INSERT INTO business_products_data (seller_brand_name, product_name, original_price, sale_price, product_description, contact_no, address, longi, lat) VALUES ('$seller_brand_name', '$product_name', '$original_price', '$sale_price', '$product_description', '$contact_no', '$address', '$longi', '$lat')";

    $result = mysqli_query($conn, $query);

    if ($result) {
        $response = [
            'isSuccess' => true,
            'message' => 'Product data inserted successfully'
        ];
    } else {
        $response = [
            'isSuccess' => false,
            'message' => 'Failed to insert product data: ' . mysqli_error($conn)
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
