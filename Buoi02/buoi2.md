# Buổi 2

# Bài tập về nhà
    1, Viết chương trình nhập vào 3 số nguyên a, b, c. Tìm, in ra số lớn nhất, số bé nhất.

    2, Nhập 3 giá trị nguyên dương a, b, c. Kiểm tra xem a, b, c có phải là 3 cạnh của tam giác không?
    - Nếu là 3 cạnh của tam giác thì tính diện tích của tam giác.
    - Nếu không phải là tam giác in ra “a, b, c không phải là 3 cạnh của tam giác”

    3, Nhập một năm công lịch bất kỳ , kiểm tra xem năm đó có phải năm nhuận hay không

    4, Nhập vào thời điểm T gồm 3 số theo dạng : “Giờ : Phút : Giây” và 1 số nguyên X <= 10000
    - Hỏi sau X giây kể từ thời điểm T thì thời gian là bao nhiêu ?
    - Hãy in ra theo dạng “Giờ : Phút : Giây”

    5, Tìm số n bé nhất sao cho n! lớn hơn một số m cho trước (m nhập từ bàn phím).
    
## Lưu ý

# Yêu cầu
    - Bài tập đẩy lên Github, gửi link bài tập qua Mail
    - Cú pháp gửi bài:
        [BTVN-02] + Họ tên người gửi + lớp di động 3
    - Gửi bài tập vào mail: quynh@techmaster.vn, cc mail cho thầy cuong@techmaster.vn
    - Khuyến khích viết README.md mô tả repository của mình

## Nội dung đã học
- Chữa bài tập về nhà buổi 1
```

```
- Ôn tập một số câu lệnh git: 
 - Đẩy code lên github
 - Lấy code từ github về
    
- Học cú pháp Swift căn bản:
    - Câu điều kiện, if let, guard let
    - Vòng lặp: for, repeat while, while

### Câu điều kiện

### Vòng lặp
```
import Foundation

func forLoop(){
    for i in 0..<10{
        print(i)
    }
    
    for i in 10..<20{
        print(i, terminator: " ") // terminator huỷ bỏ chế độ tự động xuống dòng
    }
}

func whileLoop(){
    var i = 10
    
    while i > 0 {
        i = i - 1
        print(i)
    }
}

func repeatWhileLoop(){
    var i = 10
    repeat {
        i = i - 1
        print(i)
    } while i > 0
}

```

## Bài tập đã làm trên lớp
    Nhập vào điểm trung bình của học sinh và in ra màn hình xếp loại tương ứng với mức điểm đó 
    (xếp hạng: (>8: Giỏi,  [5, 8): Trung bình, <5: Khá]), nếu nhập ngoài khoảng [1, 10] thì yêu cầu nhập lại)
    
