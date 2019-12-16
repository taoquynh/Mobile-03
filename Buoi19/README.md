
# Buổi 19

# Bài tập về nhà
1. Layout bằng code các màn hình sau

# Yêu cầu
    - Bài tập đẩy lên Github, gửi link bài tập qua Mail
    - Cú pháp gửi bài:
        [BTVN-19] + Họ tên người gửi + lớp di động 3
    - Gửi bài tập vào mail: quynh@techmaster.vn, cc mail cho thầy cuong@techmaster.vn
    - Khuyến khích viết README.md mô tả repository của mình

## Nội dung đã học
- Học các auto layout giao diện bằng code, sử dụng NSLayoutConstraint
- Khi sử dụng AutoLayout bằng code, phải set thuộc tính translatesAutoresizingMaskIntoConstraints = false
```
myView.translatesAutoresizingMaskIntoConstraints = false
```
- Layout top:  ```topAnchor```
- Layout left:  ```leftAnchor, leadingAnchor```
- Layout right:  ```rightAnchor, trailingAnchor```
- Layout bottom:  ```bottomAnchor```
```
scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
```

## Lưu ý


