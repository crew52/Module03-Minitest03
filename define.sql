CREATE DATABASE minitest03_db;
USE minitest03_db;

# table vat tu
CREATE TABLE VatTu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ma_vat_tu VARCHAR(50) UNIQUE NOT NULL,
    ten_vat_tu VARCHAR(100) NOT NULL,
    don_vi_tinh VARCHAR(50) NOT NULL,
    gia_tien DECIMAL(10, 2) NOT NULL
);

-- Tạo bảng Tồn kho
CREATE TABLE TonKho (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vat_tu_id INT NOT NULL,
    so_luong_dau INT NOT NULL,
    tong_so_luong_nhap INT NOT NULL,
    tong_so_luong_xuat INT NOT NULL,
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

-- Tạo bảng Nhà cung cấp
CREATE TABLE NhaCungCap (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ma_nha_cung_cap VARCHAR(50) NOT NULL,
    ten_nha_cung_cap VARCHAR(100) NOT NULL,
    dia_chi VARCHAR(255) NOT NULL,
    so_dien_thoai VARCHAR(15) NOT NULL
);

-- Tạo bảng Đơn đặt hàng
CREATE TABLE DonDatHang (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ma_don VARCHAR(50) NOT NULL,
    ngay_dat_hang DATE NOT NULL,
    nha_cung_cap_id INT NOT NULL,
    FOREIGN KEY (nha_cung_cap_id) REFERENCES NhaCungCap(id)
);

-- Tạo bảng Phiếu nhập
CREATE TABLE PhieuNhap (
    id INT AUTO_INCREMENT PRIMARY KEY,
    so_phieu_nhap VARCHAR(50) NOT NULL,
    ngay_nhap DATE NOT NULL,
    don_hang_id INT NOT NULL,
    FOREIGN KEY (don_hang_id) REFERENCES DonDatHang(id)
);

-- Tạo bảng Phiếu xuất
CREATE TABLE PhieuXuat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ngay_xuat DATE NOT NULL,
    ten_khach_hang VARCHAR(100) NOT NULL
);

-- Tạo bảng Chi tiết đơn hàng
CREATE TABLE CTDonHang (
    id INT AUTO_INCREMENT PRIMARY KEY,
    don_hang_id INT NOT NULL,
    vat_tu_id INT NOT NULL,
    so_luong_dat INT NOT NULL,
    FOREIGN KEY (don_hang_id) REFERENCES DonDatHang(id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

-- Tạo bảng Chi tiết phiếu nhập
CREATE TABLE CTPhieuNhap (
    id INT AUTO_INCREMENT PRIMARY KEY,
    phieu_nhap_id INT NOT NULL,
    vat_tu_id INT NOT NULL,
    so_luong_nhap INT NOT NULL,
    don_gia_nhap DECIMAL(10, 2) NOT NULL,
    ghi_chu VARCHAR(255),
    FOREIGN KEY (phieu_nhap_id) REFERENCES PhieuNhap(id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

-- Tạo bảng Chi tiết phiếu xuất
CREATE TABLE CTPhieuXuat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    phieu_xuat_id INT NOT NULL,
    vat_tu_id INT NOT NULL,
    so_luong_xuat INT NOT NULL,
    don_gia_xuat DECIMAL(10, 2) NOT NULL,
    ghi_chu VARCHAR(255),
    FOREIGN KEY (phieu_xuat_id) REFERENCES PhieuXuat(id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);