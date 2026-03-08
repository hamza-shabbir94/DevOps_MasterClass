
# CI/CD 
# Anatomy c of project build

# build app manually: Get the application on jenkins machine

git clone -b master https://github.com/anshulc55/Jenkins_Upgradev3.git
cd /root/Jenkins_Upgradev3/maven-samples/single-module
mvn --version
apt install maven
# now we bundle our application
https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html
mvn validate
mvn compile
# Test unit test
mvn test
mvn clean install

# Now we all put this jenkins with automation

# change workspace
Execute Shell > 
cd $WORKSPACE/maven-samples/single-module
pwd
mvn clean install

# this created a .jar file, Which deployable artifacts


# build Artifacts
# Post-build Actions -> Archive the artifacts
# use the location of .jar file from workspace

# configure Job to capture the test results
Post-build Actions -> Publish JUnit test result report
Example Location: maven-samples/single-module/target/surefire-reports/*.xml

# View Test Result Trends

# Abort Long Running Builds in Jenkins

# Common Build Triggers
1) Build Now
2) Configure > Triggers

# Configure Jenkins Job to Trigger by Poll SCM
2) Configure > Triggers > Poll SCM > Schedule # run like a crontab, but works/trigger only make when commit is made in Git repo

# Schedule Build Trigger in Jenkins
Configure > Triggers > Build periodically # Only use when you want to trigger job at specific time.