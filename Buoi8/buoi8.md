# Buổi 2

# Bài tập về nhà
1. Sắp xếp mảng giảm dần sử dụng hàm sort()
2. In hình (nhập vào chiều cao của hình, với hình 2 thì chiều cao phải lẻ):
```
Hình 1:
*
**
***
****
*****
*****
****
***
**
*

Hình 2:

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
```
3. Viết chương trình nhập ngày, tháng, năm.
–   Tháng có bao nhiêu ngày
–   Tìm ngày trước ngày vừa nhập.
–   Tìm ngày sau ngày vừa nhập

4. Ứng dụng class, struct làm bài tập random UIIMageView, Title ảnh, BackgroundColor của B
5. Tìm số Amstrong là một số có đặc điểm sau: số đó gồm n chữ số, tổng các lũy thừa bậc n của các chữ số đó và số đó.
    Ví dụ: 153 = 1^3 + 5^3 + 3^3. Hãy tìm các số Amstrong nhỏ hơn 1000.
## Lưu ý

# Yêu cầu
    - Bài tập đẩy lên Github, gửi link bài tập qua Mail
    - Cú pháp gửi bài:
        [BTVN-08] + Họ tên người gửi + lớp di động 3
    - Gửi bài tập vào mail: quynh@techmaster.vn, cc mail cho thầy cuong@techmaster.vn
    - Khuyến khích viết README.md mô tả repository của mình

## Nội dung đã học
- Chữa bài tập về nhà buổi 7, 2 bài giao diện
```
import Foundation

print("---------------------------")
func demSoNguyenTo(){
    print("Nhập vào 2 số tự nhiên m, n (m<n)")
    
    let m = Int(readLine()!)!
    let n = Int(readLine()!)!
    
    if m >= n || m < 0 || n < 0 {
        demSoNguyenTo()
        return
    }
    
    if n <= 1 {
        print("Không tìm thấy số nguyên tố trong khoảng [\(m),\(n)]")
    }else if m >= 2 {
        for i in m...n{
            if isSoNguyenTo(n: i){
                print("Số nguyên tố trong khoảng [\(m),\(n)] là: \(i)")
            }
        }
    }
}

func isSoNguyenTo(n: Int) -> Bool{
    var dem = 0
    for i in 2..<n{
        if n%i == 0 {
            dem += 1
            break
        }
    }
    
    if dem == 0 {
        return true
    }else{
        return false
    }
}

print("---------------------------")
func ngayThang(){
    print("Nhập vào năm: ")
    let year = Int(readLine()!)!
    for i in 1...12{
        if i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i == 12{
            print("Tháng \(i) có 31 ngày")
        }else  if i == 4 || i == 6 || i == 9 || i == 11 {
            print("Tháng \(i) có 30 ngày")
        }else{
            if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 {
                print("Tháng \(i) có 29 ngày")
            }else{
                print("Tháng \(i) có 28 ngày")
            }
        }
    }
}

print("---------------------------")
func chenXSauPhanTuMax(){
    print("Nhập x: ")
    let x = Int(readLine()!)!
    
    var arrays: [Int] = [2, 43, 0, 3, 6, 18]
    print("Mảng ban đầu: \(arrays)")
    var indexMax = 0
    
    for (index, i) in arrays.enumerated() {
        if i > arrays[indexMax]{
            indexMax = index
        }
    }
    
    print(indexMax)
    arrays.insert(x, at: indexMax + 1)
    print("Mảng sau khi chèn x là: \(arrays)")
}

print("---------------------------")
func chenXGiuNguyenThuTu(){
    print("Nhập x: ")
    let x = Int(readLine()!)!
    
    var arrays: [Int] = [2, 43, 0, 3, 6, 18]
    print("Mảng ban đầu: \(arrays)")
    
    arrays.sort()
    arrays.insert(x, at: 0)
    
    for i in 1..<arrays.count{
        if arrays[i] < arrays[i-1]{
            let temp: Int = arrays[i-1]
            arrays[i-1] = arrays[i]
            arrays[i] = temp
        }
    }
    print(arrays)
}


```
- Học sử dụng Enums
- Học Struct, Class

## Bài tập đã làm trên lớp
In danh sách tiền cước taxi áp dụng struct, class
    

