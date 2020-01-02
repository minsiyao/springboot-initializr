package com.minsiyao.controller;

import com.minsiyao.entity.User;
import com.minsiyao.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@RequestMapping("test")
public class TestController {
    @Autowired
    private TestService ts;
    @RequestMapping("test")
    public List<User> test(){
        System.out.println(ts.selectAll());
        return ts.selectAll();
    }
    @RequestMapping("upload")
    public void upload(MultipartFile file, HttpSession session){
//        1.获得upload文件夹的路径
        String realPath = session.getServletContext().getRealPath("upload/img");
//        2.判断文件夹是否存在
        File file1 = new File(realPath);
        if(!file1.exists()){
            file1.mkdirs();
        }
//        3.获取文件真实名字
        String originalFilename = file.getOriginalFilename();
        System.out.println("文件名为："+file);
        System.out.println("文件真实名字为："+originalFilename);
//        4.为了防止同一个文件多次上传发生覆盖  拼接时间戳
        String name = new Date().getTime()+"_"+originalFilename;
//        5.文件上传
        try {
            file.transferTo(new File(realPath,name));
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
    @RequestMapping("download")
    public void download(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("文件下载");
        String path = request.getSession().getServletContext().getRealPath("/upload/img");
        FileInputStream is = new FileInputStream(new File(path,fileName));
        ServletOutputStream os = response.getOutputStream();
        byte[] bytes = new byte[2048];
        while(true){
            int i = is.read(bytes,0,bytes.length);
            if(i==-1)break;
            //向外响应
            os.write(bytes,0,i);
        }
        is.close();
        os.close();
    }

}

























