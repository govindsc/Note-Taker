<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.helper.*,org.hibernate.*,com.entities.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container-light">
		<%@include file="NavBar.jsp"%>
         <h1>Edit Your Note</h1><br>
		<%
			int notesId = Integer.parseInt(request.getParameter("notes_id").trim());
			org.hibernate.Session s = FactoryProvider.getFactory().openSession();
			Notes notes = (Notes) s.get(Notes.class, notesId);
		%>
		<form action="UpdateServlet" method="post">
		 <input value="<%= notes.getId() %>" name="notesId" type="hidden" />
			<div class="form-group">
				<label for="title">Note title</label>
				 <input name="title"
					type="text"
					 required class="form-control" 
					 id="title"
					aria-describedby="emailHelp"
					value="<%= notes.getTitle() %>" />

			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="content"
				 required id="content"
					placeholder="Enter your content here" 
					class="form-control"
					style="height: 300px"><%=notes.getContent() %>
					</textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save</button>
			</div>
		</form>

	</div>


</body>
</html>