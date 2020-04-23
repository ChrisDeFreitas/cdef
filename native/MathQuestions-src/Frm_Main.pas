unit Frm_Main;

interface

uses
	Cls_MathQuestions,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Printers, Dialogs, RzCommon, RzButton, RzRadChk, ExtCtrls, RzPanel, StdCtrls,
  RzLabel, RzTabs, Buttons, RzEdit, Mask, RzSpnEdt;

type
  TfrmMain = class(TForm)
    PgCtrl: TRzPageControl;
    pgAdd: TRzTabSheet;
    RzLabel2: TRzLabel;
    pgQuestions: TRzTabSheet;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    Add1: TRzRadioButton;
    Add3: TRzRadioButton;
    Add4: TRzRadioButton;
    RzPanel2: TRzPanel;
    btnNext: TRzBitBtn;
    BitBtn1: TBitBtn;
    Add2: TRzRadioButton;
    btnBack: TRzBitBtn;
    pgIndex: TRzTabSheet;
    RzLabel3: TRzLabel;
    cbAdd: TRzRadioButton;
    cbSub: TRzRadioButton;
    cbMult: TRzRadioButton;
    RzRadioButton4: TRzRadioButton;
    pgSub: TRzTabSheet;
    RzLabel4: TRzLabel;
    cbSub1: TRzRadioButton;
    cbSub3: TRzRadioButton;
    cbSub4: TRzRadioButton;
    cbSub2: TRzRadioButton;
    pgAnswers: TRzTabSheet;
    cbSub5: TRzRadioButton;
    Add5: TRzRadioButton;
    btnPrint: TRzBitBtn;
    cbSub6: TRzRadioButton;
    spSub: TRzSpinEdit;
    spAdd: TRzSpinEdit;
    Add6: TRzRadioButton;
    pgMult: TRzTabSheet;
    RzLabel5: TRzLabel;
    cbSubReview: TRzRadioButton;
    cbMultReview: TRzRadioButton;
    cbMult1: TRzRadioButton;
    spMult: TRzSpinEdit;
    cbAddReview: TRzRadioButton;
    spMultBetween1: TRzSpinEdit;
    cbMult2: TRzRadioButton;
    spMultBetween2: TRzSpinEdit;
    lblMultBetween: TLabel;
    Image1: TImage;
    ImAnswers: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure cbSub6Click(Sender: TObject);
    procedure Add6Click(Sender: TObject);
    procedure cbMult1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    Questions: TClsMathQuestions;
    procedure ClearImage(AImage: TImage);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
var
	idx:integer;
begin
  PgCtrl.ActivePageIndex := 0;

	for idx := 0 to PgCtrl.PageCount -1 do
		PgCtrl.Pages[idx].TabVisible := false;
  Questions := TClsMathQuestions.Create;

  	with Image1 do begin
//    	Bitmap
		end;
ClearImage(Image1);
ClearImage(ImAnswers);
{	with Image1 do begin
		align:=alNone;
    Left := 0;
    Top := 0;
		Height:= 285;	//Round(PixelsPerInch * 11); //1500;
		Width:=500;	//Round(PixelsPerInch * 8.5); //PixelsPerInch * 9; //1500;
	end;

  with ImAnswers do begin
		align:=alNone;
    Left := 0;
    Top := 0;
		Height:= 285;	//Round(PixelsPerInch * 11); //1500;
		Width:=500;	//Round(PixelsPerInch * 8.5); //PixelsPerInch * 9; //1500;
  end;
}
end;

procedure TfrmMain.ClearImage(AImage: TImage);
var
	clrBrush, clrPen: TColor;
begin
  with AImage do begin
		Picture.Bitmap.Width := Width;
		Picture.Bitmap.Height := Height;

{		clrBrush := Canvas.Brush.Color;
    clrPen := Canvas.Pen.Color;
    Canvas.Brush.Color := clWhite;
    Canvas.Pen.Color := clWhite;

    Canvas.Brush.Style := bsSolid;}
    //Canvas.Pen.Width := 1;
    //Canvas.Pen.Style := psInsideFrame;
    Canvas.Rectangle( 0, 0, AImage.Width, AImage.Height);
    //Canvas.FloodFill(0,0,clRed,fsBorder);
{    Canvas.Brush.Color := clrBrush;
    Canvas.Pen.Color := clrPen;}
  end;
end;

procedure TfrmMain.btnBackClick(Sender: TObject);
begin
   btnPrint.Visible := false;
	if PgCtrl.ActivePage = pgAnswers then begin
		ClearImage( Image1 );
    Questions.Paint(Image1.Canvas, Image1.Width, Image1.Height, false, false);

		PgCtrl.ActivePage := pgQuestions;
    btnPrint.Visible := true;
	end else
	if PgCtrl.ActivePage = pgQuestions then begin

    cbAddReview.Enabled := Questions.Count > 0;
    cbSubReview.Enabled := Questions.Count > 0;
    cbMultReview.Enabled := Questions.Count > 0;

  	if cbAdd.Checked then
			PgCtrl.ActivePage := pgAdd
		else
  	if cbSub.Checked then
			PgCtrl.ActivePage := pgSub
		else
  	if cbMult.Checked then
			PgCtrl.ActivePage := pgMult;
  end else
	if (PgCtrl.ActivePage = pgAdd)
  or (PgCtrl.ActivePage = pgSub)
  or (PgCtrl.ActivePage = pgMult) then begin
		PgCtrl.ActivePage := pgIndex;
  end;

  if PgCtrl.ActivePageIndex = 0 then
        btnBack.Visible := false
  else
        btnBack.Visible := true;

  if PgCtrl.ActivePage = pgAnswers then
        btnNext.Visible := false
  else
        btnNext.Visible := true;
end;

procedure TfrmMain.btnNextClick(Sender: TObject);
var
	itmp, n1, n2: integer;
begin
   btnPrint.Visible := false;
	if PgCtrl.ActivePage = pgQuestions then begin
   	PgCtrl.ActivePage := pgAnswers;
		ClearImage( ImAnswers );
    Questions.Paint(ImAnswers.Canvas, ImAnswers.Width, ImAnswers.Height, true, false);
    btnPrint.Visible := true;
  end else
	if PgCtrl.ActivePage = pgIndex then begin
    //Questions.Clear;
    cbAddReview.Enabled := false;
    cbSubReview.Enabled := false;
    cbMultReview.Enabled := false;

    if cbAdd.Checked then
     	PgCtrl.ActivePage := pgAdd
    else
    if cbSub.Checked then
     	PgCtrl.ActivePage := pgSub
    else
    if cbMult.Checked then
     	PgCtrl.ActivePage := pgMult

  end else
	if PgCtrl.ActivePage = pgAdd then begin
		ClearImage( Image1 );
    btnPrint.Visible := true;

    if Add1.Checked then itmp := 1
    else
    if Add2.Checked then itmp := 2
    else
    if Add3.Checked then itmp := 3
    else
    if Add4.Checked then itmp := 4
    else
    if Add5.Checked then itmp := 5
    else
    if Add6.Checked then itmp := 6
    else
    	itmp := 0;

    if itmp <> 0 then
      Questions.Make_AdditionLevel(itmp, spAdd.IntValue);
    Questions.Paint(Image1.Canvas, Image1.Width, Image1.Height, false, false);

		PgCtrl.ActivePage := pgQuestions;

    //lblQHead.Caption := Questions.Title;
  end else
	if PgCtrl.ActivePage = pgSub then begin
		ClearImage( Image1 );
    btnPrint.Visible := true;

    if cbSub1.Checked then itmp := 1
    else
    if cbSub2.Checked then itmp := 2
    else
    if cbSub3.Checked then itmp := 3
    else
    if cbSub4.Checked then itmp := 4
    else
    if cbSub5.Checked then itmp := 5
    else
    if cbSub6.Checked then itmp := 6
    else
    	itmp := 0;
      
    if itmp <> 0 then
      Questions.Make_SubtractionLevel(itmp, spSub.IntValue);
    Questions.Paint(Image1.Canvas, Image1.Width, Image1.Height, false, false);

		PgCtrl.ActivePage := pgQuestions;
  end else
	if PgCtrl.ActivePage = pgMult then begin
		ClearImage( Image1 );
    btnPrint.Visible := true;

    if cbMult1.Checked then
      Questions.Make_MultiplicationLevel(1, spMult.IntValue)
    else
    if cbMult2.Checked then begin
    	n1 := spMultBetween1.IntValue;
    	n2 := spMultBetween2.IntValue;
      if n1 > n2 then begin
      	n1 := n2;
	    	n2 := spMultBetween1.IntValue;
      end;

      Questions.Make_MultiplicationLevel(2, n1, n2);
    end;

    Questions.Paint(Image1.Canvas, Image1.Width, Image1.Height, false, false);

		PgCtrl.ActivePage := pgQuestions;
  end;

  if PgCtrl.ActivePageIndex = 0 then
        btnBack.Visible := false
  else
        btnBack.Visible := true;

  if PgCtrl.ActivePage = pgAnswers then
        btnNext.Visible := false
  else
        btnNext.Visible := true;
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
var
	stmp: string;
  idx: integer;
begin
  Questions.First;
  stmp := '';
  idx := 1;
  while not Questions.EOL do begin
    stmp := stmp + intToStr(idx)+'. '+Questions.Op1+' + '+Questions.Op2+' = '+Questions.OpResult +#13#10;
    Questions.Next;
    inc(idx);
  end;

	ShowMessage(stmp);
end;

procedure TfrmMain.btnPrintClick(Sender: TObject);
begin
 with Printer do begin
 	BeginDoc;
  try
		if PgCtrl.ActivePage = pgQuestions then
	    Questions.Paint(Canvas, PageWidth, PageHeight, false, true)
		else
       Questions.Paint(Canvas, PageWidth, PageHeight, true, true);
  finally
  	EndDoc;
  end;
 end;
end;

procedure TfrmMain.cbSub6Click(Sender: TObject);
begin
	spSub.Visible := cbSub6.Checked;
end;

procedure TfrmMain.Add6Click(Sender: TObject);
begin
	spAdd.Visible := Add6.Checked;
end;

procedure TfrmMain.cbMult1Click(Sender: TObject);
begin
	spMult.Visible := cbMult1.Checked;

  spMultBetween1.Visible := cbMult2.Checked;
  spMultBetween2.Visible := cbMult2.Checked;
  lblMultBetween.Visible := cbMult2.Checked;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
	if PgCtrl.ActivePage = pgQuestions then begin
		ClearImage( Image1 );
    Questions.Paint(Image1.Canvas, Image1.Width, Image1.Height, false, false);
  end else
	if PgCtrl.ActivePage = pgAnswers then begin
		ClearImage( ImAnswers );
    Questions.Paint(ImAnswers.Canvas, ImAnswers.Width, ImAnswers.Height, true, false);
  end;
end;

end.
