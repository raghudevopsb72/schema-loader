if [ "$SCHEMA_TYPE" == "mongo" ]; then

echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=0
enabled=1' >/etc/yum.repos.d/mongo.repo

yum install mongodb-org-shell git -y

git clone https://github.com/raghudevopsb72/${COMPONENT}
cd $COMPONENT

curl -L -O https://truststore.pki.rds.amazonaws.com/us-east-1/us-east-1-bundle.pem rds-combined-ca-bundle.pem
mongo --ssl --host ${DOCDB_ENDPOINT}:27017 --sslCAFile rds-combined-ca-bundle.pem --username ${DOCDB_USER} --password ${DOCDB_PASS} <schema/${COMPONENT}.js

fi

if [ "$SCHEMA_TYPE" == "mysql" ]; then
echo

fi


