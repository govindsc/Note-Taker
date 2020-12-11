package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Notes;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	      try{
	    	  String title=request.getParameter("title");
	    	  String content=request.getParameter("content");
	    	  int notesId =Integer.parseInt(request.getParameter("notesId").trim());
	    	  
	    	  
	    	  Session s=FactoryProvider.getFactory().openSession();
	    	  Transaction tx=s.beginTransaction();
	    	  Notes notes = s.get(Notes.class, notesId);
	    	  
	    	  notes.setTitle(title);
	    	  notes.setContent(content);
	    	  notes.setAddedDate(new Date());
	    	  
	    	  tx.commit();
	    	  s.close();
	    	  response.sendRedirect("all_notes.jsp");
	      }catch (Exception e) {
			// TODO: handle exception
	    	  e.printStackTrace();
		}
	}

}
