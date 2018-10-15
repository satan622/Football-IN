package com.spring.util;

import java.io.File;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;

		mkdir(uploadPath);

		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);

		return "/" + savedName;
	}

	// 폴더 생성
	private static void mkdir(String uploadPath) {
		if (new File(uploadPath).exists()) {
			return;
		}

		File dirPath = new File(uploadPath);
		if (!dirPath.exists()) {
			dirPath.mkdir();
		}
	}

}
