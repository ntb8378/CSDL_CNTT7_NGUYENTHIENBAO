-- 1. CẤU TRÚC BẢNG
CREATE TABLE SHIPPERS (
    ShipperID INT PRIMARY KEY AUTO_INCREMENT,
    ShipperName VARCHAR(255),
    Phone VARCHAR(20)
);

-- 2. PHÂN TÍCH LỖI

-- LỖI 1: lỗi cú pháp
-- INSERT INTO SHIPPERS (ShipperName, Phone)
-- VALUES ('Giao Hàng Nhanh, '0901234567');

-- Vấn đề:
-- Thiếu dấu nháy đơn (') sau "Giao Hàng Nhanh"
-- Chuỗi bị mở nhưng không đóng
-- SQL không hiểu được đâu là giá trị hoàn chỉnh
-- gây lỗi cú pháp (Syntax Error)

-- LỖI 2: Thiếu dữ liệu (Phone bị NULL)
-- INSERT INTO SHIPPERS
-- VALUES ('Viettel Post');

-- Vấn đề:
-- Không chỉ định rõ cột
-- SQL hiểu là đang insert theo thứ tự tất cả các cột:
-- (ShipperID, ShipperName, Phone)

-- Nhưng:
-- - ShipperID: có AUTO_INCREMENT
-- - ShipperName: nhận 'Viettel Post'
-- - Phone: không có giá trị -> bị NULL

-- Dữ liệu bị thiếu (kẹt ở cột Phone)

-- 3. CÁCH LÀM ĐÚNG

-- Cách 1: Ghi rõ cột + đủ dữ liệu (khuyến khích)
INSERT INTO SHIPPERS (ShipperName, Phone)
VALUES ('Giao Hàng Nhanh', '0901234567');

INSERT INTO SHIPPERS (ShipperName, Phone)
VALUES ('Viettel Post', '0987654321');


-- ================== 4. GIẢI THÍCH ==================
-- Luôn đóng/mở dấu nháy đơn đúng cách khi làm việc với chuỗi
-- Luôn chỉ định rõ tên cột khi INSERT để tránh lệch dữ liệu
-- Tránh phụ thuộc vào thứ tự cột trong bảng