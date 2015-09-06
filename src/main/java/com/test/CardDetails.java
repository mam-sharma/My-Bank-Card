package com.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class CardDetails implements Comparable<CardDetails>  {
	
	String bankName;
	String cardNumber;
	String expDate;
	Date expiryDate;

	public CardDetails(String aBankName, String aCardNumber, String aExpiryDate) throws ParseException {
		this.bankName = aBankName;
		this.cardNumber = aCardNumber;
		this.expDate = aExpiryDate;
		DateFormat format = new SimpleDateFormat("MMM-yyyy");
		this.expiryDate = format.parse(aExpiryDate);
		
	}

	/**
	 * @return the encryptedCradNumber
	 */
	public String getEncryptedCradNumber() {
		String encryptedCradNumber = this.cardNumber.substring(0, 4);
		encryptedCradNumber = encryptedCradNumber.concat("-xxxx-xxxx-xxxx");
		return encryptedCradNumber;
	}
	
	/**
	 * @return the bankName
	 */
	public String getBankName() {
		return bankName;
	}
	
	/**
	 * @return the cardNumber
	 */
	public String getCardNumber() {
		return cardNumber;
	}

	/**
	 * @return the expiryDate
	 */
	public Date getExpiryDate() {
		return expiryDate;
	}

	/**
	 * @return the expiryDate
	 */
	public String getExpiryDateStr() {
		return expDate;
	}
	
	public int compareTo(CardDetails cardDetails) {
		
		Date compareDate =  cardDetails.getExpiryDate();
		return this.expiryDate.compareTo(compareDate);
		
	}

}
