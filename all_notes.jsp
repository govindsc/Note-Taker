<%@page import="com.entities.Notes"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Notes:-Note Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="NavBar.jsp"%>
		<br>
		<h1>All Notes:-</h1>
		<div class="row">
			<div class="col-12">

				<%
					Session s = FactoryProvider.getFactory().openSession();
					Query q = s.createQuery("from Notes");
					List<Notes> list = q.list();
					for (Notes notes : list) {
				%>
				<div class="card mt-4 px-5">
					<img class="card-img-top m-4" style="max-width:100px;" src="img/notepad.png" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=notes.getTitle() %></h5>
						<p class="card-text"><%=notes.getContent() %></p>
						<p><b><%= notes.getAddedDate() %></b></p>
						<div class="container text-center">
						    <a href="DeleteServlet?notes_id=<%=notes.getId() %>" class="btn btn-danger ">Delete</a>
						    <a href="edit1.jsp?notes_id=<%=notes.getId() %>" class="btn btn-primary ">Update</a>   
						</div>
						
					</div>
				</div>

				<%
					//out.println(notes.getId() + " : " + notes.getTitle() + "</br>");
					}

					s.close();
				%>


			</div>
		</div>
	</div>

</body>
</html>