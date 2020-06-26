package com.domor.model;

import java.util.Date;

import lombok.Data;

@Data
public class User {

	private String username;// 用户名称
	private String password;// 用户密码
	private String realname;// 用户姓名
	private String phone;// 手机
	private Integer sex;// 性别
	private Integer age;// 年龄
	private Integer dept;// 部门ID
	private String deptName;// 部门名称
	private String area;// 区域Code
	private String areaName;// 区域名称
	private Integer role;// 角色ID
	private String roleName;// 角色名称
	
	private String creator;//创建人
	private Date createTime;//创建时间
	private String editor;//修改人
	private Date editTime;//修改时间
	private Integer delete_flag = 0;//是否可用

}
