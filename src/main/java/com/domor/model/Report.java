package com.domor.model;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * t_report
 * @author 
 */
@Data
public class Report implements Serializable {

    private Integer id;

    /**
     * 1个人；2单位
     */
    private Integer type;

    private String jbrname;

    private Byte jbrsex;

    private String jbrunit;

    private String jbrid;

    private String jbrarea;

    private String jbraddr;

    private String jbrphone;

    private String bjbname;

    private Byte bjbsex;

    private String bjbduty;

    private String bjbarea;

    private String bjbunit;

    private String bjblevel;

    private String bjbtype;

    private String bjbmemo;

    private Date createtime;

    private static final long serialVersionUID = 1L;
}