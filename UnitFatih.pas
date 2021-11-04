unit UnitFatih;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, zkemkeeper_TLB,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  sapi : TCZKEM;
  is_konek : boolean;
  is_baca : boolean;
  enroll_number: WideString;
  verify_mode,inout_mode,work_code : integer;
  tahun,bulan,hari,jam,menit,detik : integer;
  machine_number : integer;
  machine_ip : string;
  machine_port : integer;
begin

  machine_number := 1;
  machine_ip := '192.168.0.250';
  machine_port := 5005;

  sapi := TCZKEM.Create(nil);

  is_konek:= sapi.Connect_Net(machine_ip,machine_port);
  if is_konek=false then
  begin
    memo1.Lines.Add('gagal ndan');
    exit;
  end;
  if is_konek=true then
  begin
    memo1.Lines.Add('koneksi berhasil');
  end;

  is_baca:=sapi.ReadGeneralLogData(1);
  if is_baca=false then
  begin
    memo1.Lines.Add('gagal baca mesin');
    exit;
  end;
  if is_baca=true then
  begin
    while sapi.SSR_GetGeneralLogData(machine_number,enroll_number,verify_mode,inout_mode,tahun,bulan,hari,jam,menit,detik,work_code) do
    begin
      //todo masukkan hasil pembacaan ke json
      //kirim json ke server
    end;
  end;

end;

end.
