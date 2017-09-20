ACCESS_KEY=$(aws ssm get-parameters --region us-east-1 --names minifiS3AccessKey --with-decryption --query Parameters[0].Value | sed -e 's/^"//' -e 's/"$//')
SECRET_KEY=$(aws ssm get-parameters --region us-east-1 --names minifiS3SecretKey --with-decryption --query Parameters[0].Value | sed -e 's/^"//' -e 's/"$//')
cat << EOF > s3.credentials
accessKey = ${ACCESS_KEY}
secretKey = ${SECRET_KEY}
EOF

minifiVersion="0.2.0"
docker run -d --restart=always -v log:/logs -v $(pwd)/nifi-aws-nar-1.2.0.nar:/opt/minifi/minifi-${minifiVersion}/lib/nifi-aws-nar-1.2.0.nar -v $(pwd)/s3.credentials:/opt/minifi/s3.credentials -v $(pwd)/config.yml:/opt/minifi/minifi-${minifiVersion}/conf/config.yml apacheminifi:${minifiVersion}
