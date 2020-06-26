package com.domor.model;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * t_advise
 * @author 
 */
@Data
public class Advise implements Serializable {

    private int id;

    private String name;

    private String phone;

    private String content;

    private Date createtime;

    private static final long serialVersionUID = 1L;
}