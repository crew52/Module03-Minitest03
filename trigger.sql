# Tự động đặt giá trị ban đầu cho tong_so_luong_nhap và tong_so_luong_xuat khi thêm mới một bản ghi vào bảng TonKho.
DELIMITER //
CREATE TRIGGER before_insert_tonkho
BEFORE INSERT ON TonKho
FOR EACH ROW
BEGIN
    SET NEW.tong_so_luong_nhap = 0;
    SET NEW.tong_so_luong_xuat = 0;
END;
//
DELIMITER ;
select * from tonkho;
INSERT INTO TonKho (vat_tu_id, so_luong_dau) VALUES
(6, 75);

#Cập nhật tổng số lượng nhập trong bảng TonKho khi có phiếu nhập chi tiết mới.
DELIMITER //
CREATE TRIGGER after_insert_ctphieunhap
AFTER INSERT ON CTPhieuNhap
FOR EACH ROW
BEGIN
    UPDATE TonKho
    SET tong_so_luong_nhap = tong_so_luong_nhap + NEW.so_luong_nhap
    WHERE vat_tu_id = NEW.vat_tu_id;
END;
//
DELIMITER ;

SELECT * FROM CTPhieuNhap;

INSERT INTO CTPhieuNhap (phieu_nhap_id, vat_tu_id, so_luong_nhap, don_gia_nhap, ghi_chu) VALUES
(3, 6, 30, 85.00, 'Nhập đợt 3');

#Cập nhật tổng số lượng xuất trong bảng TonKho khi có phiếu xuất chi tiết mới.
DELIMITER //
CREATE TRIGGER after_insert_ctphieuxuat
AFTER INSERT ON CTPhieuXuat
FOR EACH ROW
BEGIN
    UPDATE TonKho
    SET tong_so_luong_xuat = tong_so_luong_xuat + NEW.so_luong_xuat
    WHERE vat_tu_id = NEW.vat_tu_id;
END;
//
DELIMITER ;

INSERT INTO CTPhieuXuat (phieu_xuat_id, vat_tu_id, so_luong_xuat, don_gia_xuat, ghi_chu) VALUES
(3, 6, 10, 120.00, 'Xuất bán lẻ');

SELECT * FROM CTPhieuXuat;
SELECT * FROM tonkho;

#Ghi lại lịch sử cập nhật tồn kho vào một bảng nhật ký khi tồn kho được thay đổi.
CREATE TABLE LogTonKho (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vat_tu_id INT NOT NULL,
    so_luong_dau INT,
    tong_so_luong_nhap INT,
    tong_so_luong_xuat INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

DELIMITER //
CREATE TRIGGER after_update_tonkho
AFTER UPDATE ON TonKho
FOR EACH ROW
BEGIN
    INSERT INTO LogTonKho (vat_tu_id, so_luong_dau, tong_so_luong_nhap, tong_so_luong_xuat)
    VALUES (NEW.vat_tu_id, NEW.so_luong_dau, NEW.tong_so_luong_nhap, NEW.tong_so_luong_xuat);
END;
//
DELIMITER ;

UPDATE tonkho 
SET so_luong_dau = 70
WHERE id = 6;

#Ngăn không cho xóa một vật tư nếu nó đang được tham chiếu trong bảng TonKho.
DELIMITER //
CREATE TRIGGER before_delete_vattu
BEFORE DELETE ON VatTu
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM TonKho WHERE vat_tu_id = OLD.id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể xóa vật tư đang được tham chiếu trong bảng TonKho.';
    END IF;
END;
//
DELIMITER ;



DELETE from vattu
WHERE id = 6;
SELECT * FROM vattu;

SHOW TRIGGERS;
DROP trigger before_delete_vattu;