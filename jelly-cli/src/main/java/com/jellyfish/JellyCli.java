package com.jellyfish;

import org.kohsuke.args4j.CmdLineException;
import org.kohsuke.args4j.CmdLineParser;
import org.kohsuke.args4j.Option;
import org.kohsuke.args4j.ParserProperties;

public class JellyCli {

    private final TemplateProcessor templateProcessor;

    @Option(name = "-o", required = true, usage = "The output path. e.g. /home/user/workspace/my-service-workspace/my-new-thing")
    private String outputPath;

    @Option(name = "-n", required = true, usage = "The project name. lowercase, alphanumeric, dashes only. Should almost always end in -service e.g. myh-cool-service")
    private String projectName;

    @Option(name = "-t", required = true, usage = "The template type. jelly-project, java-library")
    private String type;

    @Option(name = "-p", required = true, usage = "Java package e.g. com.example")
    private String javaPackage;

    public static void main(String[] args) {
        final TemplateProcessor templateProcessor = new TemplateProcessor();
        new JellyCli(templateProcessor).run(args);
    }

    public JellyCli(TemplateProcessor templateProcessor) {
        this.templateProcessor = templateProcessor;
    }

    public void run(String[] args) {
        parseArguments(args);

        final TemplateType templateType = TemplateType.fromString(type);

        try {
            JellyProjectCreator c = new JellyProjectCreator(templateProcessor);
            c.createProject(outputPath, projectName, templateType, javaPackage);
            System.out.println("Generated project");
        } catch (Exception e) {
            System.err.println("Failed to generate project. " + e.getMessage());
            System.exit(1);
        }
    }

    private void parseArguments(String[] args) {
        ParserProperties props = ParserProperties.defaults().withUsageWidth(120);

        CmdLineParser parser = new CmdLineParser(this, props);

        try {
            if (args == null || args.length == 0) {
                throw new CmdLineException(parser, "Arguments are required", new IllegalArgumentException("Arguments are required"));
            }
            parser.parseArgument(args);
        } catch (CmdLineException e) {
            System.err.println(e.getMessage());
            System.err.println("jelly [options...] arguments...");
            parser.printUsage(System.err);

            System.exit(1);
        }
    }
}