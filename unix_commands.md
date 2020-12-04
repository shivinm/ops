### Useful Unix commands

##### 1. Search a string on every file matching the find

```
$ find . -name "filename.pdf" | while read line; do echo $line; strings $line | grep -si search_string; done
```

##### 2. sar commands
https://www.thegeekstuff.com/2011/03/sar-examples/
https://docs.oracle.com/cd/E19455-01/805-7229/6j6q8svhc/index.html
```
$ sar -q (CPU load)
$ sar -u (All CPU usage)
$ sar -r (Memory usage)
$ sar -n (Network stats)
$ sar -d (Device I/O)
$ sar -b (Overall system I/O)
$ sar -W (Paging)
$ sar -f /var/log/sysstat/sa03 (with sar log)
```

##### 3. Passwordless ssh setup
Add public key on client to the authorized keys file on the remote server

Location of public key on client
```
$ ~/.ssh/id_rsa.pub
```

Location of auth keys file on server
```
$ ~/.ssh/authorized_keys
```

##### 4. Check CPU cores
```
$ lscpu | grep -E '^Thread|^Core|^Socket|^CPU\('
```

##### 5. Top 10 processes taking most of memory
```
$ ps aux --sort=-%mem | head -n 10
```

##### 6. Monitor HTTP request/response using tshark
```
$ tshark tcp port 80  -o "ssl.keylog_file: sslkeys.txt" -Y ssl -T fields -e frame.time -e tcp.stream -e http.request.method -e http.request.uri -e http.response.code
```

##### 7. Print space taken by files/sub-folders & total space
```
$ du -cksh *
```

##### 8. Split file by number of lines
``` 
$ split -l 10 file.txt file.txt.
```
