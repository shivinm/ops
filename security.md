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
