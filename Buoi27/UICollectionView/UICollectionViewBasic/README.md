#  UICollectionView

1. Hỗ trợ Multi-column.

2. Hỗ trợ cuộn danh sách theo chiều ngang, dọc

3. Custom Layout theo mong muốn.

4. Configure Animation cho việc thêm và xoá Cell.

5. Base View của UICollectionViewController là UIView.

6. Không có FooterViews và Separator.

### Flow layout
-   Flow layout là một dạng line-based layout, có nghĩa là layout object sẽ sắp xếp các items trên một hàng, và nó sẽ tính toán làm sao để có thể chứa càng nhiều items trên hàng đó càng tốt. Tới khi không còn thể nhét thêm bất cứ item nào nữa thì nó sẽ tạo ra một hàng mới và bắt đầu lặp lại công việc này cho đến khi hết tất cả items. Nếu có nhiều sections thì sẽ layout cho đến khi hết items trong section đó và bắt đầu section mới.

-   Flow layout chỉ có chúng ta scroll theo một hướng (1 scroll direction), vertical hoặc horizontal. Nếu scroll theo vertical, items sẽ được layout từ trái sang phải và nếu theo horizontal thì sẽ là từ trên xuống dưới.

-   Trong khi layout, các items trên cùng một hàng sẽ được canh chính giữa hàng đó.
