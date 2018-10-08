package com.spring.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;

		mkdir(uploadPath);

		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);

		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);

		String uploadedFileName = null;
		if (MediaUtils.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedName);
			return null;
		}
		return uploadedFileName;

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

	private static String makeThumbnail(String uploadPath, String fileName) throws Exception {

		BufferedImage sourceImg = ImageIO.read(new File(uploadPath, fileName));

		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);

		String thumbnailName = uploadPath + File.separator + "s_" + fileName;

		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	private static String makeIcon(String uploadPath, String fileName) throws Exception {
		String iconName = uploadPath + File.separator + fileName;

		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
