package ru.konstpavlov.springMVC.mvc.file;

import org.springframework.core.task.SyncTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by Konstantin on 19.09.2016.
 *
 *
 *
 *
 */
@Controller
public class FileUploadController {

    @RequestMapping(value = "/uploadFile",method = RequestMethod.POST)
    public @ResponseBody String handleFileUpload(@RequestParam("file")MultipartFile file)
    {
        if (!file.isEmpty())
        {
            try {
                byte[] bytes = file.getBytes();
                String rootPath = System.getProperty("catalina.home");
                System.out.println("Server rootPath: "+rootPath);
                System.out.println("File original name: " + file.getOriginalFilename());
                System.out.println("File content type: "+file.getContentType());

                File newFile = new File(rootPath+ File.separator+file.getOriginalFilename());
                BufferedOutputStream bufferedOutputStream =new BufferedOutputStream(new FileOutputStream(newFile));
                bufferedOutputStream.write(bytes);
                bufferedOutputStream.close();

                System.out.println("File is saved under: " + rootPath + File.separator + file.getOriginalFilename());
                return "File is saved under: " + rootPath + File.separator + file.getOriginalFilename();

            } catch (IOException e) {
                e.printStackTrace();
                return "File upload is failed: " +e.getMessage();
            }
        } else {
            return "File upload is failed: File is empty";
        }
    }
}
