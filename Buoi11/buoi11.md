
# Buổi 11

# Bài tập về nhà
1, Tịnh tiến UIView đi hết 4 viền màn hình
2, Tịnh tiến UIView đi theo đường zigzag
3, UIView rơi tự do với vận tốc giảm dần
4, Tịnh tiến và xoay UIView lăn 1 cạnh màn hình

Nâng cao: Tịnh tiến và lăn quả bóng theo các hướng ở trên

## Lưu ý
    

# Yêu cầu
    - Bài tập đẩy lên Github, gửi link bài tập qua Mail
    - Cú pháp gửi bài:
        [BTVN-11] + Họ tên người gửi + lớp di động 3
    - Gửi bài tập vào mail: quynh@techmaster.vn, cc mail cho thầy cuong@techmaster.vn
    - Khuyến khích viết README.md mô tả repository của mình

## Nội dung đã học
    - Vẽ layer
    - Sử dụng timer và animate để chuyển động UIView

## Chữa bài tập buổi 10
```
func fibonaxiNumber(){
    print("Nhap n : ")
    let n = Int(readLine()!)!
    var arr: [Int] = [0, 1]
    var i = 0
    var j = 2
    while i < n {
        i = arr[j-2] + arr[j-1]
        if i > n{
            break
        }
        arr.append(i)
        j += 1
    }
    for i in arr{
        print("\(i)", terminator: " ")
    }
}

func pascalTriangle(){
    print("Nhập chiều cao tam giác: ")
    let h = Int(readLine()!)!
    var arr:[[Int]] = [[1]]
    var arrc:[Int] = [1]
    for _ in 1..<h{
        arrc.append(1)
        arr.append(arrc)
    }
    for i in 2..<h{
        for j in 1..<i{
            arr[i][j] = arr[i-1][j-1] + arr[i-1][j]
        }
    }
    for i in arr{
        print(i)
    }
}
```
