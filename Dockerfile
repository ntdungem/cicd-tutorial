FROM ubuntu:latest
MAINTAINER Tuan Thai "tuanthai@example.com"

# Cập nhật hệ thống và cài đặt các gói cần thiết
RUN apt update -y && apt install -y python3-pip python3-dev python3-venv build-essential

# Tạo môi trường ảo và kích hoạt nó
WORKDIR /flask_app
RUN python3 -m venv venv
RUN . venv/bin/activate

# Sao chép mã nguồn và cài đặt các yêu cầu
ADD . /flask_app
RUN venv/bin/pip install --upgrade pip
RUN venv/bin/pip install -r requirements.txt

# Đặt môi trường ảo vào ENTRYPOINT để luôn sử dụng nó khi chạy container
ENTRYPOINT ["venv/bin/python"]
CMD ["flask_docker.py"]
