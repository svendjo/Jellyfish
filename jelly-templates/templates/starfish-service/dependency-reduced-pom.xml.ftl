<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>${package}</groupId>
  <artifactId>${service_name}</artifactId>
  <name>${service_name}</name>
  <version>0.0.1-SNAPSHOT</version>
  <prerequisites>
    <maven>3.0.0</maven>
  </prerequisites>
  <build>
    <pluginManagement>
      <plugins>
        <plugin>
          <artifactId>maven-clean-plugin</artifactId>
          <version>2.6.1</version>
        </plugin>
        <plugin>
          <artifactId>maven-install-plugin</artifactId>
          <version>2.5.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-surefire-plugin</artifactId>
          <version>2.19.1</version>
        </plugin>
        <plugin>
          <artifactId>maven-resources-plugin</artifactId>
          <version>2.7</version>
        </plugin>
        <plugin>
          <artifactId>maven-enforcer-plugin</artifactId>
          <version>1.4.1</version>
        </plugin>
        <plugin>
          <artifactId>maven-compiler-plugin</artifactId>
          <version>3.6.0</version>
        </plugin>
        <plugin>
          <artifactId>maven-source-plugin</artifactId>
          <version>2.4</version>
        </plugin>
        <plugin>
          <artifactId>maven-jar-plugin</artifactId>
          <version>2.6</version>
        </plugin>
        <plugin>
          <artifactId>maven-shade-plugin</artifactId>
          <version>2.4.3</version>
        </plugin>
        <plugin>
          <artifactId>maven-deploy-plugin</artifactId>
          <version>2.8.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-site-plugin</artifactId>
          <version>3.4</version>
        </plugin>
      </plugins>
    </pluginManagement>
    <plugins>
      <plugin>
        <artifactId>maven-enforcer-plugin</artifactId>
        <executions>
          <execution>
            <id>enforce</id>
            <goals>
              <goal>enforce</goal>
            </goals>
            <configuration>
              <rules>
                <DependencyConvergence />
              </rules>
            </configuration>
          </execution>
        </executions>
      </plugin>
      <plugin>
        <artifactId>maven-source-plugin</artifactId>
        <executions>
          <execution>
            <id>attach-sources</id>
            <goals>
              <goal>jar</goal>
            </goals>
          </execution>
        </executions>
      </plugin>
      <plugin>
        <artifactId>maven-jar-plugin</artifactId>
        <configuration>
          <archive>
            <manifest>
              <addDefaultImplementationEntries>true</addDefaultImplementationEntries>
            </manifest>
          </archive>
        </configuration>
      </plugin>
      <plugin>
        <artifactId>maven-shade-plugin</artifactId>
        <executions>
          <execution>
            <phase>package</phase>
            <goals>
              <goal>shade</goal>
            </goals>
          </execution>
        </executions>
        <configuration>
          <createDependencyReducedPom>true</createDependencyReducedPom>
          <filters>
            <filter>
              <artifact>*:*</artifact>
              <excludes>
                <exclude>META-INF/*.SF</exclude>
                <exclude>META-INF/*.DSA</exclude>
                <exclude>META-INF/*.RSA</exclude>
              </excludes>
            </filter>
          </filters>
          <transformers>
            <transformer />
            <transformer>
              <mainClass>${package}.${ServiceName}Application</mainClass>
            </transformer>
          </transformers>
        </configuration>
      </plugin>
      <plugin>
        <artifactId>maven-dependency-plugin</artifactId>
        <version>2.10</version>
        <executions>
          <execution>
            <id>unpack</id>
            <phase>initialize</phase>
            <goals>
              <goal>unpack</goal>
            </goals>
            <configuration>
              <artifactItems>
                <artifactItem>
                  <groupId>${package}</groupId>
                  <artifactId>${service_name}-spec</artifactId>
                  <type>jar</type>
                  <includes>api.yaml</includes>
                  <outputDirectory>${r"${swagger-spec-temp-dir}"}</outputDirectory>
                </artifactItem>
              </artifactItems>
            </configuration>
          </execution>
        </executions>
      </plugin>
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
              <apiPackage>${package}</apiPackage>
              <inputSpec>../${service_name}-spec/specs/api.yaml</inputSpec>
              <language>jaxrs</language>
              <configOptions>
                <sourceFolder>src/main/java</sourceFolder>
              </configOptions>
            </configuration>
          </execution>
        </executions>
      </plugin>
      <plugin>
        <artifactId>maven-resources-plugin</artifactId>
        <version>3.0.0</version>
        <executions>
          <execution>
            <id>copy-config-resources</id>
            <phase>process-resources</phase>
            <goals>
              <goal>copy-resources</goal>
            </goals>
            <configuration>
              <outputDirectory>${r"${project.build.directory}"}/config</outputDirectory>
              <resources>
                <resource>
                  <directory>config</directory>
                  <includes>
                    <include>*.conf</include>
                  </includes>
                </resource>
              </resources>
            </configuration>
          </execution>
          <execution>
            <id>copy-environment-config</id>
            <phase>process-resources</phase>
            <goals>
              <goal>copy-resources</goal>
            </goals>
            <configuration>
              <outputDirectory>${r"${project.build.directory}"}/environment-config</outputDirectory>
              <resources>
                <resource>
                  <directory>environment-config</directory>
                  <includes>
                    <include>*.env</include>
                  </includes>
                </resource>
              </resources>
            </configuration>
          </execution>
        </executions>
      </plugin>
    </plugins>
  </build>
  <profiles>
    <profile>
      <id>dev</id>
      <build>
        <plugins>
          <plugin>
            <artifactId>maven-shade-plugin</artifactId>
            <executions>
              <execution>
                <phase>none</phase>
              </execution>
            </executions>
          </plugin>
        </plugins>
      </build>
    </profile>
  </profiles>
  <repositories>
    <repository>
      <id>sonatype-nexus-snapshots</id>
      <name>Sonatype Nexus Snapshots</name>
      <url>http://oss.sonatype.org/content/repositories/snapshots</url>
    </repository>
  </repositories>
  <dependencies>
    <dependency>
      <groupId>io.dropwizard</groupId>
      <artifactId>dropwizard-testing</artifactId>
      <version>1.2.0-SNAPSHOT</version>
      <scope>test</scope>
      <exclusions>
        <exclusion>
          <artifactId>junit</artifactId>
          <groupId>junit</groupId>
        </exclusion>
        <exclusion>
          <artifactId>objenesis</artifactId>
          <groupId>org.objenesis</groupId>
        </exclusion>
        <exclusion>
          <artifactId>assertj-core</artifactId>
          <groupId>org.assertj</groupId>
        </exclusion>
      </exclusions>
    </dependency>
    <dependency>
      <groupId>org.mockito</groupId>
      <artifactId>mockito-core</artifactId>
      <version>2.8.9</version>
      <scope>test</scope>
      <exclusions>
        <exclusion>
          <artifactId>byte-buddy</artifactId>
          <groupId>net.bytebuddy</groupId>
        </exclusion>
        <exclusion>
          <artifactId>byte-buddy-agent</artifactId>
          <groupId>net.bytebuddy</groupId>
        </exclusion>
        <exclusion>
          <artifactId>objenesis</artifactId>
          <groupId>org.objenesis</groupId>
        </exclusion>
      </exclusions>
    </dependency>
    <dependency>
      <groupId>org.glassfish.jersey.test-framework.providers</groupId>
      <artifactId>jersey-test-framework-provider-inmemory</artifactId>
      <version>2.25.1</version>
      <scope>test</scope>
      <exclusions>
        <exclusion>
          <artifactId>javax.servlet-api</artifactId>
          <groupId>javax.servlet</groupId>
        </exclusion>
        <exclusion>
          <artifactId>junit</artifactId>
          <groupId>junit</groupId>
        </exclusion>
        <exclusion>
          <artifactId>jersey-test-framework-core</artifactId>
          <groupId>org.glassfish.jersey.test-framework</groupId>
        </exclusion>
      </exclusions>
    </dependency>
    <dependency>
      <groupId>org.glassfish.jersey.test-framework.providers</groupId>
      <artifactId>jersey-test-framework-provider-grizzly2</artifactId>
      <version>2.25.1</version>
      <scope>test</scope>
      <exclusions>
        <exclusion>
          <artifactId>javax.servlet-api</artifactId>
          <groupId>javax.servlet</groupId>
        </exclusion>
        <exclusion>
          <artifactId>junit</artifactId>
          <groupId>junit</groupId>
        </exclusion>
        <exclusion>
          <artifactId>jersey-container-grizzly2-http</artifactId>
          <groupId>org.glassfish.jersey.containers</groupId>
        </exclusion>
        <exclusion>
          <artifactId>jersey-container-grizzly2-servlet</artifactId>
          <groupId>org.glassfish.jersey.containers</groupId>
        </exclusion>
        <exclusion>
          <artifactId>jersey-test-framework-core</artifactId>
          <groupId>org.glassfish.jersey.test-framework</groupId>
        </exclusion>
      </exclusions>
    </dependency>
  </dependencies>
  <dependencyManagement>
    <dependencies>
      <dependency>
        <groupId>io.dropwizard</groupId>
        <artifactId>dropwizard-bom</artifactId>
        <version>1.2.0-SNAPSHOT</version>
        <type>pom</type>
        <scope>import</scope>
      </dependency>
    </dependencies>
  </dependencyManagement>
  <properties>
    <swagger-core-version>1.5.12</swagger-core-version>
    <spec-file>${r"${swagger-spec-temp-dir}"}/api.yaml</spec-file>
    <swagger-spec-temp-dir>${r"${project.build.directory}"}</swagger-spec-temp-dir>
    <maven.compiler.target>1.8</maven.compiler.target>
    <gson-version>2.6.2</gson-version>
    <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <okhttp-version>2.7.5</okhttp-version>
    <maven.compiler.source>1.8</maven.compiler.source>
  </properties>
</project>

