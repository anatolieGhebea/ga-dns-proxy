cert_update:
	sudo docker run -it --rm --name certbot \
		-v "./letsencrypt:/etc/letsencrypt" \
		certbot/certbot certonly \
		--webroot --webroot-path=./nginx/www \
		--email=dev@anatolieghebea.com --agree-tos --force-renewal -d ga-dns.com

cert_update_ilvenerdi:
	sudo docker run -it --rm --name certbot \
		-v "./letsencrypt:/etc/letsencrypt" \
		certbot/certbot certonly \
		--webroot --webroot-path=./nginx/www \
		--email=dev@anatolieghebea.com --agree-tos --force-renewal -d ilvenerdi.ga-dns.com

cert_update_portainer:
	sudo docker run -it --rm --name certbot \
		-v "./letsencrypt:/etc/letsencrypt" \
		certbot/certbot certonly \
		--webroot --webroot-path=./nginx/www \
		--email=dev@anatolieghebea.com --agree-tos --force-renewal -d ptainer.ga-dns.com
