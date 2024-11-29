import 'dart:isolate';
import '../models/DienThoai.dart';
import 'dart:io';
import '../models/CuaHang.dart';
import '../models/HoaDon.dart';

void main() {
  int chon = 0;
  DienThoai? dienThoai;
  Hoadon hoaDon;
  CuaHang cuaHang;
  List<DienThoai> listDT = [];
  List<Hoadon> listHD = [];

  // Method rang buoc nguoi dung phai nhap gia tri cho thuoc tinh
  String nhapGiaTri() {
    String? input;
    do {
      input = stdin.readLineSync();
      if (input == null || input.trim().isEmpty) {
        print("Gia tri rong, vui long nhap lai!!!");
      }
    } while (input == null || input.trim().isEmpty);
    return input;
  }

  print('TAO CUA HANG');
  print('Nhap vao ten cua hang : ');
  String tenCH = nhapGiaTri();
  print('Nhap vao dia chi : ');
  String diaChi = nhapGiaTri();
  cuaHang = new CuaHang(tenCH, diaChi, listDT, listHD);

  // Tao switch case de test cac chuc nang
  do {
    print('CHUC NANG CUA CUA HANG ${cuaHang.tenCH}');
    print('1. Quan ly dien thoai');
    print('2. Quan ly hoa don');
    print('3. Thong ke');
    print('0. Thoat.');
    print('Chon chuc nang: ');
    String? input = stdin.readLineSync();
    if (input != null) {
      chon = int.tryParse(input) ?? 0;
    }

    switch (chon) {
      case 1:
        {
          int chucNang = 0;
          do {
            print('QUAN LY DIEN THOAI');
            print('1. Them mot dien thoai');
            print('2. Cap nhat thong tin dien thoai');
            print('3. Ngung kinh doanh dien thoai');
            print('4. Tim kiem dien thoai');
            print('5. Hien thi danh sach dien thoai');
            print('0. Thoat chuc nang');
            print('Chon chuc nang: ');
            String? input = stdin.readLineSync();
            if (input != null) {
              chucNang = int.tryParse(input) ?? 0;
            }

            switch (chucNang) {
              case 1:
                {
                  print('--- Nhap thong tin dien thoai ---');
                  dienThoai = cuaHang.addNewPhone();
                  listDT.add(dienThoai);
                  break;
                }
              case 2:
                {
                  print('--- Cap nhat thong tin dien thoai ---');
                  print('Nhap vao ma dien thoai : ');
                  String maDT = nhapGiaTri();
                  cuaHang.UpdateInfo(maDT);
                  break;
                }
              case 3:
                {
                  print('--- Ngung kinh doanh dien thoai---');
                  print('Nhap vao ma dien thoai de ngung kinh doanh : ');
                  String maDT = nhapGiaTri();
                  cuaHang.changeStatus(maDT);
                  break;
                }
              case 4:
                {
                  print('---Tim kiem dien thoai---');
                  print('1. Tim kiem theo ma dien thoai');
                  print('2. Tim kiem theo ten dien thoai');
                  print('3. Tim kiem theo hang');
                  print('Chon chuc nang tim kiem : ');

                  String so = nhapGiaTri();
                  int search = int.tryParse(so) ?? 0;
                  if (search == 1) {
                    print('Nhap vao ma dien thoai can tim kiem: ');
                    String maDT = nhapGiaTri();
                    var dt = cuaHang.findPhoneById(maDT);
                    if (dt == null) {
                      print('Khong ton tai dien thoai voi ma : $maDT');
                    } else {
                      dt.HienThiThongTin();
                    }
                  } else if (search == 2) {
                    print('Nhap vao ten dien thoai can tim kiem: ');
                    String tenDT = nhapGiaTri();
                    var dThoai = cuaHang.findPhoneByName(tenDT);
                    if (dThoai == null) {
                      print('Khong ton tai dien thoai voi ten : $tenDT');
                    } else {
                      print('Thong tin dien thoai voi ten : $tenDT');
                      dThoai.HienThiThongTin();
                    }
                  } else if (search == 3) {
                    print('Nhap vao hang sx can tim kiem: ');
                    String hangSx = nhapGiaTri();
                    var list = cuaHang.findPhoneByHangSX(hangSx);

                    if (list == null) {
                      print(
                          'Khong ton tai dien thoai thuoc hang san xuat : $hangSx');
                    } else {
                      print('Thong tin dien thoai thuoc hang : $hangSx');
                      cuaHang.HienThiDanhSachDienThoaiCoThamSo(list);
                    }
                  } else {
                    print('Khong ton tai chuc nang nay');
                  }

                  break;
                }
              case 5:
                {
                  cuaHang.HienThiDanhSachDienThoai();
                  break;
                }
              case 0:
                {
                  break;
                }
              default:
                {
                  print('Chuc nang nay khong ton tai');
                  break;
                }
            }
          } while (chucNang != 0);
          break;
        }
      case 2:
        {
          int chucnang = 0;
          do {
            print('-----Quan ly hoa don -----');
            print('1. Them mot hoa don');
            print('2. Tim kiem hoa don');
            print('3. Hien thi danh sach hoa don');
            print('0. Thoat chuc nang');
            print('Nhap vao chuc nang : ');
            String luaChon = nhapGiaTri();
            chucnang = int.tryParse(luaChon) ?? 0;

            switch (chucnang) {
              case 1:
                {
                  print('----Tao hoa don moi ---');
                  listHD.add(cuaHang.addNewBill());
                  break;
                }
              case 2:
                {
                  print('---Tim kiem hoa don---');
                  print('1. Tim kiem theo ma hoa don');
                  print('2. Tim kiem theo ngay');
                  print('3. Tim kiem theo ten KH');
                  print('Nhap vao chuc nang tim kiem : ');
                  String n = nhapGiaTri();
                  int search = int.tryParse(n) ?? 0;

                  if (search == 1) {
                    print('Nhap ma hoa can tim : ');
                    var mahd = nhapGiaTri();
                    var hD = cuaHang.findBillById(mahd);
                    if (hD == null) {
                      print('Khong ton tai hoa don voi ma : $mahd');
                    } else {
                      print('Thong tin hoa don voi ma: $mahd ');
                      hD.HienThiThongTinHoaDon();
                    }
                  } else if (search == 2) {
                    print('Nhap ngay can tim (dd/mm/yyyy) : ');
                    var ngay = nhapGiaTri();
                    var hoadon = cuaHang.findBillByDate(DateTime.parse(ngay));
                    if (hoadon == null) {
                      print('Khong co hoa don vao ngay $ngay');
                    } else {
                      print('Danh sach hoa don vao ngay $ngay');
                      for (var hoaDon in hoadon) {
                        hoaDon.HienThiThongTinHoaDon();
                      }
                    }
                  } else if (search == 3) {
                    print('Nhap ten KH : ');
                    var tenKH = nhapGiaTri();
                    var hoadon = cuaHang.findBillByClient(tenKH);
                    if (hoadon == null) {
                      print(
                          'Khong ton tai hoa don duoc mua boi khach hang $tenKH');
                    } else {
                      print('Danh sach hoa don theo ten KH : $tenKH');
                      for (var item in hoadon) {
                        item.HienThiThongTinHoaDon();
                      }
                    }
                  } else {
                    print(' Khong ton tai chuc nang');
                  }
                  break;
                }
              case 3:
                {
                  cuaHang.HienThiDanhSachHoaDon(listHD);
                }
            }
          } while (chucnang != 0);
          break;
        }
      case 0:
        {
          print('Thoat chuong trinh.');
          break;
        }
      default:
        {
          print('Chuc nang khong ton tai!');
          break;
        }
    }
  } while (chon != 0);
}
