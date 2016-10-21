object Form1: TForm1
  Left = 271
  Top = 114
  Caption = 'RESTful Web Server'
  ClientHeight = 315
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 48
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object Label2: TLabel
    Left = 24
    Top = 95
    Width = 70
    Height = 13
    Caption = 'Select Reports'
  end
  object ButtonStart: TButton
    Left = 24
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 105
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object EditPort: TEdit
    Left = 24
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '8080'
  end
  object ButtonOpenBrowser: TButton
    Left = 167
    Top = 65
    Width = 107
    Height = 25
    Caption = 'Open Browser'
    TabOrder = 3
    OnClick = ButtonOpenBrowserClick
  end
  object Memo1: TMemo
    Left = 24
    Top = 168
    Width = 353
    Height = 121
    TabOrder = 4
  end
  object Button1: TButton
    Left = 167
    Top = 112
    Width = 107
    Height = 25
    Caption = 'Design Report'
    TabOrder = 5
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 114
    Width = 121
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 6
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 136
    Top = 184
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 307
    Top = 176
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42660.609193634300000000
    ReportOptions.LastChange = 42660.619422743050000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    ShowProgress = False
    Left = 240
    Top = 176
    Datasets = <
      item
        DataSet = frxReport1.UniDACQuery1
        DataSetName = 'UniDACQuery1'
      end>
    Variables = <
      item
        Name = ' String'
        Value = Null
      end
      item
        Name = 'VLOCAT'
        Value = Null
      end
      item
        Name = 'VPAYFOR'
        Value = Null
      end
      item
        Name = 'VPAYTYP'
        Value = Null
      end
      item
        Name = ' Date'
        Value = Null
      end
      item
        Name = 'VFDATE'
        Value = Null
      end
      item
        Name = 'VTDATE'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object UniDACQuery1: TfrxUniDACQuery
        UserName = 'UniDACQuery1'
        CloseDataSource = True
        BCDToCurrency = False
        IgnoreDupParams = False
        Params = <
          item
            Name = 'VLOCAT'
            DataType = ftString
            Expression = '<VLOCAT>'
          end
          item
            Name = 'VFDATE'
            DataType = ftDate
            Expression = '<VFDATE>'
          end
          item
            Name = 'VTDATE'
            DataType = ftDate
            Expression = '<VTDATE>'
          end
          item
            Name = 'VPAYFOR'
            DataType = ftString
            Expression = '<VPAYFOR>'
          end
          item
            Name = 'VPAYTYP'
            DataType = ftString
            Expression = '<VPAYTYP>'
          end>
        SQL.Strings = (
          
            'SELECT E.PAYFOR,A.MEMO1,A.LOCATRECV,A.TMBILL,A.BILLNO,A.TMBILDT,' +
            'E.CONTNO,A.CUSCOD,A.PAYTYP,'
          
            'E.PAYAMT,E.DISCT,E.NETPAY,E.USERID,E.INPUTDT,E.FLAG,E.TSALE,A.CH' +
            'QNO,'
          'B.SNAM,B.NAME1,B.NAME2,D.FORDESC'
          'FROM CHQMAS A,CHQTRAN E,CUSTMAST B,PAYFOR D'
          'WHERE A.IDNO=E.CHQMASID '
          'AND A.CUSCOD=B.CUSCOD '
          'AND E.PAYFOR=D.FORCODE '
          'AND (A.LOCATRECV LIKE:VLOCAT) '
          'AND A.TMBILDT BETWEEN :VFDATE AND :VTDATE          '
          'AND E.PAYFOR LIKE :VPAYFOR                '
          'AND A.PAYTYP LIKE :VPAYTYP             '
          'ORDER BY A.BILLNO,A.TMBILDT  ')
        pLeft = 88
        pTop = 52
        Parameters = <
          item
            Name = 'VLOCAT'
            DataType = ftString
            Expression = '<VLOCAT>'
          end
          item
            Name = 'VFDATE'
            DataType = ftDate
            Expression = '<VFDATE>'
          end
          item
            Name = 'VTDATE'
            DataType = ftDate
            Expression = '<VTDATE>'
          end
          item
            Name = 'VPAYFOR'
            DataType = ftString
            Expression = '<VPAYFOR>'
          end
          item
            Name = 'VPAYTYP'
            DataType = ftString
            Expression = '<VPAYTYP>'
          end>
      end
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo4: TfrxMemoView
          Align = baWidth
          Top = 1.889773550000001000
          Width = 1046.929810000000000000
          Height = 37.795282910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #3619#3634#3618#3591#3634#3609#3585#3634#3619#3633#3610#3594#3635#3619#3632#3611#3619#3632#3592#3635#3623#3633#3609)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Top = 64.252009999999990000
          Width = 56.692950000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #3621#3635#3604#3633#3610#3607#3637#3656)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 60.472480000000000000
          Top = 64.252009999999990000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #3648#3621#3586#3607#3637#3656#3651#3610#3619#3633#3610#3648#3591#3636#3609)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 170.078850000000000000
          Top = 64.252009999999990000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #3623#3633#3609#3607#3637#3656#3651#3610#3619#3633#3610)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 279.685220000000000000
          Top = 64.252009999999990000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #3648#3621#3586#3607#3637#3656#3626#3633#3597#3597#3634)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 389.291590000000000000
          Top = 64.252009999999990000
          Width = 272.126160000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #3594#3639#3656#3629' - '#3609#3634#3617#3626#3585#3640#3621)
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end>
        end
        object Memo14: TfrxMemoView
          Left = 661.417750000000000000
          Top = 64.252009999999990000
          Width = 56.692950000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #3594#3635#3619#3632#3650#3604#3618)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 729.449290000000000000
          Top = 64.252009999999990000
          Width = 204.094620000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #3594#3635#3619#3632#3588#3656#3634)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 937.323440000000000000
          Top = 64.252009999999990000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #3592#3635#3609#3623#3609#3648#3591#3636#3609)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 986.457330000000000000
          Top = 41.795300000000020000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #3627#3609#3657#3634' [<Page#>] / [<TotalPages#>]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 62.472479999999990000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Align = baWidth
          Top = 90.708719999999950000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 170.078850000000000000
        Width = 1046.929810000000000000
        DataSet = frxReport1.UniDACQuery1
        DataSetName = 'UniDACQuery1'
        RowCount = 0
        object UniDACQuery1GCODE: TfrxMemoView
          Width = 56.692950000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
        object frxMemoView1: TfrxMemoView
          Left = 60.472480000000000000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataField = 'TMBILL'
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          Memo.UTF8W = (
            '[UniDACQuery1."TMBILL"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 170.078850000000000000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataField = 'TMBILDT'
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          Memo.UTF8W = (
            '[UniDACQuery1."TMBILDT"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 279.685220000000000000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataField = 'CONTNO'
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          Memo.UTF8W = (
            '[UniDACQuery1."CONTNO"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 389.291590000000000000
          Width = 272.126160000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          Memo.UTF8W = (
            
              '[UniDACQuery1."SNAM"][UniDACQuery1."NAME1"]   [UniDACQuery1."NAM' +
              'E2"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 661.417750000000000000
          Width = 56.692950000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataField = 'PAYTYP'
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          Memo.UTF8W = (
            '[UniDACQuery1."PAYTYP"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 729.449290000000000000
          Width = 204.094620000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataField = 'FORDESC'
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          Memo.UTF8W = (
            '[UniDACQuery1."FORDESC"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 937.323440000000000000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataField = 'PAYAMT'
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '#,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[UniDACQuery1."PAYAMT"]')
          ParentFont = False
        end
      end
    end
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 48
    Top = 240
  end
  object frxOLEObject1: TfrxOLEObject
    Left = 136
    Top = 240
  end
  object frxRichObject1: TfrxRichObject
    Left = 216
    Top = 240
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 304
    Top = 240
  end
  object frxCheckBoxObject1: TfrxCheckBoxObject
    Left = 40
    Top = 176
  end
  object frxGradientObject1: TfrxGradientObject
    Left = 104
    Top = 152
  end
  object frxDotMatrixExport1: TfrxDotMatrixExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EscModel = 0
    GraphicFrames = False
    SaveToFile = False
    UseIniSettings = True
    Left = 184
    Top = 160
  end
  object frxChartObject1: TfrxChartObject
    Left = 272
    Top = 152
  end
end
