* install
 ./rbenv_install.sh
 bundle install
 vi config/webistrano_config.rb
 vi config/database.yml
 db:migrate

* run script
 vi webistrano.sh

* logrotate
(/etc/logrotate.d/unicorn)

/home/webistrano/webistrano/log/*.log {
    daily
    missingok
    rotate 14
    compress
    delaycompress
    notifempty
    create 0644 xxxxxxxxxx xxxxxxxxxx
    sharedscripts
    postrotate
        [ ! -f /home/xxxxxxxxxxxxxxx/webistrano/tmp/pids/unicorn.pid ] || kill -HUP `cat /home/xxxxxxxxxxxxxxxxx/webistrano/tmp/pids/unicorn.pid`
    endscript
}


* apache
<VirtualHost *:443>
    ServerName hoge.example.com
    ProxyRequests Off
    <Proxy *>
    </Proxy>
    ProxyPass / http://127.0.0.1:8080/
    ProxyPassReverse / http://127.0.0.1:8080/
    SSLEngine on
    SSLCertificateFile /etc/apache2/ssl/2013/server.crt
    SSLCertificateKeyFile /etc/apache2/ssl/2013/server.key
    SSLCACertificateFile /etc/apache2/ssl/2013/cacert.crt
</VirtualHost>
