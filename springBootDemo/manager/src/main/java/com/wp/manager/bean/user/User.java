package com.wp.manager.bean.user;

import com.wp.manager.core.bean.AbstractBaseApiBean;

import java.util.Date;

/**
 * @author wp
 * @since 2018/9/11 16:16
 */
public class User extends AbstractBaseApiBean {
    private static final long serialVersionUID = 2833332411123336162L;

    private String username;

    private String password;

    private String salt;

    private String name;

    private String email;

    private String mobile;

    private Date createdTime;

    private Date updatedTime;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }
}
