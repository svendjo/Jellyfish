package com.jellyfish;

import com.google.common.base.CaseFormat;
import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by svend on 7/11/17.
 */
public class NamingUtils {

    public static boolean isValidName(String name) {
        // No nulls, only ascii
        if (!StringUtils.isAsciiPrintable(name)) {
            return false;
        }

        String nameNoDashes = name.replace("-", "");

        // With dashes removed, the project name should only be alpha numeric
        if (!StringUtils.isAlphanumeric(nameNoDashes)) {
            return false;
        }

        // Can't start or end with a dash or contain double dashes
        if (StringUtils.startsWith(name, "-") || StringUtils.endsWith(name,"-") || name.contains("--")) {
            return false;
        }

        // Should be lowercase
        if (!name.equals(name.toLowerCase())) {
            return false;
        }

        return true;
    }

    public static Map<String, Object> generateServiceNameVariants(String name) {
        if (!isValidName(name)) {
            throw new IllegalArgumentException("Invalid name: " + name + ". Must be lowercase, alphanumeric.  Can contain dashes.");
        }

        String shortName = StringUtils.removeEnd(name, "-service");

        Map<String, Object> names = new HashMap<>();

        names.put(TemplateVariables.service_name, name);
        names.put(TemplateVariables.ServiceName, CaseFormat.LOWER_HYPHEN.to(CaseFormat.UPPER_CAMEL, name));
        names.put(TemplateVariables.serviceName, CaseFormat.LOWER_HYPHEN.to(CaseFormat.LOWER_CAMEL, name));
        names.put(TemplateVariables.SERVICENAME, CaseFormat.LOWER_HYPHEN.to(CaseFormat.LOWER_UNDERSCORE, name));
        names.put(TemplateVariables.Service, CaseFormat.LOWER_HYPHEN.to(CaseFormat.UPPER_CAMEL, shortName));
        names.put(TemplateVariables.service, shortName);
        names.put(TemplateVariables.SERVICE, CaseFormat.LOWER_HYPHEN.to(CaseFormat.UPPER_CAMEL, shortName));

        return names;
    }

    public static String getDirectoryPathFromJavaPackage(String javaPackage) {
        return javaPackage.replaceAll("\\.", "/");
    }
}
