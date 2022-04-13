<%@page import="com.Item" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 
	if (request.getParameter("itemCode") != null) 
	{ 
		 Item itemObj = new Item(); 
		 itemObj.connect();//For testing the connect method

		
		 String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
				 request.getParameter("itemName"), 
				 request.getParameter("itemPrice"), 
				 request.getParameter("itemDesc"));
		 
				 session.setAttribute("statusMsg", stsMsg); 
	 
	} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>

<body>
<form method="post" action="items.jsp">
	Item Code:<input name="itemCode" type="text"><br/>
	Item Name:<input name="itemName" type="text"><br/>
	Item Price:<input name="itemPrice" type="text"><br/>
	Item Description:<input name="itemDesc" type="text"><br/>
	<input name="btnSubmit" type="submit" value="Save"><br/>
</form>
<% 
	out.print(session.getAttribute("statusMsg")); 
%>

<br>
 <!--  <table border="1">
	<tr>
		<th>Item Code</th><th>Item Name</th><th>Item Price</th><th>Item Description</th><th>Update</th><th>Remove</th>
	</tr>
	<tr>
		<td><%out.print(session.getAttribute("itemCode")); %></td>
		<td><%out.print(session.getAttribute("itemName")); %></td>
		<td><%out.print(session.getAttribute("itemPrice")); %></td>
		<td><%out.print(session.getAttribute("itemDesc")); %></td>
		<td><input name="btnUpdate" type="button" value="Update"></td>
		<td><input name="btnRemove" type="button" value="Remove"></td>
	</tr>

</table> -->
</body>
</html>