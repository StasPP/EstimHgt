unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ShellAPI ;

type
  TForm3 = class(TForm)
    RG2: TRadioGroup;
    GB: TGroupBox;
    C1: TCheckBox;
    C2: TCheckBox;
    C3: TCheckBox;
    SaveDialog1: TSaveDialog;
    Button1: TButton;
    RG3: TRadioGroup;
    RG4: TRadioGroup;
    PB: TProgressBar;
    RG5: TRadioGroup;
    C4: TCheckBox;
    C5: TCheckBox;
    C6: TCheckBox;
    procedure C1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RG2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  ts: string = '_t';
implementation

uses TableFm, Unit2;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);

  function CorrectName(s:string):string;
  var I:Integer;
  begin
     result := '';
     for I := 1 to Length(s) do
     case Ord(s[I]) of    
        32, 40..41, 44..46, 48..57, 65..90,
        95..122, 190..255: result := result + s[I];
     end; 
     
     if result = '' then
     begin
       MessageDlg('RouteNames Error!', mtError, [mbOk],0);
       result := 'Err';
     end;
  end;

  

var S, S2:TStringList;
    I :Integer;
    Fname, Fdir, Rname, imgName, imgsz, fntcol : string;
    asked, makeDif : boolean;
begin
  if Not SaveDialog1.Execute then
    exit;

  RG2.OnClick(nil);
    
  Asked := false;
  MakeDif := false;

  FName := SaveDialog1.FileName;

  if ExtractFileExt(Fname)<>'.html' then
    Fname := Fname + '.html';

  if fileexists(FName) then
    if MessageDLG(Form1.AskFN +#13 + FName, MtConfirmation, mbYesNo, 0) <> 6 then
         exit;

  imgsz := '';
  I:= 0;
  if C1.Checked then Inc(I); if C2.Checked then Inc(I); if C3.Checked then Inc(I);
  if C4.Checked then Inc(I); if C5.Checked then Inc(I); if C6.Checked then Inc(I);
  if I > 1 then
    imgsz := ' width="' +inttostr(1006 div {I} 2)+'" height="'+inttostr(390 div {I} 2)+'"';
  try
    PB.Position := 0;
    PB.Visible := true;
    FDir := StringReplace(FName, ExtractFileExt(Fname), '', [])+'_files\';
    ForceDirectories(Fdir);
    ForceDirectories(Form1.MyDir +'\Data\Tmp\');

    SetCurrentDir(Form1.MyDir);
    S := TStringList.Create;  S2 := TStringList.Create;
    S.LoadFromFile('Data\Est\'+ Form1.Languages.Items[Form1.languages.ItemIndex] +
                 '\Rep_header.txt');

    S2.Add('displaysize 1024,480');
    S2.Add('setfolder '+ FDir);
    S.Add('<h4 align="center">'+ Form1.FName +'</h4>');

    for I := 1 to Form1.StringGrid.RowCount - 1 do
      if Form1.Routes[i-1].Est >= RG3.ItemIndex then
      begin
         PB.Position := round(I*100/(Form1.StringGrid.RowCount - 1));
         PB.Repaint;
         
         Form1.SaveGraphNew(I-1, Form1.MyDir +'\Data\Tmp\');
         S2.Add('loaddata ' + Form1.MyDir +'\Data\Tmp\Data'+IntToStr(I)+'.txt');

         Rname := Form1.Routes[i-1].name;
         
         S.Add('<h2 align="center">'+Form1.Routes[i-1].name+'</h2>');

         fntcol := '';
         case Form1.Routes[i-1].est of
            0,1: fntcol := '<font color="green">';
            2: fntcol := '<font color="olive">';
            3: fntcol := '<font color="red">';
         end;

         S.Add('<h4 align="center"><strong>'+Form1.Label7.Caption + ' '+ fntcol +
               Form1.Estims[Form1.Routes[i-1].est]+'</strong></font></h4>');

         S.Add('<p align="center">');
         if C1.Checked then
         begin
            S2.Add('loadset ' + Form1.MyDir +
                   '\Data\Graph\'+Form1.Languages.Items[Form1.Languages.ItemIndex] +
                   '\R_Dev'+ts+'.chs');  
            S2.Add('apply');
            
            imgName := Rname + '_plan.jpg';
            S2.Add('savejpg '+ Imgname);
            
            S.Add('<a href ="' + Fdir + Imgname +
                 '" target = "_blank"><img src="'+ 
                 Fdir + Imgname + '" '+imgsz+'></a>');

            if RG4.ItemIndex = 1 then
             S2.Add('savechart '+ Rname+'_plan.cht');
         end;

         if C2.Checked then
         begin
            S2.Add('loadset ' + Form1.MyDir +
                   '\Data\Graph\'+Form1.Languages.Items[Form1.Languages.ItemIndex] +
                   '\R_HAG'+ts+'.chs');
            S2.Add('apply');
            imgName := Rname + '_hag.jpg';
            S2.Add('savejpg '+ Imgname);

            S.Add('<a href ="' + Fdir + Imgname +
                 '" target = "_blank"><img src="'+
                 Fdir + Imgname + '" '+imgsz+'></a>');

            if RG4.ItemIndex = 1 then
             S2.Add('savechart '+ Rname+'_hag.cht');
         end;
         
         if C3.Checked then
         begin
           if C2.Enabled then
           if not Asked then
           begin
              MakeDif := MessageDlg(Form1.Qstn, mtConfirmation, [mbYes, mbNo], 0) =6;
              Asked := true;
           end;

           if MakeDif then
              S2.Add('loaddata '+ Form1.MyDir +'\Data\Tmp\DataB'+IntToStr(I)+'.txt');

           S2.Add('loadset ' + Form1.MyDir +
                   '\Data\Graph\'+Form1.Languages.Items[Form1.Languages.ItemIndex] +
                   '\R_Hgt'+ts+'.chs');  
              
           S2.Add('apply');
           imgName := Rname + '_hgt.jpg';
           S2.Add('savejpg '+ Imgname);

           S.Add('<a href ="' + Fdir + Imgname +
                 '" target = "_blank"><img src="'+ 
                 Fdir + Imgname + '" '+imgsz+'></a>');
           
           if RG4.ItemIndex = 1 then
             S2.Add('savechart '+ Rname+'_hgt.cht');
             
           S2.Add('loaddata ' + Form1.MyDir +'\Data\Tmp\Data'+IntToStr(I)+'.txt');
         end;


         if C4.Checked then
         begin
            S2.Add('loadset ' + Form1.MyDir +
                   '\Data\Graph\'+Form1.Languages.Items[Form1.Languages.ItemIndex] +
                   '\R_Speed'+ts+'.chs');
            S2.Add('apply');
            imgName := Rname + '_speed.jpg';
            S2.Add('savejpg '+ Imgname);

            S.Add('<a href ="' + Fdir + Imgname +
                 '" target = "_blank"><img src="'+
                 Fdir + Imgname + '" '+imgsz+'></a>');

            if RG4.ItemIndex = 1 then
             S2.Add('savechart '+ Rname+'_speed.cht');
         end;

         if C5.Checked then
         begin
            S2.Add('loadset ' + Form1.MyDir +
                   '\Data\Graph\'+Form1.Languages.Items[Form1.Languages.ItemIndex] +
                   '\R_NSat'+ts+'.chs');
            S2.Add('sat_on');       
            S2.Add('apply');
            imgName := Rname + '_Nsat.jpg';
            S2.Add('savejpg '+ Imgname);

            S.Add('<a href ="' + Fdir + Imgname +
                 '" target = "_blank"><img src="'+
                 Fdir + Imgname + '" '+imgsz+'></a>');

            if RG4.ItemIndex = 1 then
              S2.Add('savechart '+ Rname+'_Nsat.cht');
            S2.Add('sat_off');
         end;

         if C6.Checked then
         begin
            S2.Add('loadset ' + Form1.MyDir +
                   '\Data\Graph\'+Form1.Languages.Items[Form1.Languages.ItemIndex] +
                   '\R_DOP'+ts+'.chs');
            S2.Add('dop_on');
            S2.Add('apply');
            imgName := Rname + '_DOP.jpg';
            S2.Add('savejpg '+ Imgname);

            S.Add('<a href ="' + Fdir + Imgname +
                 '" target = "_blank"><img src="'+
                 Fdir + Imgname + '" '+imgsz+'></a>');

            if RG4.ItemIndex = 1 then
             S2.Add('savechart '+ Rname+'_DOP.cht');
            S2.Add('dop_off');
         end;




         S.Add('</p>');
       // S.Add('<p> </p>');
       //  S.Add('<p> </p>');
      end;

    //winexec(PChar('Graph.exe '+s+' '+s2+ ' ' +DopSt+' -thick -menu -rnav -readonly -n -gray'),sw_restore);

    if RG5.ItemIndex <> 1 then
      S2.Add('openfile '+FName);
    S2.Add('close');

    SetCurrentDir(Form1.MyDir);
    S2.SaveToFile('Data\script.tmp');
    S2.LoadFromFile('Data\Rep_end.txt');
    for I := 0 to S2.Count - 1 do
      S.Add(S2[I]);


    S.SaveToFile(Fname);
    if RG5.ItemIndex = 1 then
       ShellExecute(Handle,'open',PChar(FDir),'','',SW_SHOWNORMAL);

    WinExec(PChar('Graph.exe -script Data\script.tmp ' + Form2.DopSt +
                  ' -thick -menu -rnav -readonly -n -gray'), sw_restore);

    S.Free;
    S2.Free;
  except
    PB.Visible := false;

  end;
     PB.Visible := false;
    close;

end;

procedure TForm3.C1Click(Sender: TObject);
begin
 Button1.Enabled := not ((C1.Checked = false) and (C2.Checked = false)
                     and (C3.Checked = false) );

end;

procedure TForm3.FormShow(Sender: TObject);
begin
 PB.Visible := false;
end;

procedure TForm3.RG2Click(Sender: TObject);
begin
  ts:= '';
  if RG2.ItemIndex = 1 then
    ts:= '_t';
end;


end.




