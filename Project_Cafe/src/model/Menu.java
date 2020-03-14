package model;

public class Menu {
	protected int productID;
    protected String productName;
    protected int quantity;
    protected String productCategory;
    protected double productPrice;

    public Menu() {}
    
    // ID, Name, Category
    public Menu(int id, String name, String type) {
        super();
        this.productID = id;
        this.productName = name;
        this.productCategory = type;
    }
    
    // Name, Category, Price
    public Menu(String name, String type, double price) {
        super();
        this.productName = name;
        this.productCategory = type;
        this.productPrice = price;
    }
    
    //ID, Name, Category, Price
    public Menu(int id, String name, String type, double price) {
        super();
        this.productID = id;
        this.productName = name;
        this.productCategory = type;
        this.productPrice = price;
    }
    
    //Name, Quantity, Category, Price
    public Menu(String name, int quantity, String type, double price) {
        super();
        this.productName = name;
        this.quantity = quantity;
        this.productCategory = type;
        this.productPrice = price;
    }
    
    //Everything
    public Menu(int id, String name, int quantity, String type, double price) {
        super();
        this.productID = id;
        this.productName = name;
        this.quantity = quantity;
        this.productCategory = type;
        this.productPrice = price;
    }

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}
    
    

	
}
