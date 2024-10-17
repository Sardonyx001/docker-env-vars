FROM busybox:latest

# 5. Set in a container image (lowest precedence)
ENV A="From Dockerfile"
ENV B="From Dockerfile"
ENV C="From Dockerfile"
ENV D="From Dockerfile"
ENV E="From Dockerfile"

CMD [ "sh", "-c", "env | grep '^[ABCDE]=' | sort" ]
