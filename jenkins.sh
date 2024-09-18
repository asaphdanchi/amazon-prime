#!/bin/bash

# Clone or add your private Git repository
git clone https://your-private-repo-url
git checkout your-branch
# Change to the directory where the pom.xml file is located
cd /path/to/your/project

#Clean and package the Maven project
mvn clean package
