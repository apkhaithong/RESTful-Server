unit WebModuleUnit1;

interface

uses System.SysUtils, System.Classes, System.JSON, Web.HTTPApp, DBAccess, Uni, Data.DB,
  MemDS, UniProvider, ODBCUniProvider, DB2UniProvider, Web.HTTPProd, DataSetConverter4D.Helper,
  DataSetConverter4D.Impl, DataSetConverter4D, DataSetConverter4D.Util, NetEncoding,
  frxClass, frxExportPDF, frxDACComponents, frxUniDACComponents, frxDBSet,
  frxDesgn, frxExportXLSX;

type
  TWebModule1 = class(TWebModule)
    UniConnection1: TUniConnection;
    DB2UniProvider1: TDB2UniProvider;
    QGet: TUniQuery;
    UniTransaction1: TUniTransaction;
    QPost: TUniQuery;
    index: TPageProducer;
    frxReport1: TfrxReport;
    frxUniDACComponents1: TfrxUniDACComponents;
    frxPDFExport1: TfrxPDFExport;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxUserDataSet1: TfrxUserDataSet;
    frxXLSXExport1: TfrxXLSXExport;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1setgroupAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1uploadimageAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1reportAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure WebModule1exportAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    ms : TMemoryStream;
    ParamsReport: TStringList;
    procedure SetGroupGet(Request: TWebRequest; Response: TWebResponse);
    procedure SetGroupPost(Request: TWebRequest; Response: TWebResponse);
    procedure UploadImagePost(Request: TWebRequest; Response: TWebResponse);
    procedure ReportGet(Request: TWebRequest; Response: TWebResponse);
    procedure ExportGet(Request: TWebRequest; Response: TWebResponse);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

uses
  FormUnit1;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TWebModule1.ExportGet(Request: TWebRequest; Response: TWebResponse);
var ja : TJSONArray;
    jo : TJSONObject;
    I : Integer;
    frPath : string;
begin
  frPath := ExtractFilePath(paramstr(0));
  Form1.Memo1.Lines.Clear;
  if Request.QueryFields.Count > 0 then
  begin
    ParamsReport := TStringList.Create;
    for I := 0 to Request.QueryFields.Count-1 do
    begin
      Form1.Memo1.Lines.Add(Request.QueryFields.Names[I]+' : '+Request.QueryFields.ValueFromIndex[I]);
      ParamsReport.AddPair(Request.QueryFields.Names[I],Request.QueryFields.ValueFromIndex[I]);
    end;
  end;
  if Request.QueryFields.Values['table'] = 'SETGROUP' then
  begin
    frxReport1.LoadFromFile(frPath+ '\Form\setgroup.fr3');
    with QGet do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM '+Request.QueryFields.Values['table']+' '+
              'WHERE '+Request.QueryFields.Values['field']+' LIKE:V1 ORDER BY '+
              Request.QueryFields.Values['field']);
      ParamByName('V1').AsString := '%'+Request.QueryFields.Values['value']+'%';
      Open;
    end;
  end
  else
  begin
    if ParamsReport.Values['reportname'] = 'receiptdaily' then
      frxReport1.LoadFromFile(frPath+ '\Form\rp_receiptdaily.fr3');
  end;
  ms := TMemoryStream.Create;
  frxReport1.PrepareReport();
  frxXLSXExport1.Stream   := ms;
  frxReport1.Export(frxXLSXExport1);
  Response.SetCustomHeader('Content-Disposition','attachment; filename='+ParamsReport.Values['reportname']+'.xlsx');
  Response.ContentType   := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
  Response.ContentStream := ms;

end;

procedure TWebModule1.frxReport1GetValue(const VarName: string;
  var Value: Variant);
begin
  if ParamsReport.Values['reportname'] = 'receiptdaily' then
  begin
    IF Uppercase(VarName) = 'VLOCAT' then
      Value := ParamsReport.Values['locat']+'%';
    IF Uppercase(VarName) = 'VFDATE' then
      Value := StrToDate(ParamsReport.Values['fdate']);
    IF Uppercase(VarName) = 'VTDATE' then
      Value := StrToDate(ParamsReport.Values['tdate']);
    IF Uppercase(VarName) = 'VPAYFOR' then
      Value := ParamsReport.Values['payfor']+'%';
    IF Uppercase(VarName) = 'VPAYTYP' then
      Value := ParamsReport.Values['paytyp']+'%';
  end;

end;

procedure TWebModule1.ReportGet(Request: TWebRequest; Response: TWebResponse);
var ja : TJSONArray;
    jo : TJSONObject;
    I : Integer;
    frPath : string;
begin
  frPath := ExtractFilePath(paramstr(0));
  Form1.Memo1.Lines.Clear;
  if Request.QueryFields.Count > 0 then
  begin
    ParamsReport := TStringList.Create;
    for I := 0 to Request.QueryFields.Count-1 do
    begin
      Form1.Memo1.Lines.Add(Request.QueryFields.Names[I]+' : '+Request.QueryFields.ValueFromIndex[I]);
      ParamsReport.AddPair(Request.QueryFields.Names[I],Request.QueryFields.ValueFromIndex[I]);
    end;
  end;
  if Request.QueryFields.Values['table'] = 'SETGROUP' then
  begin
    frxReport1.LoadFromFile(frPath+ '\Form\setgroup.fr3');
    with QGet do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM '+Request.QueryFields.Values['table']+' '+
              'WHERE '+Request.QueryFields.Values['field']+' LIKE:V1 ORDER BY '+
              Request.QueryFields.Values['field']);
      ParamByName('V1').AsString := '%'+Request.QueryFields.Values['value']+'%';
      Open;
    end;
  end
  else
  begin
    if ParamsReport.Values['reportname'] = 'receiptdaily' then
      frxReport1.LoadFromFile(frPath+ '\Form\rp_receiptdaily.fr3');
  end;
  ms := TMemoryStream.Create;
  frxReport1.PrepareReport();
  frxPDFExport1.Stream   := ms;
  frxReport1.Export(frxPDFExport1);
  Response.SetCustomHeader('Content-Disposition','filename=setgroup.pdf');
  Response.ContentType   := 'application/pdf';
  Response.ContentStream := ms;
end;

procedure TWebModule1.SetGroupGet(Request: TWebRequest; Response: TWebResponse);
var ja : TJSONArray;
    jo : TJSONObject;
    I : Integer;
begin
  Form1.Memo1.Lines.Clear;
  if Request.QueryFields.Count > 0 then
  begin
    for I := 0 to Request.QueryFields.Count-1 do
    begin
      Form1.Memo1.Lines.Add(Request.QueryFields.Names[I]+' : '+Request.QueryFields.ValueFromIndex[I]);
    end;
  end;

  with QGet do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM '+Request.QueryFields.Values['table']+' '+
            'WHERE '+Request.QueryFields.Values['field']+' LIKE:V1 ORDER BY '+
            Request.QueryFields.Values['field']);
    ParamByName('V1').AsString := '%'+Request.QueryFields.Values['value']+'%';
    Open;
  end;

  //Response Data
  try
    ja := TConverter.New.DataSet(QGet).AsJSONArray;
    jo := TConverter.New.DataSet.Source(QGet).AsJSONObject;
  finally
    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := ja.ToString;
    ja.DisposeOf;
  end;
end;

procedure TWebModule1.SetGroupPost(Request: TWebRequest; Response: TWebResponse);
var ja : TJSONArray;
    jo, RequestObject : TJSONObject;
    LJsonArr: TJSONArray;
    table, field1, field2, value1, value2 :string;
    I : Integer;
begin
  LJsonArr    := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
  RequestObject :=  LJsonArr.Items[0] as TJSONObject;

  table  := RequestObject.GetValue('table').Value;
  field1 := RequestObject.GetValue('field1').Value;
  field2 := RequestObject.GetValue('field2').Value;
  value1 := RequestObject.GetValue('value1').Value;
  value2 := RequestObject.GetValue('value2').Value;

  Form1.Memo1.Lines.Clear;
  Form1.Memo1.Lines.Add('table : '+table);
  Form1.Memo1.Lines.Add('field1 : '+field1);
  Form1.Memo1.Lines.Add('field2 : '+field2);
  Form1.Memo1.Lines.Add('value1 : '+value1);
  Form1.Memo1.Lines.Add('value2 : '+value2);

  with QGet do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO '+table+' ('+field1+', '+field2+') VALUES (:V1, :V2)');
    ParamByName('V1').AsString := value1;
    ParamByName('V2').AsString := value2;
    ExecSQL;
  end;

  with QGet do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM '+table+' WHERE '+field1+' LIKE:V1 ORDER BY '+field1);
    ParamByName('V1').AsString := '%'+value1+'%';
    Open;
  end;

  //Response Data
  try
    ja := TConverter.New.DataSet(QGet).AsJSONArray;
    jo := TConverter.New.DataSet.Source(QGet).AsJSONObject;
  finally
    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := ja.ToString;
    ja.DisposeOf;
  end;
end;

procedure TWebModule1.UploadImagePost(Request: TWebRequest; Response: TWebResponse);
var
  I : Integer;
  image, FileName : string;
  LJsonArr: TJSONArray;
  RequestObject : TJSONObject;
  SS : TBytesStream;
begin
  LJsonArr    := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(Request.Content), 0) as TJSONArray;
  RequestObject :=  LJsonArr.Items[0] as TJSONObject;

  Form1.Memo1.Lines.Clear;
  image := RequestObject.GetValue('file1').Value;
  FileName := RequestObject.GetValue('filename').Value;
  Form1.Memo1.Lines.Add(image);
  Form1.Memo1.Lines.Add(FileName);
  SS := TBytesStream.Create(TNetEncoding.Base64.DecodeStringToBytes(image));
  try
    SS.SaveToFile(FileName);
  finally
    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := 'success';
    SS.Free;
  end;
end;

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  {Response.Content :=
    '<html>' +
    '<head><title>Web Server Application</title></head>' +
    '<body>Web Server Application</body>' +
    '</html>'; }
end;

procedure TWebModule1.WebModule1exportAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet: ExportGet(Request, Response);
    else
    begin
      Response.StatusCode := 400;
      Response.SendResponse;
    end;
  end;
end;

procedure TWebModule1.WebModule1reportAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet: ReportGet(Request, Response);
    else
    begin
      Response.StatusCode := 400;
      Response.SendResponse;
    end;
  end;
end;

procedure TWebModule1.WebModule1setgroupAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet: SetGroupGet(Request, Response);
    mtPost: SetGroupPost(Request, Response);
    else
    begin
      Response.StatusCode := 400;
      Response.SendResponse;
    end;
  end;
end;

procedure TWebModule1.WebModule1uploadimageAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtPost: UploadImagePost(Request, Response);
    else
    begin
      Response.StatusCode := 400;
      Response.SendResponse;
    end;
  end;
end;

end.
