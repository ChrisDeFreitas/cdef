object frmMain: TfrmMain
  Left = 228
  Top = 116
  Width = 513
  Height = 429
  Caption = 'Math Questions'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000080808800800000000000000000080808080880800000000000000000
    0000088088888808008000000000000000088088000088808000000000000000
    080088800AA08880000000000000000080888080AA0088888080000000000008
    08880800A0080800080000000000008088080080A08000660000000000000000
    80800800A00006000000000000000080000000000A0006000200000000000000
    000000000AA000602A0000000000000000000000AAA02000A000000000000000
    00000002AA22A00A000000000000000000002AAAAA2AA0A0000A000000000000
    0BBBB22AA2AAA0A00002000000000000B00000B2AA2AA2A2A02000000000000A
    000000B2AAA22AA2A0200000000000A00000000B2AAAA22AA0000000AA000000
    0000000BB2222AA2AA20000AAAA0000000000000BBBBB22A2A20A20A0AB00000
    0000000000000BB2AA0AA0AA2BB00000000000000000000B2A2A2AAAAB200000
    0000000000000000BAAAAA2ABB0000000000000000000000B2A202ABB0000000
    0000000000000000B2A0D0BB2000000000000000000000000AA01AB200000000
    000000000000000000AAABB000000000000000000000000000BBBB0000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFF5
    37FFFEAA5FFFFF902DFFFE4017FFFB001FFFF44105FFE8A283FFD2C187FFF5A3
    1BFFDFF111FFFFF001FFFFE003FFFE00067FF8000C7FF000047FE00000FFC780
    00F38FC001C19FC000003FE000007FF00000FFFF8000FFFFE001FFFFE003FFFF
    E003FFFFF007FFFFF80FFFFFF81FFFFFFC3FFFFFFFFFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PgCtrl: TRzPageControl
    Left = 0
    Top = 55
    Width = 505
    Height = 296
    ActivePage = pgMult
    Align = alClient
    HotTrack = False
    ShowCardFrame = False
    ShowFocusRect = False
    ShowShadow = False
    TabIndex = 3
    TabOrder = 0
    TabOrientation = toBottom
    UseGradients = False
    FixedDimension = 19
    object pgIndex: TRzTabSheet
      Caption = 'pgIndex'
      object RzLabel3: TRzLabel
        Left = 40
        Top = 32
        Width = 136
        Height = 20
        Caption = 'Select Operation'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextStyle = tsRecessed
      end
      object cbAdd: TRzRadioButton
        Left = 64
        Top = 72
        Width = 217
        Height = 17
        Caption = 'Addition'
        Checked = True
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 0
        TabStop = True
      end
      object cbSub: TRzRadioButton
        Left = 64
        Top = 104
        Width = 265
        Height = 17
        Caption = 'Subtraction'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 1
      end
      object cbMult: TRzRadioButton
        Left = 64
        Top = 136
        Width = 281
        Height = 17
        Caption = 'Multiplication'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 2
      end
      object RzRadioButton4: TRzRadioButton
        Left = 64
        Top = 168
        Width = 217
        Height = 17
        Caption = 'Division'
        Enabled = False
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 3
      end
    end
    object pgAdd: TRzTabSheet
      Caption = 'pgAdd'
      object RzLabel2: TRzLabel
        Left = 40
        Top = 32
        Width = 67
        Height = 20
        Caption = 'Addition'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextStyle = tsRecessed
      end
      object Add1: TRzRadioButton
        Left = 64
        Top = 72
        Width = 241
        Height = 17
        Caption = 'Level 1 (numbers between 1 and 5)'
        Checked = True
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 0
        TabStop = True
        OnClick = Add6Click
      end
      object Add3: TRzRadioButton
        Left = 64
        Top = 136
        Width = 281
        Height = 17
        Caption = 'Level 3 (numbers beween 1 and 20)'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 1
        OnClick = Add6Click
      end
      object Add4: TRzRadioButton
        Left = 64
        Top = 168
        Width = 257
        Height = 17
        Caption = 'Level 4 (numbers between 1 and 99)'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 2
        OnClick = Add6Click
      end
      object Add2: TRzRadioButton
        Left = 64
        Top = 104
        Width = 265
        Height = 17
        Caption = 'Level 2 (numbers between 1 and 9)'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 3
        OnClick = Add6Click
      end
      object Add5: TRzRadioButton
        Left = 64
        Top = 200
        Width = 313
        Height = 17
        Caption = 'Level 5 (numbers between 1 and 2000)'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 4
        OnClick = Add6Click
      end
      object spAdd: TRzSpinEdit
        Left = 218
        Top = 226
        Width = 47
        Height = 21
        BlankValue = 1
        ButtonWidth = 20
        Max = 9
        Min = 1
        Value = 1
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 5
        Visible = False
      end
      object Add6: TRzRadioButton
        Left = 64
        Top = 230
        Width = 145
        Height = 17
        Caption = 'Focus on a number'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 6
        OnClick = Add6Click
      end
      object cbAddReview: TRzRadioButton
        Left = 64
        Top = 257
        Width = 313
        Height = 17
        Caption = 'Review the last questions  assigned'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 7
        OnClick = Add6Click
      end
    end
    object pgSub: TRzTabSheet
      Caption = 'pgSub'
      object RzLabel4: TRzLabel
        Left = 40
        Top = 32
        Width = 94
        Height = 20
        Caption = 'Subtraction'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextStyle = tsRecessed
      end
      object cbSub1: TRzRadioButton
        Left = 64
        Top = 72
        Width = 257
        Height = 17
        Caption = 'Level 1 (numbers between 1 and 5)'
        Checked = True
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 0
        TabStop = True
        OnClick = cbSub6Click
      end
      object cbSub3: TRzRadioButton
        Left = 64
        Top = 136
        Width = 281
        Height = 17
        Caption = 'Level 3 (numbers beween 1 and 20)'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 1
        OnClick = cbSub6Click
      end
      object cbSub4: TRzRadioButton
        Left = 64
        Top = 168
        Width = 289
        Height = 17
        Caption = 'Level 4 (numbers between 1 and 100)'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 2
        OnClick = cbSub6Click
      end
      object cbSub2: TRzRadioButton
        Left = 64
        Top = 104
        Width = 265
        Height = 17
        Caption = 'Level 2 (numbers between 1 and 9)'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 3
        OnClick = cbSub6Click
      end
      object cbSub5: TRzRadioButton
        Left = 64
        Top = 200
        Width = 313
        Height = 17
        Caption = 'Level 5 (numbers between 1 and 2000)'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 4
        OnClick = cbSub6Click
      end
      object cbSub6: TRzRadioButton
        Left = 64
        Top = 229
        Width = 145
        Height = 17
        Caption = 'Focus on a number'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 5
        OnClick = cbSub6Click
      end
      object spSub: TRzSpinEdit
        Left = 218
        Top = 227
        Width = 47
        Height = 21
        BlankValue = 1
        ButtonWidth = 20
        Max = 9
        Min = 1
        Value = 1
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 6
        Visible = False
      end
      object cbSubReview: TRzRadioButton
        Left = 64
        Top = 257
        Width = 313
        Height = 17
        Caption = 'Review the last questions  assigned'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 7
        OnClick = cbSub6Click
      end
    end
    object pgMult: TRzTabSheet
      Caption = 'pgMult'
      object RzLabel5: TRzLabel
        Left = 40
        Top = 32
        Width = 106
        Height = 20
        Caption = 'Mulitplication'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextStyle = tsRecessed
      end
      object lblMultBetween: TLabel
        Left = 294
        Top = 108
        Width = 43
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'and'
        Visible = False
      end
      object cbMultReview: TRzRadioButton
        Left = 64
        Top = 146
        Width = 313
        Height = 17
        Caption = 'Review the last questions assigned'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 0
        OnClick = cbMult1Click
      end
      object cbMult1: TRzRadioButton
        Left = 64
        Top = 69
        Width = 145
        Height = 17
        Caption = 'Focus on a number'
        Checked = True
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 1
        TabStop = True
        OnClick = cbMult1Click
      end
      object spMult: TRzSpinEdit
        Left = 218
        Top = 67
        Width = 47
        Height = 21
        BlankValue = 1
        ButtonWidth = 20
        Max = 12
        Min = 1
        Value = 1
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 2
      end
      object spMultBetween1: TRzSpinEdit
        Left = 246
        Top = 104
        Width = 47
        Height = 21
        BlankValue = 1
        ButtonWidth = 20
        Max = 12
        Min = 1
        Value = 1
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 3
        Visible = False
      end
      object cbMult2: TRzRadioButton
        Left = 64
        Top = 106
        Width = 175
        Height = 17
        Caption = 'Practice numbers between:'
        FrameColor = 8409372
        HighlightColor = 2203937
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        TabOrder = 4
        OnClick = cbMult1Click
      end
      object spMultBetween2: TRzSpinEdit
        Left = 339
        Top = 104
        Width = 47
        Height = 21
        BlankValue = 1
        ButtonWidth = 20
        Max = 12
        Min = 1
        Value = 4
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 5
        Visible = False
      end
    end
    object pgQuestions: TRzTabSheet
      Caption = 'pgQuestions'
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 505
        Height = 277
        Align = alClient
      end
    end
    object pgAnswers: TRzTabSheet
      Caption = 'pgAnswers'
      object ImAnswers: TImage
        Left = 0
        Top = 0
        Width = 505
        Height = 277
        Align = alClient
      end
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 55
    Align = alTop
    Color = clCream
    TabOrder = 1
    object RzLabel1: TRzLabel
      Left = 24
      Top = 12
      Width = 287
      Height = 29
      Caption = 'Zo'#235#39's Math Questions'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TextStyle = tsRaised
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 351
    Width = 505
    Height = 51
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    object btnNext: TRzBitBtn
      Left = 373
      Top = 13
      Width = 65
      Caption = 'Next'
      HotTrack = True
      TabOrder = 0
      OnClick = btnNextClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000520B0000520B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E80909
        090909E8E8E8E8E8E8E8E8E8E8E88181818181E8E8E8E8E8E8E8E8E8E8E80910
        10101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8E8E809
        1010101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8E8E8
        091010101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8E8
        E8091010101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8
        E8E8091010101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8
        E8E8091010101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8
        E8091010101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8
        091010101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E809
        1010101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E80910
        10101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8E80909
        090909E8E8E8E8E8E8E8E8E8E8E88181818181E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      Layout = blGlyphRight
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 24
      Top = 16
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 1
      Visible = False
      OnClick = BitBtn1Click
    end
    object btnBack: TRzBitBtn
      Left = 305
      Top = 13
      Width = 65
      Caption = 'Back'
      HotTrack = True
      TabOrder = 2
      Visible = False
      OnClick = btnBackClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000520B0000520B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E80909090909E8E8E8E8E8E8E8E8E8E8E88181818181E8E8E8E8E8E8E8E8E8E8
        091010101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E809
        1010101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E80910
        10101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8091010
        101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E809101010
        1009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8E809101010
        1009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8E8E8091010
        101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8E8E80910
        10101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8E8E809
        1010101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8E8E8
        091010101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8E8
        E80909090909E8E8E8E8E8E8E8E8E8E8E88181818181E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object btnPrint: TRzBitBtn
      Left = 185
      Top = 13
      Width = 65
      Caption = 'Print'
      HotTrack = True
      TabOrder = 3
      Visible = False
      OnClick = btnPrintClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000730E0000730E00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
        09090909090909E8E8E8E8E88181818181818181818181E8E8E8E85E89898989
        89898989895E5E09E8E8E8E2ACACACACACACACACACE2E281E8E85E5E5E5E5E5E
        5E5E5E5E5E5E095E09E8E2E2E2E2E2E2E2E2E2E2E2E281E281E85ED789898989
        8989898989895E0909E8E2E8ACACACACACACACACACACE28181E85ED789898989
        181289B490895E5E09E8E2E8ACACACACE281ACE281ACE2E281E85ED7D7D7D7D7
        D7D7D7D7D7D75E5E5E09E2E8E8E8E8E8E8E8E8E8E8E8E2E2E2815ED789898989
        8989898989895E5E5E09E2E8ACACACACACACACACACACE2E2E281E85E5E5E5E5E
        5E5E5E5E5E89895E5E09E8E2E2E2E2E2E2E2E2E2E2ACACE2E281E8E85ED7D7D7
        D7D7D7D7D75E89895E09E8E8E2E8E8E8E8E8E8E8E8E2ACACE281E8E8E85ED7E3
        E3E3E3E3D75E5E5E09E8E8E8E8E2E8ACACACACACE8E2E2E281E8E8E8E85ED7D7
        D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85ED7
        E3E3E3E3E3D75EE8E8E8E8E8E8E8E2E8ACACACACACE8E2E8E8E8E8E8E8E85ED7
        D7D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85E
        5E5E5E5E5E5E5E5EE8E8E8E8E8E8E8E2E2E2E2E2E2E2E2E2E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
  end
end
