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
    private String data;

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

    public ResultMessage(String status,String message,String data){
        this.status=status;
        this.message=message;
        this.data=data;
    }

    public static ResultMessage fill(String status,String message){
    	return new ResultMessage(status,message);
    }
    
    public static ResultMessage fill(String status,String message,String data){
    	return new ResultMessage(status,message,data);
    }
    
    /**
     * 
     * @Title: success   
     * @Description: 返回成功消息
     * @param message	消息
     * @return 
     * @return ResultMessage 
     * @author adam    
     * @date 2017年3月30日 上午9:31:13
     */
    public static ResultMessage success(String message){
    	return ResultMessage.fill(ResultMessage.SUCCESS,message);
    }
    
    /**
     * 
     * @Title: success   
     * @Description: 返回成功消息
     * @param message 消息
     * @param data	数据
     * @return 
     * @return ResultMessage 
     * @author adam    
     * @date 2017年3月30日 上午9:32:15
     */
    public static ResultMessage success(String message,String data){
    	return ResultMessage.fill(ResultMessage.SUCCESS,message,data);
    }
    
    /**
     * 
     * @Title: fail   
     * @Description: 返回失败消息
     * @param message
     * @return 
     * @return ResultMessage 
     * @author adam    
     * @date 2017年3月30日 上午9:31:35
     */
    public static ResultMessage fail(String message){
    	return ResultMessage.fill(ResultMessage.FAIL,message);
    }
    
    /**
     * 
     * @Title: fail   
     * @Description: 返回失败消息
     * @param message
     * @param data
     * @return 
     * @return ResultMessage 
     * @author adam    
     * @date 2017年3月30日 上午9:32:05
     */
    public static ResultMessage fail(String message,String data){
    	return ResultMessage.fill(ResultMessage.FAIL,message,data);
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

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
