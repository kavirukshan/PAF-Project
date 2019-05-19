package com.sliit.payment.beans;

public class Payment {
    private Integer id;
    private String item_id;
    private Double unitPrice;
    private Integer qtyOnHand;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getItem_id() {
        return item_id;
    }

    public void setItem_id(String description) {
        this.item_id = item_id;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Integer getQtyOnHand() {
        return qtyOnHand;
    }

    public void setQtyOnHand(Integer qtyOnHand) {
        this.qtyOnHand = qtyOnHand;
    }
}
