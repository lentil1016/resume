yum install -y epel-release
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum install -y php56w-common php56w-mysqlnd php56w-xml php56w-pdo php56w php56w-gd php56w-cli php56w-mbstring git httpd
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
popd

