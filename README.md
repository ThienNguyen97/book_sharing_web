# HƯỚNG DẪN CÀI ĐẶT 
#    1. Cài đặt môi trường
# Ứng dụng được cài đặt và chạy trên môi trường Ubuntu bản 18.04
#    • Cài đặt Ruby:
# Cài đặt Ruby phiên bản 2.5.5 từ https://www.ruby-lang.org/vi/downloads/
# Hoặc tiến hành cài đặt trên ubuntu sử dụng teminal như sau: 
#    • Sudo apt update
#    • Sudo apt install ruby 2.5.5 -full
#    • Sau đó, gõ y và enter để cài đặt.
#    • Kiểm tra version tải về bằng lệnh: ruby -v 

#    • Cài đặt Framework Ruby on Rails:
# Sử dụng teminal cài đặt Framework Ruby on Rails theo câu lệnh sau:
#    • gem install rails -v 5.2.4
# Kết thúc quá trình kiểm tra phiên bản cài đặt bằng lệnh: 
#    • rails  -v



#    2. Cách chạy chương trình trên localhost
# Giải nén source code và tiến hành cài đặt.
# Bật teminal và truy cập vào thư mục chương trình:
# Chạy các gem file trong chương trình bằng lệnh:
#    • bundle install/ bundel update

# Kết nối với cơ sở dữ liệu ta chú ý vào file config/database.yml:

# Tạo mysql database và gán quyền phù hợp.
# mysql -u root -p


# Kiểm tra lại kết nối: 
# mysql -u ten_database -p


# Nếu thành công tiến hành chỉnh sửa file database.yml theo user_name va password.


# Bundle install lại và chạy lệnh: rails db:create
# Tạo các bảng cơ sở dữ liệu theo lệnh:
#    • rails db:migrate

# Tạo dữ liệu giả để chạy thử chương trình với lệnh :
#    • rails db:seed

# Chạy thử chương trình bằng lệnh:
#    • rails s
# Truy cập localhost:3000/ trên trình duyệt để truy cập vào hệ thống.

# Ngoài ra, ứng dụng cũng đang được deploy trên địa chỉ hedspiweb.herokuapp.com 
