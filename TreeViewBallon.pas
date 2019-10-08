unit TreeViewBallon;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    TreeView1: TTreeView;
    btGerarTreeView: TButton;
    btGerarTreeViewImage: TButton;
    btImagemBallon: TButton;
    procedure btGerarTreeViewClick(Sender: TObject);
    procedure btGerarTreeViewImageClick(Sender: TObject);
    procedure btImagemBallonClick(Sender: TObject);
  private
    procedure GerarTreeView;
    procedure TreeView1CustomDrawItem_Ballon(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TreeView1CustomDrawItem_Image(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TreeView1CustomDrawItem_Image_Ballon(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btGerarTreeViewClick(Sender: TObject);
begin
  TreeView1.OnCustomDrawItem := TreeView1CustomDrawItem_Ballon;
  GerarTreeView;
end;

procedure TfrmMain.btGerarTreeViewImageClick(Sender: TObject);
begin
  TreeView1.OnCustomDrawItem := TreeView1CustomDrawItem_Image;
  GerarTreeView;
end;

procedure TfrmMain.btImagemBallonClick(Sender: TObject);
begin
  TreeView1.OnCustomDrawItem := TreeView1CustomDrawItem_Image_Ballon;
  GerarTreeView;
end;

procedure TfrmMain.GerarTreeView;

  function Randomstring(strLen: Integer): string;
  var
    str: string;
  begin
    if strLen = 0 then
      strLen := 1;

    str := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVW XYZ';
    Result := '';
    repeat
      Result := Result + str[Random(Length(str)) + 1];
    until (Length(Result) = strLen)
  end;

Var
  Node, NodeChild: TTreeNode;
  i, j, k, r: Integer;
  sString: String;
begin
  TreeView1.Items.Clear;
  TreeView1.Items.BeginUpdate;
  try
   for i := 1 to 5 do
   begin
    Node := TreeView1.Items.Add(nil,'My Root Node ' + IntToStr(i));
    Node.ImageIndex := 0;

    for j := 1 to 3 do
    begin
      NodeChild := TreeView1.Items.AddChild(Node, 'Child ' + IntToStr(j));

      for k := 1 to 2 do
      begin
        r := Random(20);
        sString := Randomstring(r);
        TreeView1.Items.AddChild(NodeChild, 'Neto ' + sString);
      end;
    end;
   end;
  finally
    TreeView1.Items.EndUpdate;
  end;

end;

procedure TfrmMain.TreeView1CustomDrawItem_Ballon(Sender: TCustomTreeView; Node: TTreeNode;
  State: TCustomDrawState; var DefaultDraw: Boolean);
var
  bmp : TBitmap;
  txtrect, fullrect : TRect;
  nTamanho: Integer;
begin
  if Pos('Neto ', Node.text) <= 0 then
    Exit;
  nTamanho := 13;

  txtrect := Node.DisplayRect(True);
  fullrect := Node.DisplayRect(False);
  txtrect.Right := fullrect.Right;

  bmp := TBitmap.Create;
  try
    bmp.Height := nTamanho;
    bmp.Width := nTamanho;
    with bmp.Canvas do
    begin
      Pen.Width := 1;
      Pen.Color := clBlue;
      Brush.Color := clBlue;
      Ellipse(0, 0, nTamanho, nTamanho);

      Font.Size := 7;
      Font.Color := clWhite;
      Font.Style := [fsBold];
      TextOut(4, 1, IntToStr(Random(10)));
    end;
    Sender.Canvas.Draw(txtrect.width, txtrect.Top, bmp);
  finally
    FreeAndNil(bmp);
  end;

end;

procedure TfrmMain.TreeView1CustomDrawItem_Image(Sender: TCustomTreeView; Node: TTreeNode;
  State: TCustomDrawState; var DefaultDraw: Boolean);
var
  bmp : TBitmap;
  txtrect, fullrect : TRect;
  nTamanho: Integer;
  oPicture: TPicture;
  sFilePath: String;
begin
  if Pos('Neto ', Node.text) <= 0 then
    Exit;
  nTamanho := 13;

  txtrect := Node.DisplayRect(True);
  fullrect := Node.DisplayRect(False);
  txtrect.Right := fullrect.Right;
  sFilePath := ExtractFilePath(Application.ExeName);

  oPicture := TPicture.Create;
  bmp := TBitmap.Create;
  try
    oPicture.LoadFromFile( sFilePath + '\audioevideo.bmp');
    bmp.Height := nTamanho;
    bmp.Width := nTamanho;
    bmp.Canvas.Draw(0, 0, oPicture.Graphic);

    Sender.Canvas.Draw(txtrect.width, txtrect.Top, bmp);
  finally
    FreeAndNil(bmp);
    FreeAndNil(oPicture);
  end;

end;
procedure TfrmMain.TreeView1CustomDrawItem_Image_Ballon(Sender: TCustomTreeView; Node: TTreeNode;
  State: TCustomDrawState; var DefaultDraw: Boolean);
var
  bmp : TBitmap;
  txtrect, fullrect : TRect;
  nTamanho: Integer;
  oPicture: TPicture;
  sFilePath: String;
begin
  if Pos('Neto ', Node.text) <= 0 then
    Exit;
  nTamanho := 18;

  txtrect := Node.DisplayRect(True);
  fullrect := Node.DisplayRect(False);
  txtrect.Right := fullrect.Right;

  sFilePath := ExtractFilePath(Application.ExeName);

  oPicture := TPicture.Create;

  bmp := TBitmap.Create;
  try
    bmp.Height := nTamanho;
    bmp.Width := nTamanho;
    oPicture.LoadFromFile( sFilePath + '\audioevideo.bmp');
    with bmp.Canvas do
    begin
      Draw(0, 0, oPicture.Graphic);
      Pen.Width := 1;
      Pen.Color := clBlue;
      Brush.Color := clBlue;
      Ellipse(8, 0, 18, 10);

      Font.Size := 7;
      Font.Color := clWhite;
      TextOut(11, 0, IntToStr(Random(10)));

    end;
    Sender.Canvas.Draw(txtrect.width, txtrect.Top, bmp);
  finally
    FreeAndNil(bmp);
    FreeAndNil(oPicture);
  end;


end;

end.

