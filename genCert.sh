#!/bin/sh

if [ "$#" -ne 1 ]
then
  echo "Example: ./genCert.sh \"*.mongo-rs1.local\""
  exit 1
fi

DOMAIN=$1

openssl genrsa -out $DOMAIN.key 2048
openssl req -new -key $DOMAIN.key -out $DOMAIN.csr

cat > $DOMAIN.ext << EOF
authorityKeyIdentifier = keyid,issuer
basicConstraints = CA:FALSE
extendedKeyUsage = serverAuth, clientAuth
nsComment = "OpenSSL Generated Development Certificate"
subjectAltName = @alt_names
[alt_names]
DNS.1 = $DOMAIN
EOF

openssl x509 -req -in $DOMAIN.csr -CA CA.pem -CAkey CA.key -CAcreateserial \
-out $DOMAIN.crt -days 99999 -sha256 -extfile $DOMAIN.ext

rm -rf $DOMAIN.ext $DOMAIN.csr
