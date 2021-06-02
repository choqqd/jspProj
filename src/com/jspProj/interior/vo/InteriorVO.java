package com.jspProj.interior.vo;

public class InteriorVO {
	private String itemCode;
	private String itemName;
	private int price;
	private String dsName;
	private String itemDesc;
	private String itemImage;
	private String dsImage;

	private int amount;
	private String memberId;

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getDsImage() {
		return dsImage;
	}

	public void setDsImage(String dsImage) {
		this.dsImage = dsImage;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDsName() {
		return dsName;
	}

	public void setDsName(String dsName) {
		this.dsName = dsName;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public String getItemImage() {
		return itemImage;
	}

	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}
}
