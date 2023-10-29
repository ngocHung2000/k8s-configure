#!/bin/bash
# services là thành phần cung cấp comunicate trong k8s
# Có nhiều loại service khác nhau: ClusterIP Service, NodePort Service, Loadbalancer Service, Headless Service, ExternalName Service

# 1. ClusterIP: Cung cấp 1 Virtual IP giúp các Pod trong cùng Cluster có thể giao tiếp đc với nhau và bên ngoài không thể truy cập đc (Internal IP). ClusterIP là service mặc định nếu không chỉ định
# 2. NodePort: Cho phép các Pod truy cập từ bên ngoài thông qua port của Node expose ra ngoài.
#    Range Port: 30000 - 32767
#    Không khuyến khích sử dụng trong production
#    Hỗ trợ Protocol: UDP, TCP
# 3. LoadBalancer: Phân phối Traffic vào các Pod trong một service 1 cách đồng đều
#    Phụ thuộc vào việc Cluster K8s có hỗ trợ LoadBalancer hay không. VD: AWS, GCP, Azure
# 4. Headless: Tạo ra 1 service này không có địa chỉ IP, Loadbalancing hoặc DNS. Thay vào đó, nó trả về list endpoint tương ứng (IP) với các Pod đc kết nối với service đó
#    Thường sử dụng khi các Pod cần truy cập trực tiếp vào Pod khác mà không muốn thông qua service
#    VD: Database MYSQL, POSTGRES trỏ trực tiếp tới IP của Pod không qua Service
# 5, ExternalName: cho phép trỏ tên DNS của Service tới một tên miền ngoài Cluster. Cho phép ứng dụng có thể truy cập các ứng dụng hoặc dịch vụ bên ngoài cluster

# Ingress: Quản lý một hoặc nhiều Service mà điều hướng truy cập đến các Service, thay vì phải gọi trực tiếp tới service
# Ingress thường được sử dụng để service có thể được gọi từ bên ngoài Cluster
# Ingress chỉ hỗ trợ HTTP và HTTPS
# Ingress Type: HAProxy, Nginx Ingress Controllerx


