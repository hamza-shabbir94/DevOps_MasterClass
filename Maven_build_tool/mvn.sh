brew install mvn

# it will download the basic template,plugin and dependencies
mvn archetype:generate

# stages in mvn
mvn validate
mvn compile
mvn test
mvn package
mvn clean

mvn install
mvn deploy
