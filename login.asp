<% Option Explicit 
'<?php require_once('db_connection.php');
'ob_start();
'session_start();

'******************
'ASP Database Connection
 Dim oConn
 Dim ConnectionStr
 Dim RecordSet
 Dim strSQL
 Dim strUsername
 Dim strPassword
 Dim db_name, db_username, db_password, db_server
 
 'Connecting to the database
 	db_name = "res_scavenger"
 	db_server = "localhost"
        db_username = "magrets"
        db_password = "safiuna86"
  
  ConnectionStr = "DRIVER=mysql;SERVER"= & db_server & "; UID=" & db_username & "; PWD=" & db_password & "; DATABASE=" & db_name
 	Set oConn = Server.CreateObject ("ADODB.Connection")
  	oConn.Open ConnectionStr
  	
	 strUsername = Request.form("txtName")
	 strPassword = Request.Form("txtPassword")

 
 strSQL = "SELECT * FROM admin WHERE username = " & strUsername & " AND  password = " & strPassword
 ' Set RecordSet= Server.CreateObject("ADODB.Recordset")
  '	RecordSet.Open (strSQL,oConn)
  	
    Set RecordSet = Conn.execute(strSQL)
        'If the recordset is not empty the user is validated
        If Not RecordSet.EOF Then
            Session("blnAuthenticated") = True
            Response.Redirect("scavCreator.php")
        else
            Response.Redirect("main_login.php")
        End If
          RecordSet.Close
          Set RecordSet = Nothing
          
          oConn.Close
          Set oConn = Nothing
          

		'// username and password sent from form 
		'$myusername=$_POST['username'];     
		'$mypassword=md5($_POST['password']); 

			'// To protect MySQL injection (more detail about MySQL injection)
			'$myusername = stripslashes($myusername);
			'$mypassword = stripslashes($mypassword);
			'$myusername = mysql_real_escape_string($myusername);
			'$mypassword = mysql_real_escape_string($mypassword);

		'$sql="SELECT *  FROM admin where username = '$myusername' AND password = '$mypassword'";
		'$result=mysql_query($sql);

'// Mysql_num_row is counting table row
'$count=mysql_num_rows($result);

'// If result matched $myusername and $mypassword, table row must be 1 row
'if($count==1){

'// Register $myusername, $mypassword and redirect to file "scavCreator.html"
'//session_register("myusername");
'//session_register("mypassword"); 
    '$_SESSION['username'] = $_POST['username'];
    'header("location:scavCreator.php");
'}
'else {
'echo "Wrong Username or Password";
      'header("location: main_login.php"); 
'}
'?>
%>
