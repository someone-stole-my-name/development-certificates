# development-certificates

**CA.key password is 1234**

### Example
```
./genCert.sh "*.mongo-rs1.local"

Country Name (2 letter code) [AU]:ES
State or Province Name (full name) [Some-State]:Madrid
Locality Name (eg, city) []:Madrid
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Development
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []:Christian Segundo
Email Address []:
```
```
openssl x509 -in \*.mongo-rs1.local.crt -text -noout 
Certificate:
    Data:
        Version: 3 (0x2)
        ...
        Issuer: C = ES, ST = Madrid, L = Madrid, O = Develop, CN = Christian Segundo
        ...
        X509v3 extensions:
            ...
            X509v3 Extended Key Usage: 
                TLS Web Server Authentication, TLS Web Client Authentication
            Netscape Comment: 
                OpenSSL Generated Development Certificate
            X509v3 Subject Alternative Name: 
                DNS:*.mongo-rs1.local
        ...
```
