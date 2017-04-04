package com.awesome.web.business.controller;

import com.alibaba.fastjson.JSON;
import com.awesome.web.base.domain.Pager;
import com.awesome.web.base.domain.ResultMessage;
import com.awesome.web.base.domain.User;
import com.awesome.web.base.service.UserService;
import com.awesome.web.business.domain.Course;
import com.awesome.web.business.domain.CourseSearch;
import com.awesome.web.business.domain.StudentCourse;
import com.awesome.web.business.domain.UserOfCourse;
import com.awesome.web.business.service.CourseService;
import com.awesome.web.util.FileUploadUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author adam
 * @ClassName FileUploadController
 * @Description 选课信息 lyz
 * @create 2017/3/12 11:01
 */
@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;

    @RequestMapping("/list")
    public String list(ModelMap modelMap, CourseSearch courseSearch, Pager pager){
        Subject currentUser = SecurityUtils.getSubject(); //当前“用户”主体
        User user = (User)currentUser.getPrincipal();
        PageHelper.startPage(pager.getPageNum(), pager.getPageSize());      //分页
        List<Course> courses = courseService.getAll(courseSearch);
        modelMap.put("pageInfo", JSON.toJSON(new PageInfo(courses)) );        //返回分页结果
        modelMap.put("courseSearch", courseSearch );
        modelMap.put("teacherList", userService.getUserByRoleId(2) ); //老师信息
        modelMap.put("user",user); //当前用户
        return "/business/course/list";
    }

    @RequestMapping("/add")
    public String add(ModelMap modelMap){
        modelMap.put("course",JSON.toJSON(new Course()));
        modelMap.put("pager",JSON.toJSON(new Pager(1,6)));
        return "/business/course/form";
    }

    @RequestMapping("/edit")
    public String edit(ModelMap modelMap,Integer id,Pager pager){
        Course course = courseService.findById(id);
        modelMap.put("course", JSON.toJSON(course));
        modelMap.put("pager",JSON.toJSON(pager));
        return "/business/course/form";
    }

    @RequestMapping("/view")
    public String view(ModelMap modelMap,Integer id,Pager pager){
        Course course = courseService.findById(id);
        modelMap.put("course",JSON.toJSON(course));
        modelMap.put("pager",JSON.toJSON(pager));
        return "/business/course/view";
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
            return ResultMessage.success("保存成功！");
        }else{
            return ResultMessage.fail("保存失败！");
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
        int count = courseService.delete(id);
        if(count>0){
            return ResultMessage.success("删除成功！");
        }else{
            return ResultMessage.fail("删除失败！");
        }
    }

    /**
     * 参与课程
     * @param id
     * @return
     */
    @RequestMapping("/join")
    @ResponseBody
    public ResultMessage joinCourse(Integer id ,Integer isJoin){
        Subject currentUser = SecurityUtils.getSubject(); //当前“用户”主体
        User user = (User)currentUser.getPrincipal();
        //先判断 是否关联过
        StudentCourse studentCourse = courseService.findByStudentCourse(new StudentCourse(user.getUid(),id,null,null));
        Boolean flag =true;
        if(studentCourse==null){
            flag =courseService.insert(new StudentCourse(user.getUid(),id,0,isJoin));
        }else{
            studentCourse.setIsJoin(isJoin);
            flag = courseService.update(studentCourse);
        }
        if(flag){
            return ResultMessage.success((isJoin==1?"":"取消")+"参与成功！");
        }else{
            return ResultMessage.fail((isJoin==1?"":"取消")+"参与失败！");
        }
    }

    /**
     * 收藏课程
     * @param id
     * @return
     */
    @RequestMapping("/collect")
    @ResponseBody
    public ResultMessage collectCourse(Integer id,Integer isCollect ){
        Subject currentUser = SecurityUtils.getSubject(); //当前“用户”主体
        User user = (User)currentUser.getPrincipal();
        //先判断 是否关联过
        StudentCourse studentCourse = courseService.findByStudentCourse(new StudentCourse(user.getUid(),id,null,null));
        Boolean flag;
        if(studentCourse==null){
            flag =courseService.insert(new StudentCourse(user.getUid(),id,isCollect,0));
        }else{
            studentCourse.setIsCollect(isCollect);
            flag = courseService.update(studentCourse);
        }
        if(flag){
            return ResultMessage.success((isCollect==1?"":"取消")+"收藏成功！");
        }else{
            return ResultMessage.fail((isCollect==1?"":"取消")+"收藏失败！");
        }
    }

    /**
     * 我的参与
     * @param modelMap
     * @param pager
     * @return
     */
    @RequestMapping("/list/join")
    public String myJoin(ModelMap modelMap, CourseSearch courseSearch, Pager pager){
        Subject currentUser = SecurityUtils.getSubject(); //当前“用户”主体
        User user = (User)currentUser.getPrincipal();
        PageHelper.startPage(pager.getPageNum(), pager.getPageSize());      //分页
        List<Course> courses = courseService.getAllByStudentCourse(new StudentCourse(user.getUid(),null,null,1),courseSearch);
        modelMap.put("pageInfo", JSON.toJSON(new PageInfo(courses)) );        //返回分页结果
        modelMap.put("isJoinOrCollect", "join" );
        modelMap.put("courseSearch", courseSearch );
        modelMap.put("teacherList", userService.getUserByRoleId(2) ); //老师信息
        return "/business/course/myList";
    }

    /**
     * 我的收藏
     * @param modelMap
     * @param pager
     * @return
     */
    @RequestMapping("/list/collect")
    public String myCollect(ModelMap modelMap, CourseSearch courseSearch, Pager pager){
        Subject currentUser = SecurityUtils.getSubject(); //当前“用户”主体
        User user = (User)currentUser.getPrincipal();
        PageHelper.startPage(pager.getPageNum(), pager.getPageSize());      //分页
        List<Course> courses = courseService.getAllByStudentCourse(new StudentCourse(user.getUid(),null,1,null),courseSearch);
        modelMap.put("pageInfo", JSON.toJSON(new PageInfo(courses)) );        //返回分页结果
        modelMap.put("isJoinOrCollect", "collect" );
        modelMap.put("courseSearch", courseSearch );
        modelMap.put("teacherList", userService.getUserByRoleId(2) ); //老师信息
        return "/business/course/myList";
    }

    /**
     * 方法描述：参与的学生信息
     *
     * @author adam
     * @create 2017/4/3 22:37
     */
    @RequestMapping("/students")
    @ResponseBody
    public  List<UserOfCourse>  students(Integer id){
        return courseService.getJoinStudentByCourseId(id);
    }

    /**
     * 我的课程（发布课程）
     * @param modelMap
     * @param pager
     * @return
     */
    @RequestMapping("/list/release")
    public String release(ModelMap modelMap, Pager pager){
        Subject currentUser = SecurityUtils.getSubject(); //当前“用户”主体
        User user = (User)currentUser.getPrincipal();
        PageHelper.startPage(pager.getPageNum(), pager.getPageSize());      //分页
        List<Course> courses = courseService.getAllByPublisher(new ArrayList<Integer>(){{add(user.getUid());}});
        modelMap.put("pageInfo", JSON.toJSON(new PageInfo(courses)) );        //返回分页结果
        return "/business/course/list";
    }

    @RequestMapping("/addTotalTime")
    @ResponseBody
    public ResultMessage addTotalTime(Integer courseId,int step){
        Subject currentUser = SecurityUtils.getSubject(); //当前“用户”主体
        User user = (User)currentUser.getPrincipal();
        StudentCourse sc = courseService.getStudentCourseByStudentIdAndCourseId(user.getUid(),courseId);
        if(sc == null ){
            return ResultMessage.fail("当前用户和课程无关联！");
        }
        sc.setTotalTime(sc.getTotalTime()+step);
        int count = courseService.updateTotalTime(sc);
        if(count>0){
            return ResultMessage.success("时间添加成功！");
        }else{
            return ResultMessage.fail("时间添加失败！");
        }
    }


    /**
     * 视频上传
     * @param files
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/videoUpload")
    @ResponseBody
    public ResultMessage videoUpload(@RequestParam("file") MultipartFile[] files,
                                     HttpServletRequest request, HttpServletResponse response){
        int counter=0;
        String saveFileName="";//保存的文件名
        String fileName;    //实际的文件名
        File tagetFile;
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

        Map<String,String> data = new HashMap<>();
        data.put("videoUrl",saveFileName);
        data.put("imageUrl",currentTime+".jpg");
        return ResultMessage.success(currentTime,JSON.toJSONString(data));
    }
}
