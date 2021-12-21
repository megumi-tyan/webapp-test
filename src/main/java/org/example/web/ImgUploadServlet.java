package org.example.web;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@WebServlet("/imgUploadServlet")
public class ImgUploadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("imgUploadServlet");
        // 判断enctype属性是否为multipart/form-data
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        System.out.println(isMultipart);
        String parePath = request.getSession().getServletContext().getRealPath("/posts/");
        ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory()); // Create a new file upload handler
        upload.setSizeMax(4 * 1024 * 1024); // 设置上传内容的大小限制（单位：字节）
        // Parse the request
        List<?> items = null;
        try {
            items = upload.parseRequest(request);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        for (Object o : items) {
            FileItem item = (FileItem) o;
            if (item.isFormField()) {
                //如果是普通表单字段 ...
            } else {
                //如果是文件字段
                // Process a file upload
                boolean writeToFile = true;
                if (writeToFile) {
                    File uploadedFile = new File(parePath, "new_image.jpg");
                    try {
                        item.write(uploadedFile);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
//                    InputStream uploadedStream = item.getInputStream();
//                    ...
//                    uploadedStream.close();
                }
            }
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
