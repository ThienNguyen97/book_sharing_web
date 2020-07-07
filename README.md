HƯỚNG DẪN CÀI ĐẶT 
    1. Cài đặt môi trường
Ứng dụng được cài đặt và chạy trên môi trường Ubuntu bản 18.04
    • Cài đặt Ruby:
Cài đặt Ruby phiên bản 2.5.5 từ https://www.ruby-lang.org/vi/downloads/
Hoặc tiến hành cài đặt trên ubuntu sử dụng teminal như sau: 
    • Sudo apt update
    • Sudo apt install ruby 2.5.5 -full
    • Sau đó, gõ y và enter để cài đặt.
    • Kiểm tra version tải về bằng lệnh: ruby -v 

Hình 1: Phiên bản Ruby sử dụng
    • Cài đặt Framework Ruby on Rails:
Sử dụng teminal cài đặt Framework Ruby on Rails theo câu lệnh sau:
    • gem install rails -v 5.2.4
Kết thúc quá trình kiểm tra phiên bản cài đặt bằng lệnh: 
    • rails  -v

Hình 2: Phiên bản Ruby on Rails đang sử dụng

    2. Cách chạy chương trình trên localhost
Giải nén source code và tiến hành cài đặt.
Bật teminal và truy cập vào thư mục chương trình:
Chạy các gem file trong chương trình bằng lệnh:
    • bundle install/ bundel update

Hình 3: Mô tả lệnh chạy các gem file.
Kết nối với cơ sở dữ liệu ta chú ý vào file config/database.yml:

Hình 4: Cấu hình file database.yml
Tạo mysql database và gán quyền phù hợp. Ví dụ như hình sau:

Hình 5: Cấu hình mysql database.
Kiểm tra lại kết nối: 

Hình 6: Câu lệnh kiểm tra kết nối database.
Nếu thành công tiến hành chỉnh sửa file database.yml như sau:

Hình 7: Cấu hình lại file database.yml.
Bundle install lại và chạy lệnh: rails db:create
Tạo các bảng cơ sở dữ liệu theo lệnh:
    • rails db:migrate

Hình 8: Mô tả lệnh tạo cơ sở dữ liệu.
Tạo dữ liệu giả để chạy thử chương trình với lệnh :
    • rails db:seed

Hình 9: Mô tả lệnh tạo dữ liệu giả.
Chạy thử chương trình bằng lệnh:
    • rails s
Truy cập localhost:3000/ trên trình duyệt để truy cập vào hệ thống.

Hình 10: Mô tả lệnh chạy thử trên trình duyệt.
Ngoài ra, ứng dụng cũng đang được deploy trên địa chỉ hedspiweb.herokuapp.com 
