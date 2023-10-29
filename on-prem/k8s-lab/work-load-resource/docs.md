# Hello ban

## Các loại workload resource trong Kubernetes
- Workload Resource là các đối tượng được sử dụng để quản lý các Pod và định nghĩa cách Pod được triển khai
- Các Workload phổ biến trong Kubernetes bao gồm:
    - Replica Controller
    - ReplicaSet
    - Deployment
    - StatefullSet
    - DaemonSet
    - Job
    - CronJob
- Các workload được quản lý bởi c-m (Kubernetes Control Manager) được sử dụng để đảm bảo các Pod được chạy một cách chính xác
### 1. Replica Controller
- Sử dụng để quản lý số lượng replicas đang chạy của Pod, tạo hoặc xóa các Pod để đảm bảo số lượng luôn đúng với cấu hình của người quản trị
- Có khả năng tự phục hồi khi Pod xảy ra vấn đề và dừng hoạt động bằng cách tạo 1 Pod mới thay thế 
- Không hỗ trợ khả năng cập nhật số lượng Pod replicas hoặc scale-up hay scale-down
### 2. Replica Set
- Là bản nâng cấp của Replica Controller và có thêm một số tính năng mới
- Hỗ trợ khả năng cập nhật số lượng Pod replicas hoặc scale-up hay scale-down
- Sử dụng selector để quản lý các Pod replicas
![Replica Set](images/diffRCandRS.png)
### 3. Deployment
- Là bản nâng cấp của ReplicaSet, khi tạo Deployment thì đồng thời nó cũng sẽ tạo ra 1 ReplicaSet để đảm bảo số lượng Pod luôn đúng với người quản trị chỉ định
- Deployment quản lý các ReplicaSet, ReplicaSet thì quản lý các Pod
- Có thể quản lý được version của Pod
- Có thể Rollback version nếu Pod ở version mới xảy ra vấn đề
- Các tính năng cập nhật bản sao (rolling-update), giữa các phiên bản (rollbacks) và giảm thời gian gián đoạn (zero-downtime)
![Deployment](images/deployment.png)
**Deployment Stragy** trong Kubernetes là cách thức triển khai cập nhật các phiên bản mới của Pod trong Deployment
    - **Rolling Deployment** là một chiến lược triển khai ứng dụng trong Kubernetes, cho phép cập nhật phiên bản mới của ứng dụng theo cách **One by One**. Tức một Pod version cũ được xóa đi, sẽ có một Pod version mới được tạo ra. Vì thế **Rolling Deployment** giúp cho ứng dụng không bị downtime
    - **Recreate Deployment** là một chiến lược triển khai ứng dụng trong Kubernetes, trong đó tất cả các Pod sẽ được xóa đi và triển khai lại bằng các Pod mới. Vì thế, Application sẽ có một khoảng thời gian bị **downtime**. Nếu triển khai theo cách này ta nên chọn thời gian phù hợp để Update.
        - Được sử dụng trong trường hợp khi các tính năng của phiên bản mới khác hoàn toàn so với phiên bản cũ. Hiểu đơn giản là tại version cũ logic tính năng khác hoàn toàn so với version mới thì ta cần phải sử dụng **Recreate**
    - **Canary Deployment** là một chiến lược triển khai mà trong đó sẽ tạo ra một Pod version mới, thay vì chuyển toàn bộ traffic vào version mới, thì với phương pháp này sẽ chuyển **một phần traffic** để **đánh giá hiệu quả** của version mới. Sau quá trình đánh giá, nếu hiệu quả tốt có thể Rollout còn ngược lại có thể quay về version cũ
![canary deployment](images/canary-deployment.png)
4. HPA (Horizontal Pod Autoscaler)
- Cho phép tự động điều chỉnh số lượng Pod replica dựa trên lưu lượng sử dụng tài nguyên của ứng dụng.
- Nó có chức năng giám sát việc sử dụng tài nguyên hoặc lưu lượng của ứng dụng từ đó tự động tăng giảm số lượng Pod replica để phù hợp với nhu cầu giúp tiết kiệm tài nguyên một cách tối đa.
