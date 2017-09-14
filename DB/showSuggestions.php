<?php

require_once('db.php');

$language = $_POST['language'];
$word =$_POST['word'];

$sql = "  SELECT * FROM `".$language."` ORDER BY word ;";
$result = mysqli_query($conn,$sql);
$num =  mysqli_num_rows($result);

$data = array(); 
$words =array();

	if ( $num > 0 ) {
		while ($row = mysqli_fetch_assoc($result)) {
			 array_push($data,$row['word']); 
			}

		$data = array_unique($data);
	
		foreach ($data as $suggestion){
			if (stristr($suggestion, $word))  {
				array_push($words,$suggestion);
			}
		}
			if(sizeof($words)>0) {echo implode("#$%",$words); }
			else{ echo ""; }

	}else{ echo "";  }

mysqli_close($conn);
?>