-- 1. PHÂN TÍCH

-- Bảng: CUSTOMERS có hàng triệu bản ghi, nhiều cột
-- Cần quét các thông tin:
-- - City
-- - LastPurchaseDate
-- - Email
-- - Status

-- Chỉ cần lấy:
-- - FullName
-- - Email

-- TẠI SAO KHÔNG DÙNG SELECT * 
-- SELECT * sẽ:
-- - Lấy tất cả các cột
-- - Gây tốn  bộ nhớ
-- - Làm chậm truy vấn

-- 2. THIẾT KẾ cách lỌC

-- Điều kiện:
-- 1. City = 'Hà Nội'
-- 2. LastPurchaseDate < '2025-10-01'
-- 3. Email IS NOT NULL
-- 4. Status = 'Active'

-- 3. CODE 

SELECT FullName, Email
FROM CUSTOMERS
WHERE City = 'Hà Nội'
  AND LastPurchaseDate < '2025-10-01'
  AND Email IS NOT NULL
  AND Status = 'Active';
