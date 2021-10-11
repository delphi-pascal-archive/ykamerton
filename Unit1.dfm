object Form1: TForm1
  Left = 227
  Top = 131
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'yKamerton'
  ClientHeight = 243
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    0000010004000000000000000000000000000000000010000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0AAAAAA00000000AAAAAA000A00000AAAAAA00000A000AAAAAAA07000AA00A00
    0AAA0F000AA0A00000AAA0000AAAA07000AAAAAA0AAAA0F000AAAAAA0AAAAA00
    00AAAA000AAAAAAAA0AA00AA0AAAAAAAA000AA000AAA0AAAA0AA00000AA00AAA
    A00000000AA000AAA00000AAAA00000AA000AAAAA00000000AAAAAA00000F81F
    0000E0070000C003000080010000800100000000000000000000000000000000
    000000000000000000008001000080010000C0030000E0070000F81F0000}
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 72
    Top = 183
    Width = 210
    Height = 16
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1086#1074#1090#1086#1088#1086#1074':     1 '#1088#1072#1079
  end
  object Label2: TLabel
    Left = 230
    Top = 4
    Width = 136
    Height = 16
    Caption = 'malto: yakima@ukr.net'
  end
  object Button1: TButton
    Left = 72
    Top = 208
    Width = 105
    Height = 25
    Caption = 'Play'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 208
    Width = 97
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = Button2Click
  end
  object r1: TRadioGroup
    Left = 8
    Top = 8
    Width = 57
    Height = 225
    Caption = ' '#1053#1086#1090#1072' '
    ItemIndex = 0
    Items.Strings = (
      'A'
      'B'
      'C'
      'D'
      'E'
      'F'
      'G')
    TabOrder = 2
    OnClick = r1Click
  end
  object r2: TRadioGroup
    Left = 72
    Top = 88
    Width = 177
    Height = 49
    Caption = ' '#1040#1083#1100#1090#1077#1088#1072#1094#1080#1103' '
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      ''
      '#'
      'b')
    TabOrder = 3
    OnClick = r2Click
  end
  object r3: TRadioGroup
    Left = 72
    Top = 24
    Width = 297
    Height = 57
    Caption = ' '#1054#1082#1090#1072#1074#1072' '
    Columns = 6
    ItemIndex = 0
    Items.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4'
      '5')
    TabOrder = 4
    OnClick = r3Click
  end
  object tb: TTrackBar
    Left = 72
    Top = 151
    Width = 302
    Height = 18
    Max = 60
    Min = 1
    Position = 1
    TabOrder = 5
    ThumbLength = 12
    OnChange = tbChange
  end
  object le: TLabeledEdit
    Left = 256
    Top = 112
    Width = 113
    Height = 25
    AutoSize = False
    BevelInner = bvSpace
    BevelKind = bkSoft
    BevelOuter = bvSpace
    Color = clCream
    EditLabel.Width = 76
    EditLabel.Height = 16
    EditLabel.Caption = #1057#1080#1085#1090#1072#1082#1089#1080#1089':'
    ReadOnly = True
    TabOrder = 6
  end
end
