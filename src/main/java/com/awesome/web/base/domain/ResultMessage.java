package com.awesome.web.base.domain;

/**
 * @author adam
 * @ClassName ResultMessage
 * @Description 返回结果信息
 * @create 2017/3/12 15:43
 */
public class ResultMessage {
    public static final String SUCCESS ="success";
    public static final String FAIL ="fail";

    private String status;
    private String message;

    public ResultMessage(){
        super();
    }

    public ResultMessage(String status){
        this.status=status;
    }

    public ResultMessage(String status,String message){
        this.status=status;
        this.message=message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
