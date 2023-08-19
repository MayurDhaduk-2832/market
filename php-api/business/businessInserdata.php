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
    $user_id = $_POST['user_id'];
    $bussiness_name = $_POST['bussiness_name'];
    $contact_number = $_POST['contact_number'];
    $categorys = implode(',', $_POST['categorys']);
    $address = $_POST['address'];
    $location_longlat = $_POST['location_longlat'];

    // Image Upload
    $targetDir = "uploads/";
    $targetFile = $targetDir . basename($_FILES["image"]["name"]);
    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

    if (move_uploaded_file($_FILES["image"]["tmp_name"], $targetFile)) {
        $images = $targetFile;

        // Perform necessary operations with the provided data
        // For example, you can insert the data into a database
        $query = "INSERT INTO business_data (user_id, bussiness_name, contact_number, categorys, address, location_longlat, images) VALUES ('$user_id', '$bussiness_name', '$contact_number', '$categorys', '$address', '$location_longlat', '$images')";

            $query = "INSERT INTO business_data (user_id, bussiness_name, contact_number,categorys,country,state,city, address,pincode,long ,lat, images) VALUES (
                '$user_id', '$bussiness_name', '$contact_number', '$categorys','$country','$state','$city','$address', '$pincode','$long', '$lat', '$images')";

        $result = mysqli_query($conn, $query);

        if ($result) {
            $data = [
                'isSuccess' => true,
                'message' => 'BusinessData inserted successfully'
            ];
        } else {
            $data = [
                'isSuccess' => false,
                'message' => 'Failed to insert BusinessData: ' . mysqli_error($conn)
            ];
            header("Content-type: application/json; charset=utf-8");
            header("HTTP/1.0 500 Method not Allowed");
        }
    } else {
        $data = [
            'isSuccess' => false,
            'message' => 'Failed to upload image: ' . $_FILES["image"]["error"]
        ];
        header("Content-type: application/json; charset=utf-8");
        header("HTTP/1.0 500 Method not Allowed");
    }

    header("Content-type: application/json; charset=utf-8");
    echo json_encode($data);
} else {
    $data = [
        'status' => 405,
        'message' => $requestMethod . ' Method not Allowed'
    ];
    header("Content-type: application/json; charset=utf-8");
    header("HTTP/1.0 405 Method not Allowed");
    echo json_encode($data);
}
?>
