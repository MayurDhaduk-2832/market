<?php
$host = "localhost";
$username = "id20929652_md";
$password = "sell@2Products";
$dbname = "id20929652_sell_products";

$conn = mysqli_connect($host, $username, $password, $dbname);

if (!$conn) {
    die("Connection Failed: " . mysqli_connect_error());
}

// SQL query to fetch data from the "business_data_image_logo" table
$sql = "SELECT userId, imagelogo FROM business_data_image_logo";

$result = mysqli_query($conn, $sql);

if (!$result) {
    die("Query Failed: " . mysqli_error($conn));
}

if (mysqli_num_rows($result) > 0) {
    // Initialize an array to store the results
    $results = array();

    // Fetch and format the data
    while ($row = mysqli_fetch_assoc($result)) {
        $data = array(
            'userId' => $row['userId'],
            'imagelogo' => $row['imagelogo']
        );

        // Add the data to the results array
        $results[] = $data;
    }

    // Convert the results array to JSON and send it as the response
    header('Content-Type: application/json');
    echo json_encode($results);
} else {
    // No data found in the table
    echo "No data found";
}

// Close the database connection
mysqli_close($conn);
?>
