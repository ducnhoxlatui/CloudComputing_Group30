# Đề tài: Xây dụng hệ thống Cloud mô phỏng trang đăng ký môn học có thể tự scale up, scale down
Danh sách thành viên:
1. Huỳnh Đức Tòng - 19110481
2. Nguyễn Minh Đức - 19110351
3. Tạ Quốc Anh - 19110323
## Mục đích của đề tài
Hiện nay đối với tất cả các trường đại học, việc đăng ký môn học của sinh viên là vấn đề cực kì quan trọng, nhưng ở một số trường, hệ thống đăng ký môn học cho sinh viên chưa được thiết kế một cách tối ưu dẫn đến tình trạng sinh viên gặp khó khăn mỗi khi đến đợt đăng ký môn học, có thể gây ra nhiều ảnh hưởng tới việc ra trường đúng hạn và kế hoạch học tập của sinh viên. Từ hiện trạng đó, việc cải thiện chất lượng của hệ thống đăng ký môn học là rất cấp thiết, đề tài xây dụng hệ thống cloud mô phỏng trang đăng ký môn học có thể tự scale up, scale down được nhóm lựa chọn để thực hiện hoá việc cải thiện chất lượng của hệ thống.
## Công cụ sử dụng cho dự án là các dịch vụ trong AWS:
* VPC
* EC2
* RDS
* S3
* Elastic Load Balancer
* Auto Scaling Group
## Mô hình của đề tài gồm:
* VPC (us-east-1): 
** Sử dụng để tạo ra cloud riêng cho ứng dụng
** Gồm 2 Public Subnet (dùng cho Web Server) và 2 Private Subnet (dùng cho DB) nằm trên 2 zone khác nhau (us-east-1a và us-east-1a)

