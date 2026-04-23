1. Tạo bảng sản phẩm
CREATE TABLE PRODUCTS (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
OriginalPrice DECIMAL(18, 2)

2. Chèn dữ liệu mau (Gom cả Điện tử và Thực phẩm)
INSERT INTO PRODUCTS (ProductID, ProductName, Category,
OriginalPrice)
VALUES
(1, 'iPhone 15', 'Electronics', 20000000),
(2, 'Samsung Refrigerator', 'Electronics', 15000000),
(3, 'Water Spinach', 'Food', 10000),
(4, 'Filtered Fresh Milk 4', 'Food', 28000);

-- 3. ĐOẠN CODE GÂY HÔNG DƯ LIỆU (lôi của thực tập sinh)
-- Hãy phân tích xem tại sao Tên này lại làm "bay màu lợi nhuận của siêu thị?"
UPDATE PRODUCTS
SET OriginalPrice = OriginalPrice * 0.9
-- thêm where vô là xong
Where Category ='Electronics' ;

-- tại vì thiếu WHERE nên nó sẽ sửa tất cả các dữ liệu luôn
-- cách sửa là thêm WHERE vô

