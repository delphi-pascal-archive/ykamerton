unit Unit1;

interface

uses
  Sysutils, Classes, Forms, player, StdCtrls, Controls, ExtCtrls,
  ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    r1: TRadioGroup;
    r2: TRadioGroup;
    r3: TRadioGroup;
    tb: TTrackBar;
    Label1: TLabel;
    le: TLabeledEdit;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure tbChange(Sender: TObject);
    procedure r1Click(Sender: TObject);
    procedure r3Click(Sender: TObject);
    procedure r2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure syntax;
  end;

var
  Form1: TForm1;
  nota, alt, okt, syn:string;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var 
  Organ:TMusicPlayer;
  d:integer;
begin 
  Organ:=TMusicPlayer.Create;
  nota:=r1.Items[r1.ItemIndex];
  alt:=r2.Items[r2.ItemIndex];
  okt:=r3.Items[r3.ItemIndex];
      for d:=1 to tb.Position do
       begin
        Organ.Play(nota+alt+okt+',<');
       end; 
  Organ.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm1.syntax;
begin
 syn:=r1.Items[r1.ItemIndex]
        +r2.Items[r2.ItemIndex]
        +r3.Items[r3.ItemIndex]
        +'     x'
        +inttostr(tb.Position);
end;

procedure TForm1.tbChange(Sender: TObject);
begin
  label1.Caption:='Количество повторов:    '+inttostr(tb.Position)+' раз';
  syntax;
  le.Text:=syn;
end;

procedure TForm1.r1Click(Sender: TObject);
begin
syntax;
le.Text:=syn;
end;

procedure TForm1.r3Click(Sender: TObject);
begin
syntax;
le.Text:=syn;
end;

procedure TForm1.r2Click(Sender: TObject);
begin
syntax;
le.Text:=syn;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 syntax;
 le.Text:=syn;
end;

end.
