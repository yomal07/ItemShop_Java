<%@page import="com.PAF.Item" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 
	
	//Insert item
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

	//Delete item----------------------------------
	if (request.getParameter("itemID") != null) 
	{ 
		Item itemObj = new Item(); 
		String stsMsg = itemObj.deleteItem(request.getParameter("itemID")); 
		session.setAttribute("statusMsg", stsMsg); 
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
<link rel="stylesheet" href="Views/bootstrap.css">
</head>

<div class="container">
	<div class=row>
		<div class=col>
		<body>
		
		<h2>Item Management</h2>
		<form method="post" action="items.jsp">
			Item Code:<input name="itemCode" type="text"  class="form-control"><br/>
			Item Name:<input name="itemName" type="text"  class="form-control"><br/>
			Item Price:<input name="itemPrice" type="text"  class="form-control"><br/>
			Item Description:<input name="itemDesc" type="text"  class="form-control"><br/>
			<input name="btnSubmit" type="submit" value="Save" class="btn btn-primary"><br/>
		</form>
		<br/>
		<div class="alert alert-success">
			<% 
				out.print(session.getAttribute("statusMsg")); 
			%>
		</div>
		
		<br>
		<%
		 Item itemObj = new Item(); 
		 out.print(itemObj.readItems()); 
		%>
		</body>
		</div>
	</div>
</div>
</html>