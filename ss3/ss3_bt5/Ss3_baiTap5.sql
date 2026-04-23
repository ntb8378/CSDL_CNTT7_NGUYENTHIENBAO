-- ================== TABLE ==================
CREATE TABLE CART_ITEMS (
    CartItemID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ProductID INT,
    Quantity INT,
    AddedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_quantity CHECK (Quantity > 0),
    CONSTRAINT unique_user_product UNIQUE (UserID, ProductID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ================== ADD TO CART ==================
INSERT INTO CART_ITEMS (UserID, ProductID, Quantity)
VALUES (1, 101, 1)
ON DUPLICATE KEY UPDATE
Quantity = Quantity + 1;

-- ================== VIEW CART ==================
SELECT ProductID, Quantity, AddedDate
FROM CART_ITEMS
WHERE UserID = 1;

-- ================== UPDATE QUANTITY ==================
UPDATE CART_ITEMS
SET Quantity = 5
WHERE UserID = 1
  AND ProductID = 101
  AND 5 > 0;

-- ================== REMOVE ITEM ==================
DELETE FROM CART_ITEMS
WHERE UserID = 1
  AND ProductID = 101;