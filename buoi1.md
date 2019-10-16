# Buổi 1

# Bài tập về nhà
    1. 1, Cho bán kính hình cầu, tính và in ra diện tích, thể tích của hình cầu đó.
	Hướng dẫn: S = 4πR 2 và V = (4/3)πR 3

    2, Tính tổng bình phương 2 số a, b (a, b nhập từ bàn phím).

    3*, Viết chương trình nhập vào số nguyên n. Hỏi: 
	- n là số nguyên dương hay không? 
	- n có phải là số chẵn hay không? 
	- n có chia hết cho 5 hay không?
	- n có phải là số nguyên tố hay không?

    4*, Cho 2 số a và b, kiểm tra xem a có chia hết cho b không?
    
    5*, Tìm giá trị lớn nhất của 2 số

    6*, Giải phương trình bậc nhất
    
## Lưu ý
    - Các bài có gắn dấu * có sử dụng kiến thức if ... else, 
    - Cú pháp và ví dụ đã có trong slide SwiftBasic.pdf, mọi người đọc và làm

# Yêu cầu
    - Bài tập đẩy lên Github, gửi link bài tập qua Mail
    - Cú pháp gửi bài:
        [BTVN-01] + Họ tên người gửi + lớp di động 3
    - Gửi bài tập vào mail: quynh@techmaster.vn, cc mail cho thầy cuong@techmaster.vn
    - Khuyến khích viết README.md mô tả repository của mình

## Nội dung đã học
- Chạy Swift bằng RELP: Repeat Evaluation Print Loop (xử lý trả về kết quả khi người dùng gõ code từng dòng lệnh, chạy trong môi trường Swift từ terminal)
- Sử dụng một số câu lệnh linux căn bản: 
    - pwd: in vị trí thư mục đang làm việc
    - ls: liệt kê danh sách các file, thư mục con trong thư mục hiện tại
    - ls -la: liệt kê tất cả các file, thư mục con (kể cả file ẩn)
    - cd <tên_thư_mục>: cd vào thư mục con
    - cd .. : quay trở về thư mục trước
    - cd : trở về ~Home/
    - mkdir <tên_thư_mục>: tạo thư mục
    - touch <tên_file.đuôi_file>: tạo file
    - nano <tên_file.đuôi_file>: chỉnh sửa file (tạo mới nếu chưa có)
    - swift <tên_file.swift>: chạy file swift
    
- Học cú pháp Swift căn bản:
    - Khai báo biến, hằng số
    - Lệnh in ra màn hình, terminator
    - Nhập input từ bàn phím
    - Hàm
    
- Git:
    - Tạo tài khoản Git
    - Clone repo về máy
    - Đẩy thư mục lên Git
    
## Bài tập đã làm
    - In ra màn hình Hello World
    - Nhập dữ liệu chuỗi, số từ bàn phím
    - Tính tổng 2 số
    - Đổi nhiệt độ từ độ C sang độ F và ngược lại
    - Tính tiền điện 

```
import Foundation

// tính tổng 2 số
func tinhTong2So(a: Int, b: Int){
    print("\(a) + \(b) = \(a+b)")
}

// tính tiền điện
func tinhTienDien(soDien: Int, donGia: Float){
    print("Tiền tiền điện: \(soDien) x \(donGia) = \(Float(soDien) * donGia)")
}

// Float là kiểu dữ liệu số, nhưng mà là số thực (bao gồm số nguyên và số thập phân)
// Int là kiểu dữ liệu số, nhưng mà là số nguyên (không có phần thập phân)

// Bài tập
//Chuyển đổi nhiệt độ C sang F và ngược lại
//CT:
//°F  =  ( °C × 1.8 ) +  32
//°C  =  ( °F ─  32 )  ⁄  1.8
func doinhietdo(c: Float) -> Float{
    var t: Float = 0
    t = (c * 1.8) + 32
    print("Đổi từ \(c) C sang F: ")
    return t
}

func doinhietdo2(f: Float) -> Float{
    var h: Float = 0
    h = (f - 32) / 1.8
    print("Đổi từ \(f) F sang C: ")
    return h
}

func tinhBinhPhuong(a: Double) -> Double{
    return pow(a, 2)
}

```

## Mã nguồn
```
import Foundation

// khai báo biến
var name: String = "Anh" // var là từ khoá khai báo biến

// khai báo hằng số
let pi = 3.14 // let là từ khoá khai báo hằng số

print("name: \(name)") // print() là lệnh in ra màn hình console

print("số pi: \(pi)", terminator: " ") // terminator để loại bỏ dấu ngắt dòng
print("là số trong toán học")

// nhập một chuỗi từ bàn phím
let ten: String = readLine()!

// nhập một số nguyên từ bàn phím
let age: Int = Int(readLine()!)!

```
