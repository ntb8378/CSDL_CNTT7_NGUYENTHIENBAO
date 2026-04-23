-- 1. PHÂN TÍCH

-- Hiện tại:
-- - Có rất nhiều đơn hàng 'Canceled' -> gây đầy ổ cứng, làm chậm truy vấn
-- - Nhưng kế toán vẫn cần dữ liệu để kiểm toán -> KHÔNG được xóa hẳn

-- GIẢI PHÁP 1: HARD DELETE

-- Xóa vĩnh viễn các đơn hàng bị hủy
DELETE FROM ORDERS
WHERE Status = 'Canceled';

-- Ưu điểm:
-- - Giải phóng dung lượng ổ cứng
-- - Truy vấn nhanh hơn

-- Nhược điểm:
-- - Mất dữ liệu vĩnh viễn
-- - Không thể phục hồi -> không đáp ứng yêu cầu kiểm toán

-- -> GIẢI PHÁP 2: SOFT DELETE

-- Đánh dấu đơn hàng đã "xóa" bằng cờ IsDeleted
UPDATE ORDERS
SET IsDeleted = 1
WHERE Status = 'Canceled';

-- Ưu điểm:
-- - Vẫn giữ dữ liệu -> phục vụ kiểm toán
-- - Có thể khôi phục khi cần

-- Nhược điểm:
-- - Không giảm dung lượng ngay
-- - Cần thêm điều kiện khi truy vấn


-- 2. TRUY VẤN SAU KHI ÁP DỤNG 

-- Truy vấn cho ứng dụng bán hàng (KHÔNG thấy đơn hủy)
SELECT *
FROM ORDERS
WHERE IsDeleted = 0;

-- Truy vấn cho kế toán (VẪN thấy đơn hủy để đối soát)
SELECT *
FROM ORDERS
WHERE Status = 'Canceled';