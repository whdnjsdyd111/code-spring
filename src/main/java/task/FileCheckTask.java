package task;

import domain.BoardAttachVO;
import lombok.Setter;
import lombok.extern.java.Log;
import mapper.BoardAttachMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Log
@Component
public class FileCheckTask {
    @Setter(onMethod_ = @Autowired)
    private BoardAttachMapper attachMapper;

    private String getFolderYesterDay() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Calendar cal = Calendar.getInstance();

        cal.add(Calendar.DATE, -1);

        String str = sdf.format(cal.getTime());

        return str.replace("-", File.separator);
    }

    @Scheduled(cron = "0 0 2 * * *")
    public void checkFiles() throws Exception {
        log.warning("File Check Task run ...");
        log.warning(new Date().toString());

        // file list in database
        List<BoardAttachVO> fileList = attachMapper.getOldFiles();

        // ready for check file in directory with database file list
        List<Path> fileListPaths = fileList.stream()
                .map(vo -> Paths.get("C:\\upload", vo.getUploadPath(),
                        vo.getUuid() + "_" + vo.getFileName()))
                .collect(Collectors.toList());

        // image file has thumbnail file
        fileList.stream().filter(vo -> vo.isFileType() == true)
                .map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), "s_" +
                        vo.getUuid() + "_" + vo.getFileName()))
                .forEach(p -> fileListPaths.add(p));

        log.warning("====================");

        fileListPaths.forEach(p -> log.warning(p.toString()));

        // file in yesterday directory
        File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();

        File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);

        log.warning("====================");
        for(File file : removeFiles) {
            log.warning(file.getAbsolutePath());
            file.delete();
        }
    }
}
