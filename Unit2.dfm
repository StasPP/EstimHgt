object Form2: TForm2
  Left = 487
  Top = 306
  BorderStyle = bsDialog
  Caption = #1042#1099#1074#1077#1089#1090#1080' '#1075#1088#1072#1092#1080#1082
  ClientHeight = 408
  ClientWidth = 220
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button2: TButton
    Left = 8
    Top = 247
    Width = 201
    Height = 33
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1075#1088#1072#1092#1080#1082' '#1072#1073#1089#1086#1083#1102#1090#1085#1099#1093' '#1074#1099#1089#1086#1090' ('#1074#1099#1089#1086#1090#1085#1099#1081' '#1087#1088#1086#1092#1080#1083#1100')'
    TabOrder = 0
    WordWrap = True
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 207
    Width = 201
    Height = 33
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1075#1088#1072#1092#1080#1082' '#1091#1082#1083#1086#1085#1077#1085#1080#1081
    TabOrder = 1
    WordWrap = True
    OnClick = Button3Click
  end
  object Button1: TButton
    Left = 8
    Top = 167
    Width = 201
    Height = 33
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1075#1088#1072#1092#1080#1082' '#1074#1099#1089#1086#1090' '#1085#1072#1076' '#1079#1077#1084#1085#1086#1081' '#1087#1086#1074#1077#1088#1093#1085#1086#1089#1090#1100#1102
    TabOrder = 2
    WordWrap = True
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 201
    Height = 73
    Caption = #1044#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1075#1088#1072#1092#1080#1082#1072
    ItemIndex = 0
    Items.Strings = (
      #1042#1099#1073#1088#1072#1085#1085#1099#1081' '#1084#1072#1088#1096#1088#1091#1090
      #1042#1077#1089#1100' '#1087#1086#1083#1077#1090)
    TabOrder = 3
  end
  object RG2: TRadioGroup
    Left = 8
    Top = 87
    Width = 201
    Height = 74
    Caption = #1054#1089#1100' '#1072#1073#1089#1094#1080#1089#1089
    ItemIndex = 1
    Items.Strings = (
      #1055#1088#1086#1083#1086#1078#1077#1085#1080#1077
      #1042#1088#1077#1084#1103)
    TabOrder = 4
    OnClick = RG2Click
  end
  object Button4: TButton
    Left = 8
    Top = 286
    Width = 201
    Height = 33
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1075#1088#1072#1092#1080#1082' '#1087#1091#1090#1077#1074#1086#1081' '#1089#1082#1086#1088#1086#1089#1090#1080
    Enabled = False
    TabOrder = 5
    WordWrap = True
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 325
    Width = 201
    Height = 33
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1075#1088#1072#1092#1080#1082' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1089#1087#1091#1090#1085#1080#1082#1086#1074
    Enabled = False
    TabOrder = 6
    WordWrap = True
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 364
    Width = 201
    Height = 33
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1075#1088#1072#1092#1080#1082' '#1075#1077#1086#1084#1077#1090#1088#1080#1095#1077#1089#1082#1086#1075#1086' '#1092#1072#1082#1090#1086#1088#1072' (PDOP)'
    Enabled = False
    TabOrder = 7
    WordWrap = True
    OnClick = Button6Click
  end
end
