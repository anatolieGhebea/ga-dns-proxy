cert_update:
	sudo docker run -it --rm --name certbot \
		-v "/etc/letsencrypt:/etc/letsencrypt" \
		certbot/certbot certonly \
		--webroot --webroot-path=/var/www/html \
		--email=dev@anatolieghebea.com --agree-tos --force-renewal -d ga-dns.com
