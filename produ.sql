use minitest03_db;

#Câu 1: Tạo SP cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào
DELIMITER //
CREATE PROCEDURE sp_tong_so_luong_cuoi(maVatTu VARCHAR(50))
BEGIN
    SELECT 
        vt.ma_vat_tu AS ma_vat_tu,
        (tk.so_luong_dau + tk.tong_so_luong_nhap - tk.tong_so_luong_xuat) AS tong_so_luong_cuoi
    FROM 
        TonKho tk
    JOIN 
        VatTu vt ON tk.vat_tu_id = vt.id
    WHERE 
        vt.ma_vat_tu = maVatTu;
END //
DELIMITER ;
CALL sp_tong_so_luong_cuoi("vt005");

#Câu 2: Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào
DELIMITER //
CREATE PROCEDURE sp_tong_tien_xuat(maVatTu VARCHAR(50))
BEGIN
    SELECT 
        vt.ma_vat_tu AS ma_vat_tu,
        SUM(ctx.so_luong_xuat * ctx.don_gia_xuat) AS tong_tien_xuat
    FROM 
        CTPhieuXuat ctx
    JOIN 
        VatTu vt ON ctx.vat_tu_id = vt.id
    WHERE 
        vt.ma_vat_tu = maVatTu
    GROUP BY 
        vt.ma_vat_tu;
END //
DELIMITER ;
CALL sp_tong_tien_xuat("vt005");

#Câu 3: Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào
DELIMITER //
CREATE PROCEDURE sp_tong_so_luong_dat(soDonHang VARCHAR(50))
BEGIN
    SELECT 
        ddh.ma_don AS so_don_hang,
        SUM(ctdh.so_luong_dat) AS tong_so_luong_dat
    FROM 
        CTDonHang ctdh
    JOIN 
        DonDatHang ddh ON ctdh.don_hang_id = ddh.id
    WHERE 
        ddh.ma_don = soDonHang
    GROUP BY 
        ddh.ma_don;
END //
DELIMITER ;

SELECT * FROM DonDatHang;
CALL sp_tong_so_luong_dat("DH003");

#Câu 4: Tạo SP dùng để thêm một đơn đặt hàng
DELIMITER //
CREATE PROCEDURE sp_them_don_dat_hang(
    IN maDon VARCHAR(50),
    IN ngayDatHang DATE,
    IN nhaCungCapId INT
)
BEGIN
    INSERT INTO DonDatHang (ma_don, ngay_dat_hang, nha_cung_cap_id)
    VALUES (maDon, ngayDatHang, nhaCungCapId);
END //
DELIMITER ;
SELECT * FROM DonDatHang;
CALL sp_them_don_dat_hang("dung", "2025-01-15", 1);

#Câu 5: Tạo SP dùng để thêm một chi tiết đơn đặt hàng
DELIMITER //
CREATE PROCEDURE sp_them_ct_don_hang(
    IN donHangId INT,
    IN vatTuId INT,
    IN soLuongDat INT
)
BEGIN
    INSERT INTO CTDonHang (don_hang_id, vat_tu_id, so_luong_dat)
    VALUES (donHangId, vatTuId, soLuongDat);
END //
DELIMITER ;
SELECT * FROM CTDonHang;
CALL sp_them_ct_don_hang(1, 2, 50);

#Câu 6: Tạo SP dùng để xóa một nhà cung cấp theo ID, trong đó:
ALTER TABLE DonDatHang
MODIFY nha_cung_cap_id INT NULL;

DELIMITER //
CREATE PROCEDURE sp_xoa_nha_cung_cap(
    IN nhaCungCapId INT
)
BEGIN
    -- Cập nhật các đơn đặt hàng liên kết với nhà cung cấp, chuyển khóa ngoại thành NULL
    UPDATE DonDatHang
    SET nha_cung_cap_id = NULL
    WHERE nha_cung_cap_id = nhaCungCapId;

    -- Xóa nhà cung cấp
    DELETE FROM NhaCungCap
    WHERE id = nhaCungCapId;
END //
DELIMITER ;
select * from NhaCungCap;
CALL sp_xoa_nha_cung_cap(1);