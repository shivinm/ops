## Commands to manage SSL/TLS certificates

### PFX 

##### Print details in PFX certificate  
```
openssl pkcs12 -info -in filename.pfx
```

##### Export a PFX into PEM and Private Key
```
openssl pkcs12 -in filename.pfx -out cert_and_key.pem -nodes
```

##### Export PFX to a certificate only
```
openssl pkcs12 -in filename.pfx -clcerts -nokeys -out cert.pem
```

##### Export PFX to a key only
```
openssl pkcs12 -in filename.pfx -nocerts -out key.pem
```

##### Details on The Certificate
```
openssl x509 -in cert.pem -text -noout
```

##### Details on the Key
```
openssl rsa -in key.pem -text -noout
openssl rsa -check -in key.pem -noout
```

### Java Keystore

##### List certificates
```
keytool -list -v -keystore keystore.jks
```

##### Import PFX to a temp keystore and then into Java Keystore
```
keytool -v -importkeystore -srckeystore <.pfx file> -srcstoretype PKCS12 -destkeystore tempkeystore -deststoretype JKS
keytool -importkeystore -srckeystore tempkeystore -destkeystore keystore.jks
```

##### Change Certificate Private Key password 
The certificate's private key password must match the keystore password for the certificate to work

```
$ keytool -keypasswd  -alias <certificate-alias> -keystore keystore.jks
Enter keystore password:                                              // Enter Java Keystore password
Enter key password for <certficate-alias>                             // Enter password provided by the certificate issuer
New key password for <certficate-alias> :                             // This password should match the Java Keystore password
Re-enter new key password for <certficate-alias> :
```

##### Change certificate alias
```
keytool -changealias -alias <alias> -destalias <new_alias> -keystore keystore.jks
```

##### Export a Keystore certificate to PEM file 
This step is usally done to add intermediate/root certificates to pem to create a chain of end-user -> intermediate -> root cert  
```
keytool -exportcert -rfc -file servercert.pem -keystore keystore.jks -alias domain1_certificate
```

##### Import a PEM file into Keystore
```
keytool -importcert -keystore keystore.jks -alias domain1_certificate -file bundle.pem
```

##### Delete a certificate from Keystore
```
keytool -delete -alias <alias> -keystore keystore.jks
```

### Certificate Queries
- Show server/end-user certificate
```
openssl s_client -connect api.xyz.com:443
```

- List all ccertificates (server / intermediate / root) 
```
openssl s_client -showcerts -connect  api.xyz.com:443
```

- Show certificate expiration date
```
echo | openssl s_client -connect api.xyz.com:443 2>/dev/null | openssl x509 -noout -dates
```

- Show SNI certificate 
```
openssl s_client -connect  api.xyz.com:443 -servername <abc.domain.com>
```

- Show SNI certificate expiration date
```
echo | openssl s_client -servername <abc.domain.com> -connect api.xyz.com:443 2>/dev/null | openssl x509 -noout -dates
```

### Helpful links

- https://security.stackexchange.com/a/29428
