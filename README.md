# Đề tài: Xây dụng hệ thống Cloud mô phỏng trang đăng ký môn học có thể tự scale up, scale down
Danh sách thành viên:
1. Huỳnh Đức Tòng - 19110481
2. Nguyễn Minh Đức - 19110351
3. Tạ Quốc Anh - 19110323
## Mục đích của đề tài
Hiện nay đối với tất cả các trường đại học, việc đăng ký môn học của sinh viên là vấn đề cực kì quan trọng, nhưng ở một số trường, hệ thống đăng ký môn học cho sinh viên chưa được thiết kế một cách tối ưu dẫn đến tình trạng sinh viên gặp khó khăn mỗi khi đến đợt đăng ký môn học, có thể gây ra nhiều ảnh hưởng tới việc ra trường đúng hạn và kế hoạch học tập của sinh viên. Từ hiện trạng đó, việc cải thiện chất lượng của hệ thống đăng ký môn học là rất cấp thiết, đề tài xây dụng hệ thống cloud mô phỏng trang đăng ký môn học có thể tự scale up, scale down được nhóm lựa chọn để thực hiện hoá việc cải thiện chất lượng của hệ thống.
## Công cụ sử dụng cho dự án là các dịch vụ trong AWS:
* VPC (Virtual Private Cloud)
* EC2 (Elastic Compute Cloud)
* RDS (Relational Database Service)
* S3 (Simple Storage Service)
* ELB (Elastic Load Balancer)
* ASGs (Auto Scaling Group)

## Ứng dụng web của đề tài (Spring Boot Application)
Ứng dụng được viết bằng java Spring Boot, kích thước vừa đủ để mô tả một trang đăng ký môn học cho sinh viên.
Dùng lệnh
## Mô hình của đề tài gồm:
* VPC: tạo trên zone us-east-1 với Security Group dành cho Web Server và Database
* EC2: dùng để chạy ứng dụng web trên server, nằm trong Security Group dành cho Web Server([user data](https://textsaver.flap.tv/lists/4htz) để khởi động web server, chú ý chỉ dùng instance Amazon Linux 2)
* RDS: dùng để làm DB, nằm trong Security Group dành cho DB ([DB Script](https://textsaver.flap.tv/lists/4hu1) dùng để tự động thêm data sau khi tạo database)
* S3: lưu trữ ứng dụng web: dùng `wget https://dkmhbucket.s3.amazonaws.com/dkmh-0.0.1-SNAPSHOT.jar` để tải gói .jar của ứng dụng về và sử dụng nếu cần
* ELB: cân bằng tải có các Web Server instance
* ASGs: tự động scale up hoặc scale down các instance


