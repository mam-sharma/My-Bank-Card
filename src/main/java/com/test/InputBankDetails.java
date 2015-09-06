package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.test.CardDetails;
/**
 * Servlet implementation class InputBankDetails
 */
public class InputBankDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InputBankDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
        Date date = new Date();
        out.println("<html><h2>Card Details are:!</h2></html>");
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<CardDetails> cardDetailsList = new ArrayList<CardDetails>();
		try {
			CardDetails cardDetails = new CardDetails(request.getParameter("bankname"), request.getParameter("cardnumber"),
					request.getParameter("expirydate"));
			if (session.getAttribute("list") != null) {
				cardDetailsList = (List<CardDetails>) session.getAttribute("list");
				cardDetailsList.add(cardDetails);
				Collections.sort(cardDetailsList);
				session.setAttribute("list", cardDetailsList);
			} else {
				cardDetailsList.add(cardDetails);
				session.setAttribute("list", cardDetailsList);
			}

		} catch (ParseException ex) {
			//NOP
		}
		
        response.sendRedirect("/My-Bank-Card/input.jsp");
        //out.println("<html><h2>Card Details are:!</h2><br/><h3>Bank Name="+request.getParameter("bankname") +"</h3><br/><h3>Card number="+request.getParameter("cardnumber") +"</h3><br/><h3>Expiry date="+request.getParameter("expirydate") +"</h3></html>");
	}

}
