yum install -y epel-release
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum install -y \
	php56w-common \
	php56w-mysqlnd \
	php56w-xml \
	php56w-pdo \
	php56w \
	php56w-gd \
	php56w-cli \
	php56w-mbstring \
	git httpd
systemctl restart httpd

git clone https://github.com/Lentil1016/grav.git
pushd grav
	./bin/grav install
	pushd user
		rm -rf pages config
		git clone https://github.com/Lentil1016/resume.git
		mv resume/pages pages
		mv resume/config config
		rm -rf resume
		pushd themes
			git clone https://github.com/Lentil1016/zresume.git
		popd
	popd
	curl https://github.com/Lentil1016 | awk '/<svg.+class="js-calendar-graph-svg"/,/svg>/' | sed -e 's|<svg|<svg xmlns="http://www.w3.org/2000/svg" style="font-size: 7pt"|' > github.svg
popd
echo "0 6 * * * curl https://github.com/Lentil1016 | awk '/<svg.+class=\"js-calendar-graph-svg\"/,/svg>/' | sed -e 's|<svg|<svg xmlns=\"http://www.w3.org/2000/svg\" style=\"font-size: 7pt\"|' > /var/www/html/resume.lentil1016.cn/github.svg"

