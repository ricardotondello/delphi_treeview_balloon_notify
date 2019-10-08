object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'TreeView'
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
  end
  object btGerarTreeView: TButton
    Left = 8
    Top = 360
    Width = 151
    Height = 25
    Caption = 'Gerar TreeView com Ballon'
    TabOrder = 1
    OnClick = btGerarTreeViewClick
  end
  object btGerarTreeViewImage: TButton
    Left = 168
    Top = 360
    Width = 151
    Height = 25
    Caption = 'Gerar TreeView com Imagem'
    TabOrder = 2
    OnClick = btGerarTreeViewImageClick
  end
  object btImagemBallon: TButton
    Left = 325
    Top = 360
    Width = 218
    Height = 25
    Caption = 'Gerar TreeView com Imagem + Ballon'
    TabOrder = 3
    OnClick = btImagemBallonClick
  end
end
