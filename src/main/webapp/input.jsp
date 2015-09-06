<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List, com.test.CardDetails"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert card details</title>
</head>
<body>
	<h1>Insert card details</h1>

	<form action="/My-Bank-Card/InputBankDetails" onsubmit="return validate()" method="post" name="cardDetail">
		<div>
			<label for="bankname">Bank Name</label>
			<input type="text" required id="bankname" name="bankname"/>
			<label for="cardnumber">Card Number</label>
			<input type="text" id="cardnumber" required name="cardnumber" placeholder="xxxx-xxxx-xxxx-xxxx" /> 
			<label for="date">Card Expiry Date</label>
			<input type="text" id="date" required	name="expirydate" placeholder="eg. Jan-2020" />
		</div>
		<div style="margin-left: 14%; margin-top: 10px; margin-bottom: 25px;">
			<input type="submit" value="Submit" />
		</div>
	</form>

	<%
		List<CardDetails> cardDetailsList = (List<CardDetails>) request.getSession().getAttribute("list");
		if (cardDetailsList != null && cardDetailsList.size() > 0) {
	%>
	<table border="1" style="width: 50%">
		<tr>
			<th>Bank Name</th>
			<th>Card Number</th>
			<th>Expiry Date</th>
		</tr>

		<%
			for (CardDetails cd : cardDetailsList) {
		%>     <tr style="text-align: center">
			<%
				out.print("<td>" + cd.getBankName() + "</td>");
						out.print("<td>" + cd.getEncryptedCradNumber() + "</td>");
						out.print("<td>" + cd.getExpiryDateStr() + "</td></tr>");
					}
			%>
		
	</table>
	<%
		}
	%>
</body>
<script type="text/javascript">
function validate(){
        var cn = document.cardDetail.cardnumber.value;
        var ed = document.cardDetail.expirydate.value.trim();
        if (!valid_credit_card(cn)) {
            alert("card number not valid");
            return false;
        }
        if(!isDate(ed)){
        	alert("Date not valid");
            return false;
        }
        
}

function valid_credit_card(value) {
	  // accept only digits, dashes or spaces
		if (/[^0-9-\s]+/.test(value)) return false;

		// replace no digits
		value = value.replace(/\D/g, "");
		
		
		return value.length == 16;
	}
	
function isDate(currVal) {
    if (currVal == '') return false;

    //Declare Regex  
    var rxDatePattern = /^([a-zA-Z]{3})(-)(\d{4})$/;

    var dtArray = currVal.match(rxDatePattern); // is format OK?

    if (dtArray == null) return false;


    var dtMonth = dtArray[1];
    var dtYear = parseInt(dtArray[3]);

    // need to change to lowerCase because switch is
    // case sensitive
    switch (dtMonth.toLowerCase()) {
        case 'jan':
            dtMonth = '01';
            break;
        case 'feb':
            dtMonth = '02';
            break;
        case 'mar':
            dtMonth = '03';
            break;
        case 'apr':
            dtMonth = '04';
            break;
        case 'may':
            dtMonth = '05';
            break;
        case 'jun':
            dtMonth = '06';
            break;
        case 'jul':
            dtMonth = '07';
            break;
        case 'aug':
            dtMonth = '08';
            break;
        case 'sep':
            dtMonth = '09';
            break;
        case 'oct':
            dtMonth = '10';
            break;
        case 'nov':
            dtMonth = '11';
            break;
        case 'dec':
            dtMonth = '12';
            break;
    }

    // convert date to number
    dtMonth = parseInt(dtMonth);

    if (isNaN(dtMonth)) return false;
    else if (dtMonth < 1 || dtMonth > 12) return false;

    return true;
}
	
</script>
</html>
