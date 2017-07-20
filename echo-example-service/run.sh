#!/bin/bash

JAR="target/echo-example-service-*\.jar"
JAR_FILE=$(ls $JAR | grep -v "sources\.jar$" | grep -v "javadoc\.jar$" 2> /dev/null)
CMD="java -jar $JAR_FILE server example.yml"

printf "${GREEN}Executing $CMD${NC}"
$CMD

