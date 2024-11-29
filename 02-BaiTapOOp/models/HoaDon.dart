import 'DienThoai.dart';

class Hoadon {
  String _maHD;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _slMua;
  double _giaBanTT;
  String _tenKH;
  String _sdt;
  //constructor
  Hoadon(this._maHD, this._ngayBan, this._dienThoai, this._giaBanTT,
      this._slMua, this._tenKH, this._sdt);

  // Constructor không tham số
  Hoadon.khongThamSo()
      : _maHD = '',
        _tenKH = '',
        _giaBanTT = 0.0,
        _slMua = 0,
        _dienThoai = new DienThoai.khongThamSo(),
        _sdt = '',
        _ngayBan = DateTime.now();

  //Getter
  String get maHD => _maHD;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoai => _dienThoai;
  int get slMua => _slMua;
  double get giaBanTT => _giaBanTT;
  String get tenKH => _tenKH;
  String get sdt => _sdt;
  //Setter
  set maHD(String ma) {
    if (ma.isNotEmpty && RegExp(r'^HD-\d{3}$').hasMatch(ma)) {
      _maHD = ma;
    } else {
      throw ArgumentError(
          'Ma hoa don phai co dinh dang "HD-XXX" va khong duoc rong.');
    }
  }

  set ngayBan(DateTime date) {
    //kiem tra date khong sau ngay hien tai, neu sau kiem tra _ngayBan co sau khong, neu sau thi gan _ngayBan = ngay hien tai

    if (date.isAfter(DateTime.now())) {
      _ngayBan = (_ngayBan.isAfter(DateTime.now())) ? DateTime.now() : _ngayBan;
    } else {
      _ngayBan = date;
    }
  }

  set dienThoai(DienThoai dt) {
    _dienThoai = dt;
  }

  set slMua(int sl) {
    //Kiem tra neu sl nhap vao khong dap ung dk thi ktra _slMua voi 2 dkien neu khong dap ung gan _slMua = 1, nguoc lai sd _slMua
    _slMua = (sl > 0 && sl <= _dienThoai.slTon)
        ? sl
        : (_slMua <= 0 || _slMua > dienThoai.slTon)
            ? 1
            : _slMua;
  }

  set giaBanTT(double gia) {
    _giaBanTT = (gia > 0)
        ? gia
        : (_giaBanTT <= 0)
            ? 1
            : _giaBanTT;
  }

  set tenKH(String ten) {
    _tenKH = (ten.isNotEmpty) ? ten : _tenKH;
  }

  set sdt(String sdt) {
    // kiem tra rong va dinh dang sdt
    if (sdt.isNotEmpty &&
        RegExp(r'^(?:\+84|0)(?:3[2-9]|5[6|8|9]|7[0|6-9]|8[1-5]|9[0-9])\d{7}$')
            .hasMatch(sdt)) {
      _sdt = sdt;
    } else {
      throw ArgumentError('So dien thoai khong hop le');
    }
  }

  //method tinh tong tien hoa don
  double tongTien() {
    return this._giaBanTT * this._slMua;
  }

  //method loi nhuan thuc te
  double tinhLoiNhuanTT() {
    return this._slMua * (this._giaBanTT - this._dienThoai.giaNhap);
  }

  //method hien thi thong tin hoa don
  void HienThiThongTinHoaDon() {
    print('Ma hoa don : $_maHD');
    print('Ngay ban : $_ngayBan');
    print('Dien thoai duoc ban :');
    this._dienThoai.HienThiThongTin();
    print('So luong mua : $_slMua');
    print('Gia ban thuc te : $_giaBanTT');
    print('Ten khach hang : $_tenKH');
    print('So dien thoai khach hang : $_sdt');
  }
}
