<?php

require_once('db.php');

$language =$_POST['language'];
$word =$_POST['word'];
$meaning=$_POST['meaning'];
if ($word == "" || $meaning  == "") { echo "Empty";exit(); }

$sql = "  SELECT * FROM `".$language."` WHERE word = '".$word."';";
$result = mysqli_query($conn,$sql);
$data = array(); 
$num = mysqli_num_rows($result);
		if ( $num > 0 ) {
				while ($row = mysqli_fetch_assoc($result)) {
				 	array_push($data,$row['meaning']); 
				 }
		}
		

		if (in_array($meaning, $data)) { echo "Existed";exit(); }
		else{
		$sql = "INSERT INTO `$language` (word, meaning) VALUES('$word','$meaning');";

			if (mysqli_query($conn,$sql) == true) { echo "Success";exit();}
			else{ echo "Failed" ;exit(); }

		}
mysqli_commit($conn);

mysqli_close($conn);
?>