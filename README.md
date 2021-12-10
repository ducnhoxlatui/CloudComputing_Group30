# Đề tài: Xây dụng hệ thống Cloud mô phỏng trang đăng ký môn học có thể tự scale up, scale down
Danh sách thành viên:
1. Huỳnh Đức Tòng - 19110481
2. Nguyễn Minh Đức - 19110351
3. Tạ Quốc Anh - 19110323
## 1. Mục đích của đề tài
Hiện nay đối với tất cả các trường đại học, việc đăng ký môn học của sinh viên là vấn đề cực kì quan trọng, nhưng ở một số trường, hệ thống đăng ký môn học cho sinh viên chưa được thiết kế một cách tối ưu dẫn đến tình trạng sinh viên gặp khó khăn mỗi khi đến đợt đăng ký môn học, có thể gây ra nhiều ảnh hưởng tới việc ra trường đúng hạn và kế hoạch học tập của sinh viên. Từ hiện trạng đó, việc cải thiện chất lượng của hệ thống đăng ký môn học là rất cấp thiết, đề tài xây dụng hệ thống cloud mô phỏng trang đăng ký môn học có thể tự scale up, scale down được nhóm lựa chọn để thực hiện hoá việc cải thiện chất lượng của hệ thống.
## 2. Công cụ sử dụng cho dự án là các dịch vụ trong AWS:
* VPC (Virtual Private Cloud): Để kiểm soát môi trường đám mây và các tài nguyên.
* EC2 (Elastic Compute Cloud): Dùng để làm Web Server cho ứng dụng.
* RDS (Relational Database Service): Thiết lập và kết nối cơ sở dữ liệu
* S3 (Simple Storage Service): Lữu trữ các tập tin của ứng dụng.
* ELB (Elastic Load Balancer): Phân bổ lưu lượng truy cập trên nhiều máy khác nhau.
* ASGs (Auto Scaling Group): Duy trì số lượng các máy Server ở trạng thái cân bằng, tránh bị dư thừa hoặc thiếu.
## 3. Ứng dụng web của đề tài (Spring Boot Application)
Ứng dụng được viết bằng java Spring Boot, kích thước vừa đủ để mô tả một trang đăng ký môn học cho sinh viên.
Dùng lệnh `maven install` để build thành gói jar và sử dụng ở nhiều nơi
## 4. Gợi ý các bước để tạo ra mô hình ELB và ASGs
* Bước 1: Tạo VPC và các Subnet cùng với Security Group sao cho tất cả các tài nguyên phải nằm trên cùng 1 zone và có thể truy cập vào các tài nguyên khác.
* Bước 2: Tạo database mới để dùng cho ứng dụng Spring Boot (tham khảo database [Data Script](https://textsaver.flap.tv/lists/4hu6) - Aurora/MySQL)
* Bước 3: Tạo một bucket S3 và lưu file đã build của ứng dụng.
* Bước 4: Tạo một EC2 instance (Amazon Linux 2), thêm [user data](https://textsaver.flap.tv/lists/4hu8)(chú ý: thay dòng lệnh `wget ...` với link của file trên S3 đã tạo)
* Bước 5: Cài đặt ELB và register sẵn EC2 đã tạo vào target group.
* Bước 6: Tạo Auto Scaling Group, sử dụng ELB là ELB đã tạo trước đó và thay đổi các policy sao cho phù hợp.
### Lưu ý các thành phần đã tạo phải được đặt trong đúng VPC, Subnet và Security Group để có thể hoạt động một cách hiệu quả.
