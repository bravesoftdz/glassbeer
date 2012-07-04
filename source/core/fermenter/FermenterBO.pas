unit FermenterBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes
  ,SysUtils
  ,PressAttributes
  ,PressSubject
  ,CustomBO
  ,BasicUserRecordDataBO
  ,LocationBO;

type

  TFermenterStatus = (fsAvailable, fsInUse);

  {$M+}
  TFermenterEventItemParts = class;
  TFermenterEventReference = class;
  {$M-}

  { TFermenter }

  TFermenter = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordData;
    _FullCapacity: TPressDouble;
    _HeadSpace: TPressDouble;
    _UtilCapacity: TPressDouble;
    _Location: TLocationReference;
    _CurrentVolume: TPressDouble;
    _Status: TPressEnum;
  private
    function GetCode: string;
    function GetCurrentVolume: Double;
    function GetFullCapacity: Double;
    function GetHeadSpace: Double;
    function GetName: string;
    function GetRemarks: string;
    function GetStatus: TFermenterStatus;
    function GetUtilCapacity: Double;
    procedure SetCode(const AValue: string);
    procedure SetCurrentVolume(const AValue: Double);
    procedure SetFullCapacity(const AValue: Double);
    procedure SetHeadSpace(const AValue: Double);
    procedure SetName(const AValue: string);
    procedure SetRemarks(const AValue: string);
    procedure SetStatus(const AValue: TFermenterStatus);
    procedure SetUtilCapacity(const AValue: Double);
  protected
    class function InternalMetadataStr: string; override;
    procedure InternalCalcAttribute(AAttribute: TPressAttribute); override;
  published
    property Code: string read GetCode write SetCode;
    property Name: string read GetName write SetName;
    property Remarks: string read GetRemarks write SetRemarks;
    property FullCapacity: Double read GetFullCapacity write SetFullCapacity;
    property HeadSpace: Double read GetHeadSpace write SetHeadSpace;
    property UtilCapacity: Double read GetUtilCapacity write SetUtilCapacity;
    property CurrentVolume: Double read GetCurrentVolume write SetCurrentVolume;
    property Status: TFermenterStatus read GetStatus write SetStatus;
  end;

  { TFermenterQuery }

  TFermenterQuery = class(TCustomQuery)
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TFermenterReference }

  TFermenterReference = class(TCustomReference)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

  { TMashFermenterItem }

  TMashFermenterItem = class(TCustomObject)
    _Fermenter: TFermenterReference;
    _Volume: TPressDouble;
    _FermenterEvents: TFermenterEventItemParts;
    _StartDate: TPressDate;
    _DaysSinceStart: TPressInteger;
    _DaysSinceLastEvent: TPressInteger;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TFermenterEventItemParts }

  TFermenterEventItemParts = class(TCustomParts)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

  TFermenterEventItem = class(TCustomObject)
    _FermenterEvent: TFermenterEventReference;
    _ExpirationDate: TPressDate;
    _Volume: TPressDouble;
    _Temperature: TPressDouble;
    _CurrentGravity: TPressDouble;
  protected
    class function InternalMetadataStr: string; override;
  end;

  TFermenterEvent = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordDataPart;
    _Duration: TPressInteger;
    _Temperature: TPressDouble;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TFermenterEventReference }

  TFermenterEventReference = class(TCustomReference)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

  { TMashFermenterItemParts }

  TMashFermenterItemParts = class(TCustomParts)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

implementation

{ TFermenterQuery }

class function TFermenterQuery.InternalMetadataStr: string;
begin
  Result := 'TFermenterQuery(TFermenter) (' +
    'Name: AnsiString(40) MatchType=mtContains DataName="BasicUserRecordData.Name";' +
    ')';
end;

{ TFermenter }

function TFermenter.GetCode: string;
begin
  Result := _BasicUserRecordData.Code;
end;

function TFermenter.GetCurrentVolume: Double;
begin
  Result := _CurrentVolume.Value;
end;

function TFermenter.GetFullCapacity: Double;
begin
  Result := _FullCapacity.Value;
end;

function TFermenter.GetHeadSpace: Double;
begin
  Result := _HeadSpace.Value;
end;

function TFermenter.GetName: string;
begin
  Result := _BasicUserRecordData.Name;
end;

function TFermenter.GetRemarks: string;
begin
  Result := _BasicUserRecordData.Remarks;
end;

function TFermenter.GetStatus: TFermenterStatus;
begin
  Result := TFermenterStatus(_Status.Value);
end;

function TFermenter.GetUtilCapacity: Double;
begin
  Result := _UtilCapacity.Value
end;

procedure TFermenter.SetCode(const AValue: string);
begin
  _BasicUserRecordData.Code := AValue;
end;

procedure TFermenter.SetCurrentVolume(const AValue: Double);
begin
  _CurrentVolume.Value := AValue;
end;

procedure TFermenter.SetFullCapacity(const AValue: Double);
begin
  _FullCapacity.Value := AValue;
end;

procedure TFermenter.SetHeadSpace(const AValue: Double);
begin
  _HeadSpace.Value := AValue;
end;

procedure TFermenter.SetName(const AValue: string);
begin
  _BasicUserRecordData.Name := AValue;
end;

procedure TFermenter.SetRemarks(const AValue: string);
begin
  _BasicUserRecordData.Remarks := AValue;
end;

procedure TFermenter.SetStatus(const AValue: TFermenterStatus);
begin
  _Status.Value := LongInt(AValue);
end;

procedure TFermenter.SetUtilCapacity(const AValue: Double);
begin
  _UtilCapacity.Value := AValue;
end;

class function TFermenter.InternalMetadataStr: string;
begin
  Result := 'TFermenter IsPersistent ( ' +
    'BasicUserRecordData: TBasicUserRecordDataPart ShortName="BasicURD";' +
    'FullCapacity: Double DisplayName="Capacidade total";' +
    'HeadSpace: Double DisplayName="Head space (%)";' +
    'UtilCapacity: Double Calc(FullCapacity, HeadSpace) DisplayName="Capacidade útil";' +
    'Location: TLocationReference DisplayName="Localização";' +
    'CurrentVolume: Double DisplayName="Volume atual";' +
    'Status: Enum(TFermenterStatus) DisplayName="Status";' +
    ')';
end;

procedure TFermenter.InternalCalcAttribute(AAttribute: TPressAttribute);
begin
  if AAttribute = _UtilCapacity then
    UtilCapacity := FullCapacity - (FullCapacity * HeadSpace / 100);
end;


{ TFermenterReference }

class function TFermenterReference.ValidObjectClass: TPressObjectClass;
begin
  Result := TFermenter;
end;

{ TMashFermenterItem }

class function TMashFermenterItem.InternalMetadataStr: string;
begin
  Result := 'TMashFermenterItem IsPersistent (' +
    'Fermenter: TFermenterReference;' +
    'Volume: Double;' +
    'FermenterEvents: TFermenterEventItemParts;' +
    'StartDate: TDate;' +
    'DaysSinceStart: Integer Calc(StartDate);' +
    'DaysSinceLastEvent: Integer Calc(FermenterEvents);' +
    ')';
end;

{ TFermenterEventItemParts }

class function TFermenterEventItemParts.ValidObjectClass: TPressObjectClass;
begin
  Result := TFermenterEventItem;
end;

{ TFermenterEventItem }

class function TFermenterEventItem.InternalMetadataStr: string;
begin
  Result := 'TFermenterEventItem IsPersistent (' +
    'FermenterEvent: TFermenterEventReference ShortName="BasicURD";' +
    'ExpirationDate: Date DisplayName="Vencimento";' +
    'Volume: Double DisplayName="Volume (litros)";' +
    'Temperature: Double DisplayName="Temperatura";' +
    'CurrentGravity: Double DisplayName="Densidade atual";' +
    ')';
end;

{ TFermenterEvent }

class function TFermenterEvent.InternalMetadataStr: string;
begin
  Result := 'TFermenterEvent IsPersistent(' +
    'BasicUserRecordData: TBasicUserRecordDataPart;' +
    'Duration: Integer DisplayName="Duração";' +
    'Temperature: Double DisplayName="Temperatura";' +
    ')';
end;

{ TFermenterEventReference }

class function TFermenterEventReference.ValidObjectClass: TPressObjectClass;
begin
  Result := TFermenterEvent;
end;

{ TMashFermenterItemParts }

class function TMashFermenterItemParts.ValidObjectClass: TPressObjectClass;
begin
  Result := TMashFermenterItem;
end;

initialization
  TFermenter.RegisterClass;
  TFermenterEvent.RegisterClass;
  TFermenterEventItem.RegisterClass;
  TFermenterEventItemParts.RegisterAttribute;
  TFermenterQuery.RegisterClass;
  TFermenterReference.RegisterAttribute;
  TFermenterEventReference.RegisterAttribute;
  PressModel.RegisterEnumMetadata(TypeInfo(TFermenterStatus),
    'TFermenterStatus',
    ['Disponível', 'Em uso']);
  TMashFermenterItem.RegisterClass;
  TMashFermenterItemParts.RegisterAttribute;

finalization
  TFermenter.UnregisterClass;
  TFermenterEvent.UnregisterClass;
  TFermenterEventItem.UnregisterClass;
  TFermenterEventItemParts.UnregisterAttribute;
  TFermenterQuery.UnregisterClass;
  TFermenterReference.UnregisterAttribute;
  TFermenterEventReference.UnregisterAttribute;
  TMashFermenterItem.UnregisterClass;
  TMashFermenterItemParts.UnregisterAttribute;


end.

