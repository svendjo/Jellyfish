package com.jellyfish;

import freemarker.template.TemplateException;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

/**
 * Created by svend on 7/11/17.
 */
public class JellyProjectCreator {
    private final TemplateProcessor templateProcessor;

    public JellyProjectCreator(TemplateProcessor templateProcessor) {
        this.templateProcessor = templateProcessor;
    }

    public void createProject(String outputPath, String projectName, TemplateType templateType, String javaPackage) throws IOException, TemplateException {
        final String finalOutputPath;

        if (templateType == TemplateType.STARFISH_PROJECT) {
            finalOutputPath = Paths.get(outputPath).toString();

            generate(Paths.get(finalOutputPath), projectName, TemplateType.STARFISH_ROOT_FILES, javaPackage);
            generate(Paths.get(finalOutputPath, projectName), projectName, TemplateType.STARFISH_SERVICE, javaPackage);
//            generate(Paths.get(finalOutputPath, projectName = "-java-client"), projectName, TemplateType.STARFISH_JAVA_CLIENT, javaPackage);
//            generate(Paths.get(finalOutputPath, projectName = "-spec"), projectName, TemplateType.STARFISH_SPEC, javaPackage);
        }
    }

    private void generate(Path finalOutputPath, String projectName, TemplateType templateType, String javaPackage) throws IOException, TemplateException {
        String inputPath = Paths.get(templateType.getTemplatePath()).toString();

        Map<String, Object> dataModel = NamingUtils.generateServiceNameVariants(projectName);
        dataModel.put(TemplateVariables.javaPackage, javaPackage);
        dataModel.put(TemplateVariables.javaPackageDir, NamingUtils.getDirectoryPathFromJavaPackage(javaPackage));

        templateProcessor.process(inputPath, finalOutputPath.toString(), dataModel);
    }
}
