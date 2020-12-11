<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>

  <div class="container-light" >
      <%@include file="NavBar.jsp" %>
  </div>
  <br>
  <h1>Please Fill Your Note Details</h1>
  <br>
<!-- this is form -->
<form action="SaveNoteServlet" method="post">
  <div class="form-group" >
    <label for="title">Note title</label>
    <input
      name="title" 
      type="text"
      required class="form-control"
      id="title" 
      aria-describedby="emailHelp" />
   
  </div>
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea
     name="content" 
     required
     id="content"
     placeholder="Enter your content here"
     class="form-control"
     style="height:300px"
    ></textarea>
  </div>
   <div class="container text-center">
      <button type="submit" class="btn btn-primary">Add</button>
   </div>
</form>
  

</body>
</html>