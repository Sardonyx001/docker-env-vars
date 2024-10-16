FROM busybox:latest

ENV PI=3.14

CMD [ "sh" , "-c", "echo $PI"]
