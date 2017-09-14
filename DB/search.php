<?php

require_once('db.php');

$language = $_POST['language'];
$word =  $_POST['word'];

$sql = "  SELECT * FROM `".$language."` WHERE word = '".$word."';";
$result = mysqli_query($conn,$sql);
$data = array(); 
$num = mysqli_num_rows($result);
if ( $num > 0 ) {
		while ($row = mysqli_fetch_assoc($result)) {
		 array_push($data,$row['meaning']); 
		}
		echo implode("#$%",$data);


}else{ echo "";}

mysqli_close($conn);



?>