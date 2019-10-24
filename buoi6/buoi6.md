# Buổi 6

# Bài tập về nhà

    
## Lưu ý
    

# Yêu cầu
    - Bài tập đẩy lên Github, gửi link bài tập qua Mail
    - Cú pháp gửi bài:
        [BTVN-04] + Họ tên người gửi + lớp di động 3
    - Gửi bài tập vào mail: quynh@techmaster.vn, cc mail cho thầy cuong@techmaster.vn
    - Khuyến khích viết README.md mô tả repository của mình

## Nội dung đã học

### Chữa bài tập về nhà buoi5

```
import Foundation

func hinhChuNhatDac(){
    print("Nhập kích thước m, n (m, n >= 2): ")
    let m = Int(readLine()!)!
    let n = Int(readLine()!)!
    
    for _ in 0..<m {
        for _ in 0..<n{
            print("*", terminator:"")
        }
        print()
    }
}

func hinhChuNhatRong(){
    print("Nhập kích thước m, n (m, n >= 2): ")
    let m = Int(readLine()!)!
    let n = Int(readLine()!)!
    for i in 0..<m{
        
        switch i {
        case 0:
            for _ in 0..<n{
                print("*", terminator: " ")
            }
            print()
        case 1..<m-1:
            for j in 0..<n{
                if j == 0 || j == n - 1{
                    print("*", terminator: " ")
                } else {
                    print(" ", terminator: " ")
                }
            }
            print()
        case m - 1:
            for _ in 0..<n{
                print("*", terminator: " ")
            }
            print()
        default:
            return
        }
    }
}

func tamGiacVuong(){
    print("Nhập chiều cao tam giác (>1): ")
    let h = Int(readLine()!)!
    
    for i in 1...h{
        for _ in 1...i{
            print("*", terminator:" ")
        }
        print()
    }
}

func tamGiacNguoc(){
    print("Nhập chiều cao tam giác (>1): ")
    let h = Int(readLine()!)!
    let day = 2*h - 1
    
    for i in 0..<h{
        for j in 0..<day{
            if i == j || (i <= day - 1 - j && i < j) {
                print("*",terminator:" ")
            } else {
                print(" ",terminator:" ")
            }
        }
        print()
    }
}

func demPhepTinh(){
    print("Nhập vào một số tự nhiên bất kì: ")
    var n = Int(readLine()!)!
    
    var count = 0
    while n != 1 {
        if n % 2 == 0 {
            n = n / 2
        } else {
            n = n * 3 + 1
        }
        count += 1
    }
    print(count)
}

func random(){
    let random = Int.random(in: 0...100)
    func check(){
        print("Đoán một số trong khoảng 0...100")
        let number = Int(readLine()!)!
        
        if number < 0 || number > 100{
            check()
            return
        }
        
        if number < random{
            print("Bé quá")
            check()
        } else if number > random {
            print("Lớn quá")
            check()
        } else {
            print("Chúc mừng")
        }
    }
    check()
}



```
## Làm việc với giao diện




