<?php 

$host = "localhost";
$username = "id20929652_md";
$password = "sell@2Products";
$dbname = "id20929652_sell_products";



$conn=mysqli_connect($host,$username,$password,$dbname);

if(!$conn)
{
    die("Connection Failed ".mysqli_connect_error());
}

 error_reporting(0);

header('Access-Control-Allow-origin:*');
header('Control-Type: application/json');
header('Access-Control-Allow-Method: GET');
header('Access-Control-Allow-Headers: Content-Type,Access-Control-Allow-Headers, Authorization,X-Request-With');

// include('function.php');

$requestMethod = $_SERVER["REQUEST_METHOD"];

if($requestMethod == "GET")
{
        
    $categoriceList = getCategoriceList();
    header("Content-type: application/json; charset=utf-8");
    echo $categoriceList;
}
else
{
    $data =[
        'status'=> 405,
        'message'=> $requestMethod. ' Method not Allowed'
    ];
    header("HTTP/1.0 405 Method not Allowed");
    echo json_encode($data);
}


// get data
function getCategoriceList()
{

    global $conn;
    
    $query = "SELECT * FROM categories";
    $query_run = mysqli_query($conn,$query);

    if($query_run)
    {
            if(mysqli_num_rows($query_run) > 0)
            {
                    $res = mysqli_fetch_all($query_run,MYSQLI_ASSOC);

                $data =[
                'status'=> 200,
                'message'=> 'Customer List Fetched Successfully',
                'data'=> $res
                ];

            header("HTTP/1.0 200 Customer List Fetched Successfully");
            return json_encode($data);
            }
            else
            {
                $data =[
                'status'=> 404,
                'message'=> 'No Customer Found',
                ];

            header("HTTP/1.0 404 No Customer Found");
            return json_encode($data);
            }
    }
    else
    {
        $data =[
        'status'=> 500,
        'message'=> 'Internal Server Error',
        ];

            header("HTTP/1.0 500 Internal Server Error");
            return json_encode($data);
    }
}


 ?>