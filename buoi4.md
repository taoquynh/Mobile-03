
# Buổi 4

# Bài tập về nhà
1, Sắp xếp mảng số nguyên theo chiều tăng dần và giảm dần

2, Viết chương trình nhập vào một số nguyên dương không lớn hơn 10000, in ra màn hình chữ số lớn thứ nhì có trong số đó (ví dụ nhập n = 1356 in ra 5). Trong trường hợp không có số lớn thứ nhì, thì in ra số lớn nhất.

3, Liệt kê tất cả các ước số của một số tự nhiên nhập từ bàn phím.

4, In ra họ và tên của một họ tên cho trước. 
(Ví dụ Phan Thanh Hoa -> In ra:  Phan Hoa)

5, Viết hàm cho phép người dùng chọn đáp án
Question: Đâu không phải là một ngôn ngữ lập trình?
a - Golang
b - Swift
c - Ruby
d - Daily

Cho người dùng chọn a, b, c, d để trả lời!
Yêu cầu người dùng chọn lại đáp án nếu input không đúng, (không đúng nếu input khác a, b, c, d)
In ra trả lời sai nếu đáp án không đúng
In ra trả lời đúng nếu đáp án đúng

6, Viết chương trình nhập vào số nguyên dương N (N<=32767), in ra màn hình những số hoàn hảo nhỏ hơn N (số hoàn hảo là số bằng tổng các ước số của nó mà không kể chính nó)
    
## Lưu ý
    

# Yêu cầu
    - Bài tập đẩy lên Github, gửi link bài tập qua Mail
    - Cú pháp gửi bài:
        [BTVN-04] + Họ tên người gửi + lớp di động 3
    - Gửi bài tập vào mail: quynh@techmaster.vn, cc mail cho thầy cuong@techmaster.vn
    - Khuyến khích viết README.md mô tả repository của mình

## Nội dung đã học

### Chữa bài tập về nhà buoi2, buoi3

```
import Foundation

// B3: Kiểm tra 1 năm có phải là năm nhuận
func leap() {
    print("Nhap nam:")
    let year = Int(readLine()!)!
    
    // cách 1:
    if (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) {
        print("\(year) la nam nhuan")
    } else {
        print("\(year) khong phai la nam nhuan")
    }
    
    // cách 2:
    if year % 100 == 0 {
        if year % 400 == 0 {
            print("\(year) la nam nhuan")
        } else{
            print("\(year) không la nam nhuan")
        }
    } else if year % 4 == 0 {
        print("\(year) la nam nhuan")
    } else{
        print("\(year) không la nam nhuan")
    }
}

//Nhập vào thời điểm T gồm 3 số theo dạng : “Giờ : Phút : Giây” và 1 số nguyên X <= 10000
//- Hỏi sau X giây kể từ thời điểm T thì thời gian là bao nhiêu ?
//- Hãy in ra theo dạng “Giờ : Phút : Giây”
func congGiay()
{
    print("Nhap gio: ")
    var gio = Int(readLine()!)!
    print("Nhap phut: ")
    var phut = Int(readLine()!)!
    print("Nhap giay: ")
    var giay = Int(readLine()!)!
    print("Nhap so giay cong them: ")
    var x = Int(readLine()!)!
    
    print("Thời điểm ban đầu: \(gio) : \(phut) : \(giay) ")
    
    var tongGiay = gio*3600 + phut*60 + giay + x
    
    gio = tongGiay / 3600 // tính giờ
    tongGiay = tongGiay % 3600 // số giây còn lại sau khi tính giờ
    phut = tongGiay / 60 // tính phút
    giay = tongGiay % 60 // số giây còn lại
    
    if gio >= 24 {
        gio = gio - 24
        print("Thời điểm sau \(x) giây là: \(gio):\(phut):\(giay) ngày hôm sau")
    } else {
        print("Thời điểm sau \(x) giây là: \(gio):\(phut):\(giay)")
    }

}


func giaiThua(){
    // nhập m từ bàn phím
    print("Nhap m:")
    let m = Int(readLine()!)!
    // khai báo biến n để kiểm tra n
    var n: Int = 0
    // khai báo biến giaithua để tính n!
    var giaithua = 1
    
    while(giaithua <= m){
        n = n+1
        // có thể dùng for tính giaithua
        // nếu dùng for thì trước khi lặp, gán lại giá trị cho giaithua = 1
        giaithua = 1
        for i in 1...n{
            giaithua = giaithua*i
        }
        // tận dụng n tăng lên 1 để tính giai thừa
//        giaithua = giaithua*n
    }
    print("so n can tim la: \(n)")
}

// tìm phần tử bé nhất và lớn nhất, tính trung bình cộng của các phần tử trong mảng số nguyên
func mangSoNguyen(){
    let mang = [2,4,3,6,7,9,1]
    print("Bài 8: ")
    print(mang)
    var min = mang[0]
    var max = mang[0]
    var tongdiem:Float = 0.0
    var tbc:Float = 0.0
    for i in mang {
        tongdiem += Float(i)
        if i < min {
            min = i
        }
        if i > max {
            max = i
        }
        
    }
    tbc = Float(tongdiem / Float(mang.count))
    print("Phần tử bé nhất trong mảng là: \(min)")
    print("Phần tử lớn nhất trong mảng là: \(max)")
    print("Tổng điểm trong mảng: \(tongdiem)")
    print("Trung bình cộng của mảng: \(tbc)")
    print()
    
}

func soLonThuHai(){
    let numbers: [Int] = [2, 8, 4, 10, 8, 9]
    
    var max1 = numbers[0] // số lớn thứ nhất
    var max2 = numbers[0] // số lớn thứ hai
    
    // cách 1
    for i in numbers{
        if max1 < i { // nếu số lớn thứ nhất không còn là số lớn thứ nhất (do nhỏ hơn i)
            max2 = max1 // thì số lớn thứ 2 được gán bằng số lớn thứ nhất
            max1 = i // số lớn thứ nhất được gán bằng i
        } else if max2 < i && i < max1{
            max2 = i
        }
    }
    
    // cách 2 mọi người tự làm, tìm ra số lớn nhất của mảng, sau đó tìm ra số lớn nhất của phần còn lại
    
    // cách 3, là sắp xếp mảng, và tính đến trường hợp các phần tử trùng nhau
    print("Số lớn thứ 2: \(max2)")
}

// in ra vị trí số lẻ đầu tiên và vị trí số chẵn cuối cùng
func viTri(){
    let numbers = [2, -4, 0, 6, 32, 24]
    
//    var viTriLeDauTien: Int = 0
//    var viTriChanCuoiCung: Int = 0
//
//    for i in 0..<numbers.count{
//        if numbers[i] % 2 != 0 {
//            viTriLeDauTien = i
//            break
//        }
//    }
//
//    for i in (0..<numbers.count).reversed(){
//        if numbers[i] % 2 == 0{
//            viTriChanCuoiCung = i
//            break
//        }
//    }
//
//    print("Vị trí lẻ đầu tiên: \(viTriLeDauTien)")
//    print("Vị trí chẵn cuối cùng: \(viTriChanCuoiCung)")
    
    // khai báo biến soLe, soChan là kiểu optional
    var soLe: Optional<Int> = nil // có thể viết cách khác: var soLe: Int? = nil
    var soChan: Optional<Int> = nil // có thể viết cách khác: var soChan: Int? = nil
    
    for (index, number) in numbers.enumerated() {
        if soLe == nil && number % 2 != 0 { // nếu số lẻ không có giá trị và number lại không chia hết cho 2 thì soLe được gán bằng index + 1
            // do đề bài tìm vị trí lẻ đầu tiên, nên nếu tìm được thì chuyển sang kiểm tra điều kiện bên dưới
            soLe = index + 1
        } else if number % 2 == 0 { // nếu number là số lẻ thì soChan được gán bằng index + 1
            soChan = index + 1
        }
    }
    if soLe == nil { // nếu soLe == nil tức là k có số lẻ
        print("Mang khong co so le")
    } else {
        print("So le dau tien o vi tri: \(soLe!)")
    }
    if soChan == nil { // nếu soChan == nil tức là k có số chan
        print("Mang khong co so chan")
    } else {
        print("so chan cuoi cung o vi tri: \(soChan!)")
    }
}

// đảo chuỗi cả hoa thường
func daoMotChuoi() {
    print("Nhập vào chuỗi bất kì")
    let cau = String(readLine()!)
    var result = ""
    for i in cau {
        let s = String(i)
        let lo = s.lowercased()
        let up = s.uppercased()
        result += (s == lo) ? up : lo
    }
    print("Câu sau khi đảo ngược kí tự: \(result) ")
    print()
}

//7, Viết chương trình vẽ một tam giác cân bằng các dấu * với chiều cao nhập từ bàn phím (chiều cao lớn hơn 1)
//    *
//  * * *
//* * * * *
//
func veTamGiacCan() {
    print("Nhập chiều cao tam giác, chiều cao > 1: ")
    let h = Int(readLine()!)!
    
    for i in 0..<h {
        for j in 0..<2*h{
            if j >= (h-1-i) && j <= (h-1+i){
                print("*",terminator:"")
                
            } else {
                print(" ",terminator:"")
                
            }
        }
        print()
    }
    
}

//8, Viết chương trình vẽ một chữ X bằng các dấu * với chiều cao nhập từ bàn phím (chiều cao lớn hơn 0 và là số lẻ)
//
//*       *
// *     *
//  *   *
//    *
//  *   *
// *     *
//*       *
func veChuX (){
    print("Nhập chiều cao h (h > 1 và h lẻ):")
    let h = Int(readLine()!)!
    
    if h < 0 || h % 2 == 0 {
        print("Chiều cao không hợp lệ")
    } else {
        for i in 0..<h {
            for j in 0..<h {
                if i==j || i+j==h-1 {
                    print("*" , terminator:"")
                }
                else {
                    print(" ", terminator:"")
                }
            }
            print()
        }
    }
}

```
## Làm việc với giao diện

- Kéo thả outlet (New Referencing Outlet) của UITextField, UILabel
- Kéo thả action (Touch Up Inside) của UIButton
- Lấy được dữ liệu input từ UITextField: textField.text!
- Cập nhật text của UILabel theo input nhập vào: label.text = textField.text!

