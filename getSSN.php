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

echo "Professor: ", $_POST["SSN"], "<br>";

//sql
$sql = "SELECT c.title, s.classroom, s.meeting_days, s.begin_time, s.end_time FROM professor p, section s, course c WHERE s.pssn = p.ssn AND s.scnum = c.cnum AND p.ssn =" .$_POST["SSN"];
$result = $conn->query($sql);
$nor = $result->num_rows;

echo '<table border="0" cellspacing="2" cellpadding="2"> 
	<tr>
		<td>Title</td> 
		<td>Classroom</td> 
		<td>Meeting Days</td> 
		<td>Begin Time</td> 
		<td>End Time</td>
	</tr>';

for($i=0; $i<$nor; $i++)
{
$row = $result->fetch_assoc(); 
$field1 = $row["title"];
$field2 = $row["classroom"]; 
$field3 = $row["meeting_days"]; 
$field4 = $row["begin_time"]; 
$field5 = $row["end_time"]; 
echo '<tr>
	<td>'.$field1.'</td> 
	<td>'.$field2.'</td> 
	<td>'.$field3.'</td> 
	<td>'.$field4.'</td> 
	<td>'.$field5.'</td>

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