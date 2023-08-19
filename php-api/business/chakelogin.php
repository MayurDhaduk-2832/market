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

header('Access-Control-Allow-origin:*');
header('Control-Type: application/json');
header('Access-Control-Allow-Method: POST');
header('Access-Control-Allow-Headers: Content-Type,Access-Control-Allow-Headers, Authorization,X-Request-With');

$requestMethod = $_SERVER["REQUEST_METHOD"];

if ($requestMethod == "POST") {
    $inputData = json_decode(file_get_contents("php://input"), true);
    if (empty($inputData)) {
        $checkCustomer = checkCustomer($_POST);
    } else {
        $checkCustomer = checkCustomer($inputData);
    }
    header("Content-type: application/json; charset=utf-8");
    echo $checkCustomer;
} else {
    $data = [
        'status' => 405,
        'message' => $requestMethod . ' Method not Allowed'
    ];
    header("Content-type: application/json; charset=utf-8");
    header("HTTP/1.0 405 Method not Allowed");
    echo json_encode($data);
}

function checkCustomer($customerInput)
{
    global $conn;

    $email = mysqli_real_escape_string($conn, $customerInput['email']);
    $password = mysqli_real_escape_string($conn, $customerInput['password']);

    $query = "SELECT * FROM customer_login WHERE email = '$email' AND password = '$password'";
    $result = mysqli_query($conn, $query);

    if ($result) {
        // LOGIN code
        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
            $data = [
                'isSuccess' => true,
                'message' => 'Login is successful',
                'id' => $row['id'],
                'username' => $row['username'],
                'mobileNumber' => $row['mobileNumber'],
                'email' => $row['email'],
                'role' => $row['role']
            ];
            header("HTTP/1.0 200 Created");
            return json_encode($data);
        } else {
            $data = [
                'isSuccess' => false,
                'message' => 'Incorrect password'
            ];
            header("HTTP/1.0 404 Created");
            return json_encode($data);
        }
    } else {
        $data = [
            'isSuccess' => false,
            'message' => 'Login is not successful'
        ];
        header("HTTP/1.0 500 Created");
        return json_encode($data);
    }
}
?>
