package Calculator;

public class calculate{
	
	private double firstNo;
	private double secondNo;
	private String operator;
	private double total;

	
	public calculate() {
		
	}
	 
	public void calc() {
	   switch(operator) {
	      case "Add":
	    	  total = firstNo + secondNo;
	    	  break;
	      case "Minus":
	    	  total = firstNo - secondNo;
	    	  break;
	      case "Multiply":
	    	  total = firstNo * secondNo;
	    	  break;
	      case "Divide":
	    	  total = (double)firstNo / (double)secondNo;
	    	  break;
	      case "Remainder":
	    	  total = (double)firstNo % (double)secondNo;
	    	  break;
	      }
	 }
	 
		public double getFirstNo() {
			return firstNo;
		}

		public void setFirstNo(double firstNo) {
			this.firstNo = firstNo;
		}

		public double getSecondNo() {
			return secondNo;
		}

		public void setSecondNo(double secondNo) {
			this.secondNo = secondNo;
		}

		public String getOperator() {
			return operator;
		}

		public void setOperator(String operator) {
			
			this.operator = operator;
		}
		
		public double getTotal() {
			switch(operator) {
		      case "Add":
		    	  total = firstNo + secondNo;
		    	  break;
		      case "Minus":
		    	  total = firstNo - secondNo;
		    	  break;
		      case "Multiply":
		    	  total = firstNo * secondNo;
		    	  break;
		      case "Divide":
		    	  total = (double)firstNo / (double)secondNo;
		    	  break;
		      case "Remainder":
		    	  total = (double)firstNo % (double)secondNo;
		    	  break;
		      }
			 return total;
		}
}
