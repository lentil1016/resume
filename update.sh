pushd /var/www/html/resume.lentil1016.cn/user
	rm -rf pages config
	git clone https://github.com/Lentil1016/resume.git
	mv resume/pages pages
	mv resume/config config
	rm -rf resume
popd

