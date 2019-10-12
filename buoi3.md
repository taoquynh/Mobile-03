# Buổi 3

# Bài tập về nhà
    2. Cho một mảng số nguyên. Kiểm tra nếu trong mảng có phần tử âm thì thay thế nó bằng 0.
    3. Tìm số nhỏ nhất và lớn nhất trong mảng số nguyên
    4.Tìm số lớn thứ 2 trong mảng số nguyên
    
## Lưu ý
    Về nhà bổ sung bài tập buổi 2

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
## Bài tập đã làm trên lớp
    Khai báo một mảng có 5 phần tử là các chuỗi “An”,“Long”,"Trang”,”Nam”,”Lam”.
    - Chèn tên mới “Quang" vào vị trí 2.		
    - Xóa tên ở cuối mảng
    - Khai báo biến t có giá trị là “Nhung”, kiểm tra xem biến t có trong mảng hay không ?
    

