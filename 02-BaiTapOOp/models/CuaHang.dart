import 'dart:io';

import 'DienThoai.dart';
import 'HoaDon.dart';

class CuaHang {
  String _tenCH;
  String _diaChi;
  List<DienThoai> _listDT;
  List<Hoadon> _listHD;
  //constructor
  CuaHang(this._tenCH, this._diaChi, this._listDT, this._listHD);
  //getter
  String get tenCH => _tenCH;
  String get diaChi => _diaChi;
  List<DienThoai> get listDT => _listDT;
  List<Hoadon> get listHD => _listHD;
  //setter
  set tenCH(String ten) {
    _tenCH = (ten.isNotEmpty) ? ten : _tenCH;
  }

  set diaChi(String diaChi) {
    _diaChi = (diaChi.isNotEmpty) ? diaChi : _diaChi;
  }

  set listDT(List<DienThoai> list) {
    _listDT = (list.isNotEmpty) ? list : _listDT;
  }

  set listHD(List<Hoadon> list) {
    _listHD = (list.isNotEmpty) ? list : _listHD;
  }

  //Phuong thuc kiem tra gia tri nhap vao
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

  //Cac phuong thuc quan ly dien thoai
  //1.Them dien thoai moi
  DienThoai addNewPhone() {
    DienThoai dt = new DienThoai.khongThamSo();
    //Nhap ma dt voi dieu kien ma dt la duy nhat
    //trang thai bang 0 la da ton tai ma dt trong danh sach
    int status = 0;
    do {
      print('Nhap vao ma dien thoai : ');
      String ma = nhapGiaTri();
      //Kiem tra dinh dang ma DT
      if (RegExp(r'^DT-\d{3}$').hasMatch(ma) == false) {
        print(
            'Ma dien thoai phai co dinh dang "DT-XXX" va khong duoc de trong.');
      } else {
        //Kiem tra maDT da ton tai chua
        if (findPhoneById(ma) != null) {
          print('Ma dien thoai khong the trung, vui long nhap lai !!!');
        } else {
          //Ma chua ton tai trong danh sach, gan gia tri cho dien thoai
          dt.maDT = ma;
          status = 1;
        }
      }
    } while (status == 0);

    //Nhap ten dt
    print('Nhap vao ten dien thoai : ');
    dt.tenDT = nhapGiaTri();
    //Nhap hang sx
    print('Nhap vao hang san xuat : ');
    dt.hangSX = nhapGiaTri();

    //Nhap gia va ep kieu double
    print('Nhap vao gia nhap : ');
    String giaN = nhapGiaTri();
    //Neu gia tri nhap vao khong hop le, gan giaNhap = 1;
    dt.giaNhap = double.tryParse(giaN) ?? 1;

    //Nhap gia va ep kieu double
    print('Nhap vao gia ban : ');
    String giaB = nhapGiaTri();
    //gan giaBan = giaNhap+50 neu thong tin nhap vao khong the parse ve double
    dt.giaBan = double.tryParse(giaB) ?? dt.giaNhap + 50;

    //Nhap sl va ep kieu double

    print('Nhap vao so luong ton kho : ');
    String sl = nhapGiaTri();
    // Neu gia tri slTon khong khong hop le thi gan mac dinh slTon = 1
    dt.slTon = int.tryParse(sl) ?? 1;

    //Nhap trang thai
    print('Nhap vao trang thai (1/0) : ');
    String inputStatus = nhapGiaTri();

    dt.status = (int.tryParse(inputStatus) == 1) ? true : false;
    return dt;
  }

  //2.Cap nhat thong tin
  void UpdateInfo(String maDT) {
    //Tim kiem dien thoai theo ma
    var phone = findPhoneById(maDT);
    if (phone == null) {
      print('Khong tim thay dien thoai voi ma: $maDT');
      return;
    } else {
      print('Thong tin hien tai : ');
      phone.HienThiThongTin();
      print('Nhap cap nhat thong tin :');
      //Cap nhap hang san xuat
      print('Nhap hang sx moi : ');
      phone.hangSX = nhapGiaTri();
      //Cap nhat ten dien thoai
      print('Nhap ten moi : ');
      phone.tenDT = nhapGiaTri();
      //Cap nhat gia nhap
      print('Nhap gia nhap moi : ');
      phone.giaNhap = double.tryParse(nhapGiaTri()) ?? phone.giaNhap;
      //Cap nhat gia ban
      print('Nhap gia ban moi : ');
      phone.giaBan = double.tryParse(nhapGiaTri()) ?? phone.giaBan;

      //Cap nhat sl Ton
      print('Nhap so luong ton moi : ');
      phone.slTon = int.tryParse(nhapGiaTri()) ?? phone.slTon;

      //Cap nhat trang thai
      print('Nhap vao trang thai moi (1/0) : ');
      String inputStatus = nhapGiaTri();

      phone.status = (int.tryParse(inputStatus) == 1) ? true : false;
      print('Thong tin dien thoai da duoc cap nhat thanh cong!');
      phone.HienThiThongTin(); //Hien thi thong tin sau cap nhat
    }
  }

  //3. tim kiem dien thoai theo ma dt
  DienThoai? findPhoneById(String ma) {
    for (var dt in _listDT) {
      if (dt.maDT == ma) {
        return dt;
      }
    }
    return null;
  }

  //Tim kiem danh sach dien thoai theo ten
  DienThoai? findPhoneByName(String tendt) {
    List<DienThoai> list = [];
    for (var dt in _listDT) {
      if (dt.tenDT == tendt) {
        return dt;
      }
    }

    return null;
  }

  //Tim kiem danh sach dien thoai theo hang sx, 1 hang sx nhieu dien thoai
  List<DienThoai>? findPhoneByHangSX(String tendt) {
    List<DienThoai> list = [];
    for (var dt in _listDT) {
      if (dt.hangSX == tendt) {
        list.add(dt);
      }
    }
    if (list.isNotEmpty) {
      return list;
    }
    return null;
  }

  //4.Hien thi danh sach dt
  void HienThiDanhSachDienThoai() {
    print('DANH SACH DIEN THOAI TRONG CUA HANG');
    for (var dt in _listDT) {
      dt.HienThiThongTin();
      print('==============');
    }
  }

  //.Hien thi danh sach dt co tham so
  void HienThiDanhSachDienThoaiCoThamSo(List<DienThoai> list) {
    for (var dt in list) {
      dt.HienThiThongTin();
      print('==============');
    }
  }

  //Ngung kinh doanh dien thoai
  void changeStatus(String maDT) {
    var dt = findPhoneById(maDT);
    if (dt == null) {
      print('Khong tim thay dien thoai voi ma: $maDT');
      return;
    }
    dt.status = false;
    print('Thay doi trang thai ngung kinh doanh thanh cong ');
  }

  //Cac phuong thuc quan ly hoa don
  //1.Tao hoa don
  Hoadon addNewBill() {
    //Nhap ma hoa don
    Hoadon hd = new Hoadon.khongThamSo();

    int status = 0;
    do {
      print('Nhap ma hoa don:');
      String ma = nhapGiaTri();
      //Kiem tra dinh dang ma HD
      if (RegExp(r'^HD-\d{3}$').hasMatch(ma) == false) {
        print('Ma hoa don phai co dinh dang "HD-XXX" va khong duoc de trong.');
      } else {
        //Kiem tra maDT da ton tai chua
        if (findBillById(ma) != null) {
          print('Ma hoa don khong the trung, vui long nhap lai !!!');
        } else {
          //Ma chua ton tai trong danh sach, gan gia tri cho hoa don
          hd.maHD = ma;
          status = 1;
        }
      }
    } while (status == 0);
    status = 0;
    //Nhap ten kh
    print('Nhap ten khach hang:');
    hd.tenKH = nhapGiaTri();

    do {
      print('Nhap vao ma dien thoai : ');
      var dt = findPhoneById(nhapGiaTri());
      if (dt != null) {
        hd.dienThoai = dt;
        status = 1;
      } else {
        print('Ma dien thoai khong hop le!!!');
      }
    } while (status == 0);
    //Nhap sl mua
    print('Nhap so luong san pham:');
    hd.slMua = int.tryParse(nhapGiaTri()) ?? 1;
    var dt = findPhoneById(hd.dienThoai.maDT);
    dt?.slTon -= hd.slMua;

    //Nhap ngay ban
    print('Nhap ngay ban : ');

    hd.ngayBan = DateTime.tryParse(nhapGiaTri()) ?? DateTime.now();
    status = 0;
    //Nhap ma dt

    status = 0;
    //Nhap gia ban neu khong hop le se gan = giaBan cua DThoai
    print('Nhap gia ban thuc te:');
    hd.giaBanTT = double.tryParse(nhapGiaTri()) ?? hd.dienThoai.giaBan;
    //Nhap sdt dung dinh dang
    do {
      print('Nhap vao so dien thoai ');
      String sdt = nhapGiaTri();
      if (!RegExp(
              r'^(?:\+84|0)(?:3[2-9]|5[6|8|9]|7[0|6-9]|8[1-5]|9[0-9])\d{7}$')
          .hasMatch(sdt)) {
        print('So dien thoai chua dung dinh dang, vui long nhap lai !!');
      } else {
        hd.sdt = sdt;
        status = 1;
      }
    } while (status == 0);
    return hd;
  }

  //2.Tim kiem hoa don theo ma hd
  Hoadon? findBillById(String id) {
    for (var bill in _listHD) {
      if (bill.maHD == id) {
        return bill;
      }
    }
    return null;
  }

  //Tim kiem hoa don theo ngay
  List<Hoadon>? findBillByDate(DateTime date) {
    List<Hoadon> list = [];
    for (var bill in _listHD) {
      if (bill.ngayBan == date) {
        list.add(bill);
      }
    }
    //list rong thi tra ve null
    if (list.isNotEmpty) {
      return list;
    }
    return null;
  }

  //Tim kiem hoa don theo KH
  List<Hoadon>? findBillByClient(String tenKH) {
    List<Hoadon> list = [];
    for (var bill in _listHD) {
      if (bill.tenKH == tenKH) {
        list.add(bill);
      }
    }
    //list rong thi tra ve null
    if (list.isNotEmpty) {
      return list;
    }
    return null;
  }

  //Hien thi danh sach hoa don
  void HienThiDanhSachHoaDon(List<Hoadon> list) {
    print('DANH SACH HOA DON TRONG CUA HANG');
    for (var bill in list) {
      bill.HienThiThongTinHoaDon();
      print('=========');
    }
  }
}
