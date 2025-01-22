# Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP AS
SELECT 
    pn.so_phieu_nhap AS so_phieu_nhap_hang,
    vt.ma_vat_tu AS ma_vat_tu,
    ctpn.so_luong_nhap AS so_luong_nhap,
    ctpn.don_gia_nhap AS don_gia_nhap,
    (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM 
    CTPhieuNhap ctpn
JOIN 
    VatTu vt ON ctpn.vat_tu_id = vt.id
JOIN 
    PhieuNhap pn ON ctpn.phieu_nhap_id = pn.id;

#Câu 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP_VT AS
SELECT 
    pn.so_phieu_nhap AS so_phieu_nhap_hang,
    vt.ma_vat_tu AS ma_vat_tu,
    vt.ten_vat_tu AS ten_vat_tu,
    ctpn.so_luong_nhap AS so_luong_nhap,
    ctpn.don_gia_nhap AS don_gia_nhap,
    (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM 
    CTPhieuNhap ctpn
JOIN 
    VatTu vt ON ctpn.vat_tu_id = vt.id
JOIN 
    PhieuNhap pn ON ctpn.phieu_nhap_id = pn.id;
    
#Câu 3. Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. 
CREATE VIEW vw_CTPNHAP_VT_PN AS
SELECT 
    pn.so_phieu_nhap AS so_phieu_nhap_hang,
    pn.ngay_nhap AS ngay_nhap_hang,
    ddh.ma_don AS so_don_dat_hang,
    vt.ma_vat_tu AS ma_vat_tu,
    vt.ten_vat_tu AS ten_vat_tu,
    ctpn.so_luong_nhap AS so_luong_nhap,
    ctpn.don_gia_nhap AS don_gia_nhap,
    (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM 
    CTPhieuNhap ctpn
JOIN 
    VatTu vt ON ctpn.vat_tu_id = vt.id
JOIN 
    PhieuNhap pn ON ctpn.phieu_nhap_id = pn.id
JOIN 
    DonDatHang ddh ON pn.don_hang_id = ddh.id;
    
#Câu 4. Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP_VT_PN_DH AS
SELECT 
    pn.so_phieu_nhap AS so_phieu_nhap_hang,
    pn.ngay_nhap AS ngay_nhap_hang,
    ddh.ma_don AS so_don_dat_hang,
    ncc.ma_nha_cung_cap AS ma_nha_cung_cap,
    vt.ma_vat_tu AS ma_vat_tu,
    vt.ten_vat_tu AS ten_vat_tu,
    ctpn.so_luong_nhap AS so_luong_nhap,
    ctpn.don_gia_nhap AS don_gia_nhap,
    (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM 
    CTPhieuNhap ctpn
JOIN 
    VatTu vt ON ctpn.vat_tu_id = vt.id
JOIN 
    PhieuNhap pn ON ctpn.phieu_nhap_id = pn.id
JOIN 
    DonDatHang ddh ON pn.don_hang_id = ddh.id
JOIN 
    NhaCungCap ncc ON ddh.nha_cung_cap_id = ncc.id;
    
# Câu 5. Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 5.
CREATE VIEW vw_CTPNHAP_loc AS
SELECT 
    pn.so_phieu_nhap AS so_phieu_nhap_hang,
    vt.ma_vat_tu AS ma_vat_tu,
    ctpn.so_luong_nhap AS so_luong_nhap,
    ctpn.don_gia_nhap AS don_gia_nhap,
    (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM 
    CTPhieuNhap ctpn
JOIN 
    VatTu vt ON ctpn.vat_tu_id = vt.id
JOIN 
    PhieuNhap pn ON ctpn.phieu_nhap_id = pn.id
WHERE 
    ctpn.so_luong_nhap > 5;

# Câu 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ.
CREATE VIEW vw_CTPNHAP_VT_loc AS
SELECT 
    pn.so_phieu_nhap AS so_phieu_nhap_hang,
    vt.ma_vat_tu AS ma_vat_tu,
    vt.ten_vat_tu AS ten_vat_tu,
    ctpn.so_luong_nhap AS so_luong_nhap,
    ctpn.don_gia_nhap AS don_gia_nhap,
    (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM 
    CTPhieuNhap ctpn
JOIN 
    VatTu vt ON ctpn.vat_tu_id = vt.id
JOIN 
    PhieuNhap pn ON ctpn.phieu_nhap_id = pn.id
WHERE 
    vt.don_vi_tinh = 'Mét';

#Câu 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.
CREATE VIEW vw_CTPXUAT AS
SELECT 
    px.id AS so_phieu_xuat_hang,
    vt.ma_vat_tu AS ma_vat_tu,
    ctx.so_luong_xuat AS so_luong_xuat,
    ctx.don_gia_xuat AS don_gia_xuat,
    (ctx.so_luong_xuat * ctx.don_gia_xuat) AS thanh_tien_xuat
FROM 
    CTPhieuXuat ctx
JOIN 
    VatTu vt ON ctx.vat_tu_id = vt.id
JOIN 
    PhieuXuat px ON ctx.phieu_xuat_id = px.id;

#Câu 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW vw_CTPXUAT_VT AS
SELECT 
    px.id AS so_phieu_xuat_hang,
    vt.ma_vat_tu AS ma_vat_tu,
    vt.ten_vat_tu AS ten_vat_tu,
    ctx.so_luong_xuat AS so_luong_xuat,
    ctx.don_gia_xuat AS don_gia_xuat
FROM 
    CTPhieuXuat ctx
JOIN 
    VatTu vt ON ctx.vat_tu_id = vt.id
JOIN 
    PhieuXuat px ON ctx.phieu_xuat_id = px.id;
    
# Câu 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW vw_CTPXUAT_VT_PX AS
SELECT 
    px.id AS so_phieu_xuat_hang,
    px.ten_khach_hang AS ten_khach_hang,
    vt.ma_vat_tu AS ma_vat_tu,
    vt.ten_vat_tu AS ten_vat_tu,
    ctx.so_luong_xuat AS so_luong_xuat,
    ctx.don_gia_xuat AS don_gia_xuat
FROM 
    CTPhieuXuat ctx
JOIN 
    VatTu vt ON ctx.vat_tu_id = vt.id
JOIN 
    PhieuXuat px ON ctx.phieu_xuat_id = px.id;