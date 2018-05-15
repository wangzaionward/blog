package com.wangzai.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * 联系人导入
 */
@Controller
public class ImportContactsController{

    /**
     * 上传文件页面
     * @return
     */
    @RequestMapping("/importContacts")
    public String importContacts(){
        return "importContacts";
    }

    /**
     * 开始导入数据
     * @param file
     * @return
     * @throws IOException
     */
    @RequestMapping("doImportContacts")
    @ResponseBody
    public String doImportContacts(@RequestParam("file") MultipartFile file){
        //上传文件保存路径
        String savePath = "D:/test/";
        if(file.isEmpty()) return "文件为空,无法导入";
        try {
            String fileName = file.getOriginalFilename();
            savePath = savePath + fileName;//文件最终上传的位置
            File destFile = new File(savePath);
            file.transferTo(destFile);
            return "导入成功";
        } catch (IOException e) {
            e.printStackTrace();
            return "导入失败";
        }
    }
}
