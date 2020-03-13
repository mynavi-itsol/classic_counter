install:
	apt install apache2
	install -d /var/www/classic-counter.hirosuzuki.net
	install -d /var/www/classic-counter.hirosuzuki.net/html
	install -d /var/www/classic-counter.hirosuzuki.net/html/cgi-bin
	install -d /var/www/classic-counter.hirosuzuki.net/data
	install -m 755 counter.cgi /var/www/classic-counter.hirosuzuki.net/html/cgi-bin/counter.cgi
	install -m 644 index.html /var/www/classic-counter.hirosuzuki.net/html/index.html
	touch /var/www/classic-counter.hirosuzuki.net/data/counter.dat
	chown www-data:www-data /var/www/classic-counter.hirosuzuki.net/data/counter.dat
	install -m 644 classic-counter.hirosuzuki.net.conf /etc/apache2/sites-enabled/
	mv /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf_bk 
	a2enmod cgi
	apachectl configtest 
	apachectl stop
	apachectl start

restart:
	apachectl configtest
	apachectl restart
