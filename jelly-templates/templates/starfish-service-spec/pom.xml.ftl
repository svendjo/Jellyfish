<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

  <modelVersion>4.0.0</modelVersion>

  <prerequisites>
    <maven>3.0.0</maven>
  </prerequisites>

  <groupId>${package}</groupId>
  <artifactId>${service_name}-spec</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <packaging>jar</packaging>

  <name>${service_name}-spec</name>

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
    <maven.compiler.source>1.8</maven.compiler.source>
    <maven.compiler.target>1.8</maven.compiler.target>
    <swagger-core-version>1.5.12</swagger-core-version>
    <okhttp-version>2.7.5</okhttp-version>
    <gson-version>2.6.2</gson-version>
    <jodatime-version>2.9.3</jodatime-version>
  </properties>

  <repositories>
    <repository>
      <id>sonatype-nexus-snapshots</id>
      <name>Sonatype Nexus Snapshots</name>
      <url>http://oss.sonatype.org/content/repositories/snapshots</url>
    </repository>
  </repositories>

  <build>
    <plugins>
      <plugin>
          <groupId>io.swagger</groupId>
          <artifactId>swagger-codegen-maven-plugin</artifactId>
          <version>2.2.2</version>
          <executions>
              <execution>
                  <goals>
                      <goal>generate</goal>
                  </goals>
                  <configuration>
                      <inputSpec>specs/api.yaml</inputSpec>
                      <language>java</language>
                      <configOptions>
                         <sourceFolder>src/gen/java/main</sourceFolder>
                      </configOptions>
                  </configuration>
              </execution>
          </executions>
      </plugin>
    </plugins>
  </build>

  <dependencies>
    <dependency>
      <groupId>io.swagger</groupId>
      <artifactId>swagger-annotations</artifactId>
      <version>${r"${swagger-core-version}"}</version>
    </dependency>
    <dependency>
      <groupId>com.squareup.okhttp</groupId>
      <artifactId>okhttp</artifactId>
      <version>${r"${okhttp-version}"}</version>
    </dependency>
    <dependency>
      <groupId>com.squareup.okhttp</groupId>
      <artifactId>logging-interceptor</artifactId>
      <version>${r"${okhttp-version}"}</version>
    </dependency>
    <dependency>
      <groupId>com.google.code.gson</groupId>
      <artifactId>gson</artifactId>
      <version>${r"${gson-version}"}</version>
    </dependency>
    <dependency>
      <groupId>joda-time</groupId>
      <artifactId>joda-time</artifactId>
      <version>${r"${jodatime-version}"}</version>
    </dependency>
    <dependency>
      <groupId>com.fasterxml.jackson.core</groupId>
      <artifactId>jackson-annotations</artifactId>
      <version>2.5.4</version>
    </dependency>
    <dependency>
      <groupId>javax.validation</groupId>
      <artifactId>validation-api</artifactId>
      <type>jar</type>
      <version>1.1.0.Final</version>
    </dependency>
  </dependencies>
</project>
