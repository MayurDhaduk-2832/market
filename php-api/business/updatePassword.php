<?php

$host = "localhost";
$username = "id20929652_md";
$password = "sell@2Products";
$dbname = "id20929652_sell_products";

$conn = mysqli_connect($host, $username, $password, $dbname);

if (!$conn) {
    die("Connection Failed " . mysqli_connect_error());
}

error_reporting(0);

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Method: POST');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Request-With');

$requestMethod = $_SERVER["REQUEST_METHOD"];

if ($requestMethod == "POST") {
    $inputData = json_decode(file_get_contents("php://input"), true);
    if (empty($inputData)) {
        $updateCustomer = updateCustomer($_POST, $_GET);
    } else {
        $updateCustomer = updateCustomer($inputData, $_GET);
    }
    echo $updateCustomer;
} else {
    $data = [
        'status' => 405,
        'message' => $requestMethod . ' Method not Allowed'
    ];
    header("HTTP/1.0 405 Method not Allowed");
    echo json_encode($data);
}

// update data

function updateCustomer($customerInput, $customerParams)
{
    global $conn;

    if (!isset($customerParams['id'])) {
        return error422('customer id not found in URL');
    } elseif ($customerParams['id'] == null) {
        return error422('Enter the customer id');
    }

    $customerId = mysqli_real_escape_string($conn, $customerParams['id']);
    $password =  mysqli_real_escape_string($conn, $customerInput['password']);

    if (empty(trim($password))) {
        return error422('Enter your password');
    } else {
        $query = "UPDATE customer_login SET password='$password' WHERE id='$customerId' LIMIT 1";

        $result = mysqli_query($conn, $query);

        if ($result) {
            $data = [
                'isSuccess' => true,
                'message' => 'login data Password Successfully Update'
            ];
            header("HTTP/1.0 200 OK");
            echo json_encode($data);
        } else {
            $data = [
                'isSuccess' => false,
                'message' => ' Internal Server Error'
            ];
            header("HTTP/1.0 500 Internal Server Error");
            echo json_encode($data);
        }
    }
}

function error422($message)
{
    $data = [
        'status' => 422,
        'message' => $message,
    ];
    header("HTTP/1.0 422 Unprocessable Entity");
    echo json_encode($data);
    exit();
}
?>
