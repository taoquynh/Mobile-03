# Buổi 3

# Bài tập về nhà
    1 [Giao tại lớp], Cho một mảng số nguyên. Kiểm tra nếu trong mảng có phần tử âm thì thay thế nó bằng 0.
    2 [Giao tại lớp], Tìm số nhỏ nhất và lớn nhất trong mảng số nguyên
    3 [Giao tại lớp], Tìm số lớn thứ 2 trong mảng số nguyên
    4, Trả về Vị trí đầu tiên của số lẻ, vị trí cuối cùng của số chẵn trong mảng bất kì.

    5, In một chuỗi cho trước theo thứ tự ngược lại (Ví dụ: Hello in thành olleH)

    6, Đưa ra: phần tử lớn nhất, phần tử bé nhất, trung bình cộng của một dãy số cho trước

    7, Viết chương trình vẽ một tam giác cân bằng các dấu * với chiều cao nhập từ bàn phím (chiều cao lớn hơn 1)
        *
      * * * 
    * * * * *

    8, Viết chương trình vẽ một chữ X bằng các dấu * với chiều cao nhập từ bàn phím (chiều cao lớn hơn 0 và là số lẻ)
```
    *   *
     * * 
      *  
     * * 
    *   *
```
## Lưu ý
    Ai chưa hoàn thành bài tập buổi 2 thì làm bổ sung và nộp lại

# Yêu cầu
    - Bài tập đẩy lên Github, gửi link bài tập qua Mail
    - Cú pháp gửi bài:
        [BTVN-03] + Họ tên người gửi + lớp di động 3
    - Gửi bài tập vào mail: quynh@techmaster.vn, cc mail cho thầy cuong@techmaster.vn
    - Khuyến khích viết README.md mô tả repository của mình

## Nội dung đã học

### Mảng
```
// mảng

// khai báo một mảng string

var names: [String] = ["Hoa", "Nam", "Phong"] // đây là cách khai báo đầy đủ

// duyệt mảng
for i in names{
    print(i)
}

print("---------")

// duyệt mảng kèm index
for (index, i) in names.enumerated() {
    print("\(index) - \(i)")
}

print("---------")

// một cách khác duyệt mảng lấy ra index
for i in 0..<names.count{
    print("\(i) - \(names[i])")
}

// in ra phần tử thứ bao nhiêu đó của mảng
print(names[1]) // index phải nhỏ hơn số phần tử của mảng

// thêm phần tử vào mảng
names.append("Chung") // append truyền vào một phần tử

names.append(contentsOf: ["An", "Hanh"]) // append truyền vào một mảng

print("---------")
print(names) // in mảng

// thay thế giá trị phần tử trong mảng
names[1] = "Long"
print(names)

// xoá phần tử trong mảng
//- xoá phần tử theo index
names.remove(at: 3)
//- xoá tất cả các phần tử
names.removeAll()
//- xoá phần tử đầu tiên
names.removeFirst()
//- xoá phần tử cuối cùng
names.removeLast()
```
### Dictionary
```
// dictionary
// tạo dictionary rỗng
var dictionaryOne = [String: String]()
var dictionaryTwo = [Int: String]()

// tạo dictionary 2 phần tử
var airports: [String: String] = ["NoiBai": "Hà Nội", "SaoVang": "Thanh Hoá"]
print(airports)

// đếm phần tử của dictionary
print(airports.count)

// duyệt dictionary
for item in airports{
    print("Key: \(item.key) - value \(item.value)")
}

print("--------")
// duyệt dictionary theo key
for item in airports.keys{
    print("Key: \(item) - value \(airports[item])")
}

print("--------")
// duyệt dictionary theo value
for item in airports.values{
    print(item)
}

print("--------")
// thêm phần tử vào dictionary
airports["Sao Vàng"] = "Thanh Hoá"
print(airports)

// xoá toàn bộ phần tử của dictionary
//airports.removeAll()

// xoá phần tử theo key
airports.removeValue(forKey: "SaoVang")
print(airports)

// cập nhật giá trị phần tử (cách 1)
airports.updateValue("Xứ Thanh", forKey: "Sao Vàng")
print(airports)
// cập nhật giá trị phần tử (cách 2)
airports["NoiBai"] = "Thủ đô"
print(airports)

```
## Bài tập đã làm trên lớp
    Khai báo một mảng có 5 phần tử là các chuỗi “An”,“Long”,"Trang”,”Nam”,”Lam”.
    - Chèn tên mới “Quang" vào vị trí 2.		
    - Xóa tên ở cuối mảng
    - Khai báo biến t có giá trị là “Nhung”, kiểm tra xem biến t có trong mảng hay không ?
```
func kiemTraMang(){
    var mang: [String] = ["An", "Long", "Trang", "Nam", "Lam"]
    
    print(mang)
    // - Chèn tên mới “Quang" vào vị trí 2.
    mang.insert("Quang", at: 2)
    print(mang)
    
    // - Xóa tên ở cuối mảng
    mang.removeLast()
    print(mang)
    
    //- Khai báo biến t có giá trị là “Nhung”, kiểm tra xem biến t có trong mảng hay không ?
    let t = "Nhung"
    var isCheck: Bool = false
    for i in mang{
        if t == i {
            isCheck = true
            break
        }
    }
    
    if isCheck {
        print("Có Nhung")
    }else{
        print("Không có Nhung")
    }
}

```
## Làm quen với giao diện
- Tạo Single View App
- Giới thiệu qua về project: Name, BuildIdentifier, Target, Swift Version
- Giới thiệu qua về Simulator: Build ứng dụng vào simulator, xoay màn hình trái, phải (cmd <- ->), home, lock, erase, show device bezels
- Giới thiệu Storyboard, View, SafeArea UITextField, UILabel, UIButton, UIImageView
- Thêm ảnh vào Assets

