package org.example.pojo;

import java.util.List;

public class Analysis {
    private Double totalSales;
    private Integer totalOrderNum;
    private List<OrderBookClass> orderBookClasses;

    public Double getTotalSales() {
        return totalSales;
    }

    public void setTotalSales(Double totalSales) {
        this.totalSales = totalSales;
    }

    public Integer getTotalOrderNum() {
        return totalOrderNum;
    }

    public void setTotalOrderNum(Integer totalOrderNum) {
        this.totalOrderNum = totalOrderNum;
    }

    public List<OrderBookClass> getOrderBookClasses() {
        return orderBookClasses;
    }

    public void setOrderBookClasses(List<OrderBookClass> orderBookClasses) {
        this.orderBookClasses = orderBookClasses;
    }

    @Override
    public String toString() {
        return "Analysis{" +
                "totalSales=" + totalSales +
                ", totalOrderNum=" + totalOrderNum +
                ", OrderBookClasses=" + orderBookClasses +
                '}';
    }
}
