object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 393
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView
    Left = 6
    Top = 4
    Width = 539
    Height = 345
    Indent = 19
    TabOrder = 0
    OnCustomDrawItem = TreeView1CustomDrawItem
  end
  object Button1: TButton
    Left = 8
    Top = 360
    Width = 87
    Height = 25
    Caption = 'Gerar TreeView'
    TabOrder = 1
    OnClick = Button1Click
  end
end
