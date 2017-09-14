<?php
define('DB_HOST','localhost');
define('DB_USER','root');
define('DB_PASS','maher123');
define('DB_NAME', "dictionaries");

$conn = mysqli_connect(DB_HOST,DB_USER,DB_PASS,DB_NAME);
	
	if (!$conn) { 
		header("location: dictionary.php?conn=Error");
        exit();
	}
























?>