FROM ubuntu:18.04

COPY * /root/workspace/

RUN apt update -y
RUN apt upgrade -y
RUN apt install make
RUN cd /root/workspace
RUN apt install apache2 -y
RUN apt install python3 -y
RUN install -d /var/www/classic-counter.hirosuzuki.net
RUN install -d /var/www/classic-counter.hirosuzuki.net/html
RUN install -d /var/www/classic-counter.hirosuzuki.net/html/cgi-bin
RUN install -d /var/www/classic-counter.hirosuzuki.net/data
RUN install -m 755 /root/workspace/counter.cgi /var/www/classic-counter.hirosuzuki.net/html/cgi-bin/counter.cgi
RUN install -m 644 /root/workspace/index.html /var/www/classic-counter.hirosuzuki.net/html/index.html
RUN touch /var/www/classic-counter.hirosuzuki.net/data/counter.dat
RUN chown www-data:www-data /var/www/classic-counter.hirosuzuki.net/data/counter.dat
RUN install -m 644 /root/workspace/classic-counter.hirosuzuki.net.conf /etc/apache2/sites-enabled/
RUN mv /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf_bk 
RUN a2enmod cgi
RUN apachectl configtest 
RUN apachectl stop