program glassbeer;

{$I '..\..\core\include\glassbeer_defines.inc'}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, CustomBO, BasicUserRecordDataBO, MashBO, RecipeBO, RawMaterialBO,
  CustomMVP, MainMVP, Brokers, RawMaterialMVP, CustomEditFrm, CustomQueryFrm,
  MainFrm, RawMaterialQueryFrm, RawMaterialEditFrm, RecipeMVP, RecipeQueryFrm,
  RecipeEditFrm, RecipeIngredientItemEditFrm, FermenterBO, FermenterMVP,
  FementerQueryFrm, FermenterEditFrm, LocationBO, LocationMVP, LocationQueryFrm,
  LocationEditFrm, FillingBO;

{$R *.res}

begin
  Application.Title:='Glassbeer software';
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  TMainFormPresenter.Run;
end.

