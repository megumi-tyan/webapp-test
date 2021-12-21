package org.example.pojo;

public class Browse {
    // id 主键
    private Integer id;
    private Integer userId;
    private Integer productId;
    private String time;
    private String address;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Browse{" +
                "id=" + id +
                ", userId=" + userId +
                ", productId=" + productId +
                ", time='" + time + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
