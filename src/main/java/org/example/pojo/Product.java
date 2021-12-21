package org.example.pojo;

import java.util.Date;

public class Product {
    // id 主键
    private Integer id;
    private String name;
    private Double price;
    private String description;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCoverDir() {
        Date date = new Date();
        String dir = "book_covers/"+this.id+".jpg?time="+date;
        return dir;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getStatus() {
        return status;
    }

    public String getStatusStr() {
        if (status == null) {
            return "未知";
        }
        return status != 0 ? "在售" : "售空";
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", status=" + status +
                '}';
    }
}
