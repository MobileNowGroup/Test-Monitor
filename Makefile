build:
	docker build -t registry.cn-hangzhou.aliyuncs.com/mobilenow/test-monitor:${tag} . && docker push registry.cn-hangzhou.aliyuncs.com/mobilenow/test-monitor:${tag};
