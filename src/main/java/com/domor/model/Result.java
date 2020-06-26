package com.domor.model;

import lombok.Data;

import java.io.Serializable;

/**
 * 异步返回结果封装
 */
@Data
public class Result implements Serializable {

	private static final long serialVersionUID = -4297019343911730449L;

	private boolean status;
	private String message;//错误信息
	private String exception;//异常信息
	private Object data;

	public static Result success(){
		Result result = new Result();
		result.setStatus(true);
		return result;
	}

	public static Result success(Object data){
		Result result = new Result();
		result.setStatus(true);
		result.setData(data);
		return result;
	}

	public static Result error(String msg){
		Result result = new Result();
		result.setStatus(false);
		result.setMessage(msg);
		return result;
	}

	public static Result error(String msg, String exception){
		Result result = new Result();
		result.setStatus(false);
		result.setMessage(msg);
		result.setException(exception);
		return result;
	}

}
