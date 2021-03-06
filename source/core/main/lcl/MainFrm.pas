unit MainFrm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LR_E_HTM, LR_BarC, LR_E_TXT, LR_Shape, Forms,
  Controls, Graphics, Dialogs, Menus;

type

  { TMainForm }

  TMainForm = class(TForm)
    GlassBeerMainMenu: TMainMenu;
    FileMenu: TMenuItem;
    ExitMenuItem: TMenuItem;
    Icons16ImageList: TImageList;
    Icons32ImageList: TImageList;
    MainfrBarCodeObject: TfrBarCodeObject;
    MainfrHTMExport: TfrHTMExport;
    MainfrShapeObject: TfrShapeObject;
    MainfrTextExport: TfrTextExport;
    MenuItem1: TMenuItem;
    LocationMenuItem: TMenuItem;
    FermentacaoMenu: TMenuItem;
    FermenterMenuItem: TMenuItem;
    FermenterEventMenuItem: TMenuItem;
    MashMenuItem: TMenuItem;
    ContactMenuItem: TMenuItem;
    EquipmentMenuItem: TMenuItem;
    EquipmentProfileMenuItem: TMenuItem;
    FinanceiroMenuItem: TMenuItem;
    AccountChartMenuItem: TMenuItem;
    MenuItem2: TMenuItem;
    BudgetMenuItem: TMenuItem;
    ProductMenuItem: TMenuItem;
    RecipeMenuItem: TMenuItem;
    MetadataMenuItem: TMenuItem;
    ToolsMenu: TMenuItem;
  end; 

var
  MainForm: TMainForm;

const
  { image index constants }
  IMG_ACCEPT = 0;
  IMG_CANCEL = 1;
  IMG_ADD = 2;
  IMG_PENCIL = 3;
  IMG_DELETE = 4;
  IMG_USER = 5;
  IMG_FACTORY = 6;
  IMG_ZOOM = 7;
  IMG_CALCULATOR = 8;
  IMG_EMOTICONGEAR = 9;
  IMG_LAYOUT_EDIT = 10;
  IMG_DISK = 11;

implementation

{$R *.lfm}

end.

