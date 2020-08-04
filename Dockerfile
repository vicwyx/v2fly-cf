FROM alpine

ENV CONFIG=https://gist.githubusercontent.com/vicwyx/2ff54f8e02db6faa13ad3e0caff9dae7/raw/515135aca74315ccea9eab94a71e715efa4652c3/config.json

RUN apk update && apk --no-cache add ca-certificates unzip && \
    wget -c https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray-linux-64.zip && rm -f v2ray-linux-64.zip && \
    chmod 700 v2ray v2ctl
    
CMD ./v2ray -config $CONFIG
