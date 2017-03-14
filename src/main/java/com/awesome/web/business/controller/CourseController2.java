package com.awesome.web.business.controller;

import com.alibaba.fastjson.JSON;
import com.awesome.web.base.domain.Pager;
import com.awesome.web.base.domain.ResultMessage;
import com.awesome.web.base.domain.User;
import com.awesome.web.base.service.UserService;
import com.awesome.web.business.domain.Course;
import com.awesome.web.business.service.CourseService;
import com.awesome.web.util.FileUploadUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;


/**
 * @author adam
 * @ClassName FileUploadController
 * @Description 选课信息 lyz
 * @create 2017/3/12 11:01
 */
@Controller
@RequestMapping("/course")
public class CourseController2 {

    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;

    @RequestMapping("/list")
    public String list(ModelMap modelMap, Pager pager){
        PageHelper.startPage(pager.getPageNum(), pager.getPageSize());      //分页
        List<Course> courses = courseService.getAll();
        modelMap.put("pageInfo", JSON.toJSON(new PageInfo(courses)) );        //返回分页结果
        return "/business/course/list";
    }

    @RequestMapping("/add")
    public String add(ModelMap modelMap){
        modelMap.put("course",JSON.toJSON(new Course()));
        modelMap.put("pager",JSON.toJSON(new Pager(1,15)));
        return "/business/course/form";
    }

    @RequestMapping("/edit")
    public String edit(ModelMap modelMap,Integer uid,Pager pager){
        User user = userService.findById(uid);
        modelMap.put("user", JSON.toJSON(user));
        modelMap.put("pager",JSON.toJSON(pager));
        return "/business/course/form";
    }

    /**
     * 保存或更新
     * @param course
     * @return
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public ResultMessage saveOrUpdate(Course course ){
        int count =courseService.saveOrUpdate(course);
        if(count>0){
            return new ResultMessage(ResultMessage.SUCCESS,"保存成功！");
        }else{
            return new ResultMessage(ResultMessage.FAIL,"保存失败！");
        }
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public ResultMessage delete(Integer id){
        int count = userService.delete(id);
        if(count>0){
            return new ResultMessage(ResultMessage.SUCCESS,"删除成功！");
        }else{
            return new ResultMessage(ResultMessage.FAIL,"删除失败！");
        }
    }

    @RequestMapping("/videoUpload")
    @ResponseBody
    public ResultMessage videoUpload(@RequestParam("file") MultipartFile[] files,
                                     HttpServletRequest request, HttpServletResponse response){
        int counter=0;
        String saveFileName="";//保存的文件名
        String fileName="";    //实际的文件名
        File tagetFile=null;
        String currentTime="";

        System.out.println("收到图片!");
        String contextRealPath = request.getSession().getServletContext().getRealPath("/"); //当前工程路径
        System.out.println( contextRealPath);
        String upaloadTempUrl = contextRealPath+"upload/video/";//视频路径
        File dir = new File(upaloadTempUrl);
        System.out.println(upaloadTempUrl);
        if(!dir.exists())//目录不存在则创建
            dir.mkdirs();
        for(MultipartFile file :files) {
            counter++;
            fileName = file.getOriginalFilename();                              //获取文件名
            String suffix = FileUploadUtils.getSuffix(fileName);                //获取文件后缀
            currentTime = String.valueOf(System.currentTimeMillis());    //当前时间作为保存的文件名
            saveFileName= FileUploadUtils.getFileName(currentTime,suffix);      //保存的文件全名
            String tempFilePath = upaloadTempUrl + saveFileName;                //临时视频路径

            tagetFile = new File(tempFilePath);             //创建文件对象
            if (!tagetFile.exists()) {                     //文件名不存在 则新建文件，并将文件复制到新建文件中
                try {
                    tagetFile.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    file.transferTo(tagetFile);
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            String ffmpegPath = contextRealPath +"/static/tools/ffmpeg.exe";    //ffmpeg转码器位置
            String imagePath = contextRealPath+"upload/image/";        //视频截图存放路径
            File imageDir = new File(imagePath);
            if (!imageDir.exists()){//目录不存在则创建
                imageDir.mkdirs();
            }
            FileUploadUtils.ideoToPicture(tempFilePath,ffmpegPath,imagePath+currentTime+".jpg");
        }
        System.out.println("接收完毕");

        return new ResultMessage(ResultMessage.SUCCESS,currentTime);
    }
}