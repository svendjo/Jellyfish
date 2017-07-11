#!/bin/bash
set -e

if [[ $(uname -a | grep -ci darwin) > 0 ]]; then
  echo "This script requires non-standard tools on OS X."
  echo "To install the tools, run the commands:"

  if [[ ! -f /usr/local/bin/rename ]]; then
    echo "  brew install rename"
    exit 1
  fi

  if [[ ! -f /usr/local/bin/sed ]]; then
    echo "  brew install --default-names gnu-sed"
    exit 1
  fi
fi

function process() {
  PRJ=$1 # The input project
  OUT=$2 # Where to write the output to

  echo "Starting $PRJ"

  if [ ! -d "$PRJ" ]; then
    echo "The path does not exist: $PRJ"
    exit 1
  fi

  echo "  Removing existing template"
  rm -rf $OUT
  echo "  Copying base project"
  mkdir -p $OUT
  cp -r $PRJ $OUT

  echo "  Removing useless files"
  rm -rf "$OUT/.classpath"
  rm -rf "$OUT/.project"
  rm -rf "$OUT/.settings"
  rm -rf "$OUT/bin"
  rm -rf "$OUT/lib"
  rm -rf "$OUT/target"
  rm -rf "$OUT/abandoned"

  (
    cd $OUT

    echo "  Escaping things that would resolve to a Freemarker template variable"
    # This will replaces strings that look like this: ${xxx} with this ${r"${xxx}"}. That's how escaping works in
    # Freemarker
    find . -type f -exec sed -i 's/\${x*}/${r"\0"}/g' {} +

    echo "  Updating references to jellyfish-engine"
    find . -type f -exec sed -i 's/jellyfish-engine/${service_name}/g' {} +

    echo "  Replacing all 'EchoService' formats with variables"
    # Replace echo-example-service before echo-example due to prefix conflict
    find . -type f \
      -exec sed -i 's/EchoExampleService/${ServiceName}/g' {} + \
      -exec sed -i 's/echoExampleService/${serviceName}/g' {} + \
      -exec sed -i 's/echo-example-service/${service_name}/g' {} + \
      -exec sed -i 's/echo_example_service/${SERVICE_NAME}/g' {} +;

    find . -type f \
      -exec sed -i 's/EchoExample/${Service}/g' {} + \
      -exec sed -i 's/echo-example/${service}/g' {} + \
      -exec sed -i 's/echo_example/${SERVICE}/g' {} + \
      -exec sed -i 's/com.example.app/${package}/g' {} +;

    # Rename files after all formats have been replaced with variables
    find . -type f \
      -exec rename 's/EchoExampleService/\+=ServiceName=/' '{}' +;

    echo "  Renaming files with 'echo example' to variables"
    find . -type d \
      -exec rename 's/echo-example-service/\+=service_name=/' '{}' +;

    find . -type f \
      -exec rename 's/EchoExampleService/\+=ServiceName=/' '{}' + \
      -exec rename 's/echo-example-service/\+=service_name=/' '{}' +;

    find . -type f \
      -exec rename 's/EchoExample/\+=Service=/' '{}' + \
      -exec rename 's/echo-example/\+=service=/' '{}' +;

    echo "  Renaming all files to end with .ftl extension"
    find . -type f -exec mv '{}' '{}'.ftl \;

    echo "  Renaming Java package directory to template variable"
    [ -d 'src/main/java/com/example/app' ] && mv 'src/main/java/com/example/app' 'src/main/java/+=package_dir='
    [ -d 'src/test/java/com/example/app' ] && mv 'src/test/java/com/example/app' 'src/test/java/+=package_dir='

    echo "  Cleaning up"
    rm -rf src/main/java/com
    rm -rf src/test/java/com
    rm -rf target
  )

  echo "  Done with converting $PRJ to $OUT"
}

process "echo-example-service/." "jelly-templates/templates/starfish-service"
process "echo-example-service-spec/." "jelly-templates/templates/starfish-service-spec"
