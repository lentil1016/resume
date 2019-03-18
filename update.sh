pushd /var/www/html/resume.lentil1016.cn/print/user
	git clone https://github.com/Lentil1016/resume.git
	rm -rf pages config
	mv resume/pages pages
	mv resume/config config
	rm -rf resume
popd

