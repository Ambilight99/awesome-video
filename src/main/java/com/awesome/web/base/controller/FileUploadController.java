package com.awesome.web.base.controller;

import com.awesome.web.util.FileUploadUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

/**
 * @author adam
 * @ClassName FileUploadController
 * @Description 文件上传
 * @create 2017/3/10 16:41
 */
@Controller
@RequestMapping("/upload")
public class FileUploadController {
    private int counter;
    private String saveFileName;//保存的文件名
    private String fileName;    //实际的文件名
    private File tagetFile;

    @RequestMapping("/view")
    public String view(){
        return "demo/fileUpload";
    }

    @RequestMapping("/videoShow")
    public String videoShow(){
        return "demo/videoShow";
    }

    @RequestMapping("/uploadFile")
    @ResponseBody
    public String uploads(@RequestParam("file") MultipartFile[] files,
                        HttpServletRequest request, HttpServletResponse response) {





        System.out.println("收到图片!");
        String contextRealPath = request.getSession().getServletContext().getRealPath("/"); //当前工程路径
        System.out.println( contextRealPath);
        String upaloadTempUrl = contextRealPath+"upload/temp/";//临时文件路径
        File dir = new File(upaloadTempUrl);
        System.out.println(upaloadTempUrl);
        if(!dir.exists())//目录不存在则创建
            dir.mkdirs();
        for(MultipartFile file :files) {
            counter++;
            fileName = file.getOriginalFilename();                              //获取文件名
            String suffix = FileUploadUtils.getSuffix(fileName);                //获取文件后缀
            String currentTime = String.valueOf(System.currentTimeMillis());    //当前时间作为保存的文件名
            saveFileName= FileUploadUtils.getFileName(currentTime,suffix);      //保存的文件全名
            String tempFilePath = upaloadTempUrl + saveFileName;                //临时文件路径

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

//            String videoPath = contextRealPath+"upload/video/";        //转码后的视频存放路径
//            File videoDir = new File(videoPath);
//            if (!videoDir.exists()){//目录不存在则创建
//                videoDir.mkdirs();
//            }
//            FileUploadUtils.videoToVideo(tempFilePath,ffmpegPath,videoPath+"33.flv");


        }
        System.out.println("接收完毕");
        return "success";
    }
}
