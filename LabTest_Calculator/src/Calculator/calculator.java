package Calculator;

import java.io.Serializable;

public class calculator implements Serializable{
	
	private int firstNo;
	private int secondNo;
	private String operator;
	private double result;
	 
	 public calculator(int number1, int number2, String operator) {
	  this.firstNo = number1;
	  this.secondNo = number2;
	  this.operator = operator;
	 }
	 
	 public void calc() {
	   switch(operator) {
	      case "Add":
		       result= firstNo + secondNo;
		       break;
	      case "Minus":
		       result= firstNo - secondNo;
		       break;
	      case "Multiply":
		       result= firstNo * secondNo;
		       break;
	      case "Divide":
		       result= (double)firstNo / (double)secondNo;
		       break;
	      case "Remainder":
		       result= (double)firstNo % (double)secondNo;
		       break;
	      }
	 }
	 
	 public double getResult() {
	  return result;
	  
	 }

}
