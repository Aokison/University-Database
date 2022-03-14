<?php
$servername = "???"; //server credentials no longer valid
$username = "???"; 
$password = "???"; 
$dbname = "cs332t2";

//connect
$conn = mysqli_connect($servername, $username, $password, $dbname);

//check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error); 
}

echo "Course: ", $_POST["courseNum"], "<br>"; 
echo "Section: ", $_POST["sectionNum"], "<br>";

//sql
$sql = "SELECT grade, COUNT(*) AS count FROM enrollment WHERE cno=" .$_POST["courseNum"] ." AND sno=" .$_POST["sectionNum"] ." GROUP BY grade"; 
$result = $conn->query($sql);
$nor = $result->num_rows;

echo '<table border="0" cellspacing="2" cellpadding="2"> 
	<tr>
		<td>Grade</td>
		<td>Count</td> 
	</tr>';

for($i=0; $i<$nor; $i++)
{
$row = $result->fetch_assoc(); 
$field1 = $row["grade"]; 
$field2 = $row["count"];
echo '<tr>
	<td>'.$field1.'</td>
	<td>'.$field2.'</td> 
     </tr>';
} 
$result->free_result(); 
$conn->close();
?>

<?php
//close connection 
mysqli_close($conn);
exit; 
?>