package br.com.casadocodigo.loja.controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;


//import com.amazonaws.AmazonClientException;
//import com.amazonaws.services.s3.AmazonS3Client;
//import com.amazonaws.services.s3.model.ObjectMetadata;

@Component
public class FileSaver {

	@Autowired
	private HttpServletRequest request;
	
	public String write (String baseFolder, MultipartFile file){
		String realPath = request.getServletContext().getRealPath("/WEB-INF/" + baseFolder);
		
		try {
			String path = realPath + "/" + file.getOriginalFilename();
			file.transferTo(new File(path));
			return baseFolder + "/" + file.getOriginalFilename();
			
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
	}
}
