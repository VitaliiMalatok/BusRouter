package com.solvd.laba.utils;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;

public class FileUtils {

    public enum FileType {
        XML, JSON
    }

    public static File createDefaultRouteFile(FileType fileType) {
        String extension = recognizeExtension(fileType);
        return createRouteFile("src/main/resources/routes", extension);
    }

    private static String recognizeExtension(FileType fileType) {
        String extension;
        switch (fileType) {
            case XML:
                extension = "xml";
                break;
            case JSON:
                extension = "json";
                break;
            default:
                throw new RuntimeException("Type " + fileType.name() + " is not supported");
        }
        return extension;
    }

    private static File createRouteFile(String dirPath, String extension) {
        String filePath = dirPath + "/" + String.format("route-%s.%s", LocalDateTime.now(), extension);
        return createFile(filePath);
    }

    private static File createFile(String filePath) {
        File result;
        try {
            result = new File(filePath);
            org.apache.commons.io.FileUtils.touch(result);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
}
