#!/bin/bash

# Chuyển đến thư mục /u01/deployments
cd /u01/deployments || { echo "Thư mục /u01/deployments không tồn tại!"; exit 1; }

# Hỏi người dùng có muốn up container không
read -p "Bạn có muốn up 1 container không? (yes/no): " up_choice
if [[ $up_choice == "yes" ]]; then
    read -p "Nhập vào service (hoặc gõ 'no' để bỏ qua): " service_up
    if [[ $service_up == "no" ]]; then
        echo "Bỏ qua up container."
    else
        docker-compose up -d "$service_up"
        exit 0
    fi
fi

# Hỏi người dùng có muốn down container không
read -p "Bạn có muốn down 1 container không? (yes/no): " down_choice
if [[ $down_choice == "yes" ]]; then
    read -p "Nhập vào service (hoặc gõ 'no' để bỏ qua): " service_down
    if [[ $service_down == "no" ]]; then
        echo "Bỏ qua down container."
    else
        docker-compose down "$service_down"
        exit 0
    fi
fi

# Hỏi người dùng muốn start, stop, hay restart container
read -p "Bạn muốn start, stop hay restart 1 container? (start/stop/restart): " action_choice
case $action_choice in
    start)
        read -p "Nhập tên container để start: " container_name
        docker start "$container_name"
        ;;
    stop)
        read -p "Nhập tên container để stop: " container_name
        docker stop "$container_name"
        ;;
    restart)
        read -p "Nhập tên container để restart: " container_name
        docker restart "$container_name"
        ;;
    *)
        echo "Lựa chọn không hợp lệ!"
        ;;
esac
