<?php

require_once('db.php');


$language = $_POST['language'];


$sql = " SELECT word ,meaning  FROM `".$language."` ORDER BY word , meaning ;"  ;
$result = mysqli_query($conn , $sql ); 

$newWord =''; 
$words = array();
while ($row = mysqli_fetch_assoc($result)) {
	if ($row['word'] !=$newWord ) {
		$newWord = $row['word'];
		$words[$newWord] = array();
	}
	array_push($words[$newWord],$row["meaning"]);		
}


$str='<tr><th>Word</th><th>Meaning</th>';
foreach ($words as $word => $meanings) {
	$str.= " <tr><td>". $word ."</td><td>";
	$m='';
	foreach ($meanings as $meaning ) {
		$m.= "<li>".$meaning."</li>";
	}
	$str.= $m."</td></tr>";
}
echo $str;
?>