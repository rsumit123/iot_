<%@ page language="java" 
    contentType="text/html; 
    charset=windows-1256"
     pageEncoding="windows-1256" 
     import="com.mongodb.BasicDBObject"
     import="com.mongodb.DB"
     import="com.mongodb.DBCollection"
     import="com.mongodb.DBCursor"
     import="com.mongodb.MongoClient"
     import="java.net.UnknownHostException"
	 import="com.sun.org.apache.bcel.internal.generic.NEW"
	 import="com.mongodb.DBObject"
	 import="com.mongodb.Mongo"
      %> 

   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#81BEF7">

<form action="login.jsp">


Username:<input type="text" placeholder="Enter Username" name="username" required>

Password:<input type="password" placeholder="Enter Password" name="password" required>

<button type="submit">Login</button>
   
</form>
<div id="invalid"></div>

<%



String user = request.getParameter("username");
String pass = request.getParameter("password"); 

Mongo mg = new Mongo("Localhost",27017);
DB db = mg.getDB("test");
DBCollection collection = db.getCollection("testing");
BasicDBObject doc = new BasicDBObject();
DBCursor cursor = collection.find();

doc = new BasicDBObject();

    while(cursor.hasNext()) 
    {
 	   DBObject str= cursor.next();
 	   
 	   if(str.get("user").equals(user) && str.get("password").equals(pass))
 			   {
 		  
 		 session.setAttribute("history"," ");
 		 session.setAttribute("userid", user);
 		 	 
 		   response.sendRedirect("committee.jsp");
 			   }
 	   else
 	   {
 		    %>
 		  <script type="text/javascript">
 		  document.getElementById("invalid").innerHTML="Invalid user";
 		  </script><% 
 	   }

    }


 
    cursor.close();
 
 

mg.close();


%>
</form>
</body>
</html>