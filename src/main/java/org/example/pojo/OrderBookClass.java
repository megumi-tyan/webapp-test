package org.example.pojo;

import java.util.List;

public class OrderBookClass {
    private String className;
    private Double classTotalSale;
    private Integer classTotalOrderNum;

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Double getClassTotalSale() {
        return classTotalSale;
    }

    public void setClassTotalSale(Double classTotalSale) {
        this.classTotalSale = classTotalSale;
    }

    public Integer getClassTotalOrderNum() {
        return classTotalOrderNum;
    }

    public void setClassTotalOrderNum(Integer classTotalOrderNum) {
        this.classTotalOrderNum = classTotalOrderNum;
    }

    @Override
    public String toString() {
        return "OrderBookClass{" +
                "className='" + className + '\'' +
                ", classTotalSale=" + classTotalSale +
                ", classTotalOrderNum=" + classTotalOrderNum +
                '}';
    }
}
