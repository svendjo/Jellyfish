package com.jellyfish;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableList.Builder;

import freemarker.cache.FileTemplateLoader;
import freemarker.core.StopException;
import freemarker.template.*;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

import java.io.*;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Created by svend on 7/11/17.
 */
public class TemplateProcessor {

    private static final Pattern FILENAME_PATTERN = Pattern.compile("\\+=(.*?)=");

    public void process(String templateRootDirectory, String outputDirectory, Map<String, Object> dataModel) throws IOException, TemplateException {
        File dir = new File(templateRootDirectory);

        System.out.println("Using templates from: " + dir.getAbsolutePath());

        if (new File(outputDirectory).exists()) {
            throw new IllegalArgumentException("The directory " + outputDirectory + " already exists.");
        }

        Configuration cfg = new Configuration(new Version(2, 3, 23)); // Version corresponds to the Freemark version we want to support
        cfg.setTemplateLoader(new FileTemplateLoader(dir, true));
        cfg.setDefaultEncoding("UTF-8");
        cfg.setLocale(Locale.US);
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);

        List<String> templatePaths = getTemplatePaths(dir);

        processTemplates(cfg, dataModel, templatePaths, outputDirectory);
    }

    private void processTemplates(Configuration cfg, Map<String, Object> dataModel, List<String> templatePaths, String outputDirectory) throws IOException, TemplateException {
        for (String templatePath : templatePaths) {
            String outputFilenameTemplate = FilenameUtils.removeExtension(templatePath);
            Template template = cfg.getTemplate(templatePath);

            try {
                // The filename itself may contain template variables, so process the file name

                outputFilenameTemplate = preProcessFilename(outputFilenameTemplate);
                String outputFilename = processOnTheFlyTemplate(outputFilenameTemplate, cfg, dataModel);

                File outputFile = Paths.get(outputDirectory, outputFilename).toFile();
                outputFile.getParentFile().mkdirs();

                String result = processOnTheFlyTemplate(template.toString(), cfg, dataModel);

                try (Writer fileWriter = new FileWriter(outputFile)) {
                    fileWriter.write(result);
                }

                // Preserve permissions
                // Until I find a better way to preserve permissions, hardcoding .sh files
                if (outputFilename.endsWith((".sh")) || outputFilename.endsWith((".run"))) {
                    outputFile.setExecutable(true);
                }
            } catch (StopException e) {
                if (!"skip".equals(e.getMessageWithoutStackTop())) {
                    // To skip files or directories, we embed the following anywhere in the path or template:
                    // <#stop 'skip'>
                    throw e;
                }
            }
        }
    }

    private String preProcessFilename(String filename) {
        return FILENAME_PATTERN.matcher(filename).replaceAll("\\${$1}");
    }

    private String processOnTheFlyTemplate(String source, Configuration cfg, Map<String, Object> dataModel) throws IOException, TemplateException {
        Template t = new Template(null, source, cfg);
        try (StringWriter sw = new StringWriter()) {
            t.process(dataModel, sw);
            return sw.toString();
        }
    }

    private List<String> getTemplatePaths(File dir) {
        Builder<String> templates = new ImmutableList.Builder<>();

        Collection<File> files = FileUtils.listFiles(dir, new String[] { "ftl" }, true);
        for (File template : files) {
            String newPath = template.getAbsolutePath().replace(dir.getAbsolutePath(), "");

            templates.add(newPath);
        }

        return templates.build();
    }
}
