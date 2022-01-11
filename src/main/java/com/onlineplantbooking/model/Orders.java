package com.onlineplantbooking.model;

import java.util.Date;

public class Orders {
	private Product product;
	private User user;
	private int quantity;
	private int totalPrice;
	private String address;
	private Date orderDate;
	
	public Orders(Product product, User user, int quantity, int totalPrice, String address, Date orderDate) {
		super();
		this.product = product;
		this.user = user;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.address = address;
		this.orderDate = orderDate;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Orders(Product product, User user, int quantity, int totalPrice, String address) {
		super();
		this.product = product;
		this.user = user;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.address = address;
	}
	
	
	
	
}