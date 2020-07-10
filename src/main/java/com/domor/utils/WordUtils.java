package com.domor.utils;

import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.Map;

public class WordUtils {


    private WordUtils() {
        throw new AssertionError();
    }

    /**
     * 生成word文件
     * @param map freemarker flt模板文件所需要的数据
     * @param title 导出的文件名称
     * @param ftlFile 模板文件名称
     * @throws IOException
     */
    public static File createWord(Map map, String title, String ftlFile) throws IOException {
        Configuration configuration = new Configuration();
        Resource resource = new ClassPathResource("excel/"+ftlFile);
        configuration.setDefaultEncoding("utf-8");
        try {
            //设置模板文件的目录
            configuration.setDirectoryForTemplateLoading(resource.getFile());
        } catch (IOException e) {
            e.printStackTrace();
        }

        Template t = configuration.getTemplate(ftlFile);
        File f = new File(title);
        try {
            // 这个地方不能使用FileWriter因为需要指定编码类型否则生成的Word文档会因为有无法识别的编码而无法打开
            Writer w = new OutputStreamWriter(new FileOutputStream(f), "utf-8");
            t.process(map, w);
            w.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
        return f;
    }

    /**
     * 导出word
     * @param request 请求
     * @param response 响应
     * @param map freemarker flt模板文件所需要的数据
     * @param title 导出的文件名称
     * @param ftlFile 模板文件名称
     * @throws IOException
     */
    public static void exportWord(HttpServletRequest request, HttpServletResponse response, Map map, String title, String ftlFile) throws IOException {
        Configuration configuration = new Configuration();
        Resource resource = new ClassPathResource("/excel/");
        configuration.setDefaultEncoding("utf-8");
        configuration.setDirectoryForTemplateLoading(resource.getFile());
        Template t = configuration.getTemplate(ftlFile);
        File file = null;
        InputStream fin = null;
        ServletOutputStream out = null;
        try {
            // 调用工具类的createDoc方法生成Word文档
            file = new File("exportWord.doc");
            try {
                // 这个地方不能使用FileWriter因为需要指定编码类型否则生成的Word文档会因为有无法识别的编码而无法打开
                Writer w = new OutputStreamWriter(new FileOutputStream(file), "utf-8");
                t.process(map, w);
                w.close();
            } catch (Exception ex) {
                ex.printStackTrace();
                throw new RuntimeException(ex);
            }
            fin = new FileInputStream(file);

            response.setCharacterEncoding("utf-8");
            response.setContentType("application/msword");
            response.setHeader("Content-Disposition", "attachment;filename=" + (URLEncoder.encode(title, "UTF-8")));

            out = response.getOutputStream();
            byte[] buffer = new byte[512];  // 缓冲区  
            int bytesToRead = -1;
            // 通过循环将读入的Word文件的内容输出到浏览器中  
            while ((bytesToRead = fin.read(buffer)) != -1) {
                out.write(buffer, 0, bytesToRead);
            }

        } finally {
            if (fin != null) fin.close();
            if (out != null) out.close();
            if (file != null) file.delete(); // 删除临时文件
        }
    }

}