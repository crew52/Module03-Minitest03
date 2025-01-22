INSERT INTO VatTu (ma_vat_tu, ten_vat_tu, don_vi_tinh, gia_tien) VALUES
('VT001', 'Xi măng', 'Bao', 100.50),
('VT002', 'Sắt thép', 'Kg', 120.00),
('VT003', 'Gạch', 'Viên', 5.00),
('VT004', 'Cát', 'Khối', 200.00),
('VT005', 'Sơn', 'Thùng', 300.00),
('VT006', 'Kính', 'M2', 400.00),
('VT007', 'Ống nước', 'Mét', 50.00),
('VT008', 'Dây điện', 'Mét', 20.00),
('VT009', 'Xi măng trắng', 'Bao', 150.00),
('VT010', 'Gạch men', 'Viên', 10.00);

INSERT INTO TonKho (vat_tu_id, so_luong_dau, tong_so_luong_nhap, tong_so_luong_xuat) VALUES
(1, 100, 50, 30),
(2, 200, 100, 50),
(3, 500, 300, 200),
(4, 100, 20, 10),
(5, 50, 25, 15);

INSERT INTO NhaCungCap (ma_nha_cung_cap, ten_nha_cung_cap, dia_chi, so_dien_thoai) VALUES
('NCC001', 'Công ty A', 'Hà Nội', '0123456789'),
('NCC002', 'Công ty B', 'TP. HCM', '0987654321'),
('NCC003', 'Công ty C', 'Đà Nẵng', '0911223344');

INSERT INTO DonDatHang (ma_don, ngay_dat_hang, nha_cung_cap_id) VALUES
('DH001', '2025-01-01', 1),
('DH002', '2025-01-05', 2),
('DH003', '2025-01-10', 3);

INSERT INTO PhieuNhap (so_phieu_nhap, ngay_nhap, don_hang_id) VALUES
('PN001', '2025-01-02', 1),
('PN002', '2025-01-06', 2),
('PN003', '2025-01-11', 3);

INSERT INTO PhieuXuat (ngay_xuat, ten_khach_hang) VALUES
('2025-01-03', 'Khách hàng A'),
('2025-01-07', 'Khách hàng B'),
('2025-01-12', 'Khách hàng C');


INSERT INTO CTDonHang (don_hang_id, vat_tu_id, so_luong_dat) VALUES
(1, 1, 50),
(1, 2, 100),
(2, 3, 200),
(2, 4, 10),
(3, 5, 20),
(3, 6, 15);

INSERT INTO CTPhieuNhap (phieu_nhap_id, vat_tu_id, so_luong_nhap, don_gia_nhap, ghi_chu) VALUES
(1, 1, 30, 100.00, 'Nhập đợt 1'),
(1, 2, 50, 120.00, 'Nhập đợt 1'),
(2, 3, 100, 5.00, 'Nhập đợt 2'),
(2, 4, 10, 200.00, 'Nhập đợt 2'),
(3, 5, 20, 300.00, 'Nhập đợt 3'),
(3, 6, 10, 400.00, 'Nhập đợt 3');

INSERT INTO CTPhieuXuat (phieu_xuat_id, vat_tu_id, so_luong_xuat, don_gia_xuat, ghi_chu) VALUES
(1, 1, 20, 110.00, 'Xuất bán lẻ'),
(1, 2, 30, 125.00, 'Xuất bán lẻ'),
(2, 3, 50, 6.00, 'Xuất công trình'),
(2, 4, 5, 210.00, 'Xuất công trình'),
(3, 5, 10, 310.00, 'Xuất kho tồn'),
(3, 6, 5, 420.00, 'Xuất kho tồn');

SELECT * FROM VatTu;
SELECT * FROM TonKho;
SELECT * FROM NhaCungCap;
SELECT * FROM DonDatHang;
SELECT * FROM PhieuNhap;
SELECT * FROM PhieuXuat;
SELECT * FROM CTDonHang;
SELECT * FROM CTPhieuNhap;
SELECT * FROM CTPhieuXuat;




