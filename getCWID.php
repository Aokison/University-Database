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

echo "Student: ", $_POST["cwid"], "<br>";

//sql
$query = "SELECT cno, sno, grade FROM enrollment WHERE scwid=" .$_POST["cwid"]; //insert sql query
$result = $conn->query($query);
$nor = $result->num_rows;

echo '<table border="0" cellspacing="2" cellpadding="2"> 
	<tr>
		<td>Course</td> 
		<td>Section</td> 
		<td>Grade</td>
	</tr>';

for($i=0; $i<$nor; $i++)
{
$row = $result->fetch_assoc(); 
$field1 = $row["cno"];
$field2 = $row["sno"];
$field3 = $row["grade"];
echo '<tr>
	<td>'.$field1.'</td> 
	<td>'.$field2.'</td> 
	<td>'.$field3.'</td>
    </tr>'; 
}
$result->free_result(); $conn->close();
?>

<?php
//close connection 
mysqli_close($conn);

exit; 
?>