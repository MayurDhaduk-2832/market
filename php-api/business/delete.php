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
header('Access-Control-Allow-Method: DELETE');
header('Access-Control-Allow-Headers: Content-Type,Access-Control-Allow-Headers, Authorization,X-Request-With');


if($requestMethod == "DELETE")
{
		
		$deleteCustomer = deleteCustomer($_GET);

		echo $deleteCustomer;
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



function deCustomer($customerParams)
{
	global $conn;

	if(!isset($customerParams['id']))
	{
		return error422('customer id not found in URL');
	}
	elseif($customerParams['id']==null)
	{
		return error422('Enter the customer id');
	}

	$customerId = mysqli_real_escape_string($conn,$customerParams['id']);

	

	
		$query = "DELETE FROM  customer_login WHERE id='$customerId' LIMIT 1";

		$result = mysqli_query($conn,$query);

		if($result)
		{
				$data =[
				'isSuccess'=> true,
				'message'=> 'login data Successfully Delete'
				];
				header("HTTP/1.0 200 Created");
				return json_encode($data);
		}
		else
		{
				$data =[
				'isSuccess'=> false,
				'message'=> ' Internal Server Error'
				];
				header("HTTP/1.0 500 Internal Server Error");
				return json_encode($data);
		}


}

function error422($message)
{
		$data =[
		'status'=> 422,
		'message'=> $message,
	];
	header("HTTP/1.0 422 Unprocessable Entity");
	echo json_encode($data);
		exit();
}


 ?>