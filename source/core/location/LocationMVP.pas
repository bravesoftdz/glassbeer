unit LocationMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  CustomMVP
  ,LocationBO;

type

  { TLocationEditPresenter }

  TLocationEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TLocationQueryPresenter }

  TLocationQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;


implementation

{ TLocationQueryPresenter }

procedure TLocationQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

function TLocationQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'BasicUserRecordData.Code(198, "Código");' +
    'BasicUserRecordData.Name(356, "Nome")';
end;

{ TLocationEditPresenter }

procedure TLocationEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
end;

initialization
  TLocationEditPresenter.RegisterBO(TLocation);
  TLocationQueryPresenter.RegisterBO(TLocationQuery);

end.

