<?php

$host = "localhost";
$username = "id20929652_md";
$password = "sell@2Products";
$dbname = "id20929652_sell_products";

$conn = mysqli_connect($host, $username, $password, $dbname);

if (!$conn) {
    die("Connection Failed: " . mysqli_connect_error());
}

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Method: POST');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Request-With');

$requestMethod = $_SERVER["REQUEST_METHOD"];

if ($requestMethod === "POST") {
    // Check if category is provided
    if (isset($_POST['category'])) {
        $category = $_POST['category'];

        // Handle image upload
        if (isset($_FILES['category_image'])) {
            $uploadDir = "uploads/"; // Directory where you want to save uploaded images
            $fileName = basename($_FILES["category_image"]["name"]);
            $targetPath = $uploadDir . $fileName;

            if (move_uploaded_file($_FILES["category_image"]["tmp_name"], $targetPath)) {
                // Image uploaded successfully, you can now save the file path to the database
                $imagePath = $targetPath;

                // Insert the category name and image path into the "categories" table
                $query = "INSERT INTO categories (category, category_image) VALUES (?, ?)";
                $stmt = mysqli_prepare($conn, $query);

                if ($stmt) {
                    mysqli_stmt_bind_param($stmt, "ss", $category, $imagePath);

                    if (mysqli_stmt_execute($stmt)) {
                        $insertedId = mysqli_insert_id($conn); // Get the ID of the inserted record
                        $response = [
                            'isSuccess' => true,
                            'message' => 'Category and image uploaded and inserted into the database successfully',
                            'insertedId' => $insertedId // Include the ID in the response
                        ];
                    } else {
                        $response = [
                            'isSuccess' => false,
                            'message' => 'Failed to insert category and image into the database: ' . mysqli_error($conn)
                        ];
                    }

                    mysqli_stmt_close($stmt);
                } else {
                    $response = [
                        'isSuccess' => false,
                        'message' => 'Failed to prepare statement: ' . mysqli_error($conn)
                    ];
                }
            } else {
                $response = [
                    'isSuccess' => false,
                    'message' => 'Failed to upload the image'
                ];
            }
        } else {
            $response = [
                'isSuccess' => false,
                'message' => 'No image was uploaded'
            ];
        }
    } else {
        $response = [
            'isSuccess' => false,
            'message' => 'Category not provided'
        ];
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
