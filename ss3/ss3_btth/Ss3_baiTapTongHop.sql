-- ================== TẠO BẢNG ==================
CREATE TABLE PRODUCTS (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Size VARCHAR(10),
    Price DECIMAL(10,2) CHECK (Price >= 0)
);

-- ================== INSERT DỮ LIỆU ==================
INSERT INTO PRODUCTS (ProductID, ProductName, Size, Price) VALUES
('P01', 'Áo sơ mi trắng', 'L', 250000),
('P02', 'Quần Jean xanh', 'M', 450000),
('P03', 'Áo thun Basic', 'XL', 150000),
('P04', 'Áo hoodie', NULL, -200000), 
('P05', 'Áo khoác jeans', 'L', 550000),
('P06', 'Quần short kaki', 'M', 300000),
('P07', 'Áo polo', 'S', 200000),
('P08', 'Áo tanktop', NULL, 120000), 
('P09', 'Quần jogger', 'XL', -100000), 
('P10', 'Áo len', 'M', 350000);

-- ================== UPDATE ==================

-- Cập nhật giá P02 còn 400000
UPDATE PRODUCTS
SET Price = 400000
WHERE ProductID = 'P02';

-- Tăng giá tất cả sản phẩm lên 10%
UPDATE PRODUCTS
SET Price = Price * 1.1;

-- ================== DELETE ==================

-- Xóa sản phẩm P03
DELETE FROM PRODUCTS
WHERE ProductID = 'P03';

-- ================== SELECT ==================

-- Xem toàn bộ sản phẩm
SELECT * FROM PRODUCTS;

-- In nhãn sản phẩm (Tên, Size)
SELECT ProductName, Size
FROM PRODUCTS;

-- Tìm sản phẩm giá > 300000
SELECT *
FROM PRODUCTS
WHERE Price > 300000;

-- ================== XÓA DỮ LIỆU LỖI ==================

DELETE FROM PRODUCTS
WHERE Size IS NULL OR Price < 0;