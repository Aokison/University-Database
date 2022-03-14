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

 echo "Course: ", $_POST["studentCourse"], "<br>";

//sql
$sql = "SELECT snum, classroom, meeting_days, begin_time, end_time, (SELECT COUNT(*) FROM enrollment WHERE sno = snum) AS count FROM section WHERE scnum =" .$_POST["studentCourse"]; //insert sql query
$result = $conn->query($sql);
$nor = $result->num_rows;

echo '<table border="0" cellspacing="2" cellpadding="2"> 
	<tr>
		<td>Section</td> 
		<td>Classroom</td> 
		<td>Meeting Days</td> 
		<td>Begin Time</td> 
		<td>End Time</td> 
		<td>Students Enrolled</td>
	</tr>';

for($i=0; $i<$nor; $i++)
{
$row = $result->fetch_assoc(); 
$field1 = $row["snum"];
$field2 = $row["classroom"]; 
$field3 = $row["meeting_days"]; 
$field4 = $row["begin_time"]; 
$field5 = $row["end_time"]; 
$field6 = $row["count"];
echo '<tr>
	<td>'.$field1.'</td> 
	<td>'.$field2.'</td> 
	<td>'.$field3.'</td> 
	<td>'.$field4.'</td> 
	<td>'.$field5.'</td> 
	<td>'.$field6.'</td>
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