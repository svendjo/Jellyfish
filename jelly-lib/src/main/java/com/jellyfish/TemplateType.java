package com.jellyfish;

/**
 * Created by svend on 7/11/17.
 */
public enum TemplateType {
    JAVA_LIBRARY("java-library"),
    STARFISH_PROJECT("starfish-project"),  // Creates service + root files
    STARFISH_SERVICE("starfish-service"),
    STARFISH_ROOT_FILES("starfish-root-files"),
    STARFISH_SPEC("starfish-spec"),
    STARFISH_JAVA_CLIENT("starfish-java-client");

    private static final String TEMPLATE_PATH_FORMAT = "jelly-templates/templates/";
    private final String type;

    private TemplateType(final String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return type;
    }

    public String getTemplatePath() {
        return String.format(TEMPLATE_PATH_FORMAT, this);
    }

    public static TemplateType fromString(final String type) {
        return TemplateType.valueOf(type.toUpperCase().replace("-", "_"));
    }
}
