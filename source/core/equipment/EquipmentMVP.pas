unit EquipmentMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomMVP;

type

 { TEquipmentEditPresenter }

  TEquipmentEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TEquipmentQueryPresenter }

  TEquipmentQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

implementation

uses
  EquipmentBO;

{ TEquipmentQueryPresenter }

procedure TEquipmentQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

function TEquipmentQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'Code(198, "Código");' +
    'Name(356, "Nome");' +
    'Cost(99, "Custo");' +
    'PurchaseDate(99, "Dt. compra")';
end;

{ TEquipmentEditPresenter }

procedure TEquipmentEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
  CreateSubPresenter('Cost', 'CostEdit');
  CreateSubPresenter('PurchaseDate', 'PurchaseDateEdit');
end;

initialization
  TEquipmentEditPresenter.RegisterBO(TEquipment);
  TEquipmentQueryPresenter.RegisterBO(TEquipmentQuery);

end.

