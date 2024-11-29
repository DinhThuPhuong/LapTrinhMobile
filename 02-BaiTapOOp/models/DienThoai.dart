class DienThoai {
  String _maDT;
  String _tenDT;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _slTon;
  bool _status;

  //constructor
  DienThoai(this._maDT, this._tenDT, this._giaNhap, this._giaBan,
      this._hangSanXuat, this._slTon, this._status);

  // Constructor không có tham số
  DienThoai.khongThamSo()
      : _maDT = '',
        _tenDT = '',
        _hangSanXuat = '',
        _giaNhap = 0.0,
        _giaBan = 0.0,
        _slTon = 0,
        _status = false;

  //getter
  String get maDT => _maDT;
  String get tenDT => _tenDT;
  String get hangSX => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  bool get status => _status;
  int get slTon => _slTon;
  //Setter
  set maDT(String ma) {
    if (ma.isNotEmpty && RegExp(r'^DT-\d{3}$').hasMatch(ma)) {
      _maDT = ma;
    } else {
      print('Ma dien thoai phai co dinh dang "DT-XXX" va khong duoc de trong.');
    }
  }

  set tenDT(String ten) {
    _tenDT = (ten.isNotEmpty) ? ten : _tenDT;
  }

  set hangSX(String hangSX) {
    _hangSanXuat = (hangSX.isNotEmpty) ? hangSX : _hangSanXuat;
  }

  set giaNhap(double gNhap) {
    _giaNhap = (gNhap > 0)
        ? gNhap
        : (_giaNhap <= 0.0)
            ? 1
            : _giaNhap;
  }

  //Neu gia ban nhap vao khong dap ung dk thi kiem tra _giaBan co vi pham dk khong, neu co set _giaBan = _giaNhap+50, nguoc lai sd giaBan cu;
  set giaBan(double gBan) {
    _giaBan = (gBan > 0 && gBan > _giaNhap)
        ? gBan
        : (_giaBan <= 0 || _giaBan <= _giaNhap)
            ? _giaNhap + 50
            : _giaBan;
  }

  //Neu gia tri dc gan khong dap ung dk >= 0 thi kiem tra _slTon <= 0? neu dung thi gan slTon = 1, nguoc lai sd slTon cu
  set slTon(int sl) {
    _slTon = (sl >= 0)
        ? sl
        : (_slTon <= 0)
            ? 1
            : _slTon;
  }

  set status(bool status) {
    _status = status;
  }

  //method hienthi
  void HienThiThongTin() {
    print('Ma dien thoai : $_maDT');
    print('Ten dien thoai : $_tenDT');
    print('Hang San Xuat : $_hangSanXuat');
    print('Gia Nhap : $_giaNhap');
    print('Gia Ban : $_giaBan');
    print('So luong ton : $_slTon');
    print('Trang thai : $_status');
  }

  //method tinh loi nhuan
  double tinhLoiNhuan() {
    return this._slTon * (this._giaBan - this._giaNhap);
  }

  //method kiem tra con hang va dang kinh doanh
  bool KiemTraCoTheBan() {
    if (_status == true && _slTon > 0) {
      return true;
    } else {
      return false;
    }
  }
}
