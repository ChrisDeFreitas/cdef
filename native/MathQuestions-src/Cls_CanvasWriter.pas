unit Cls_CanvasWriter;

interface

uses
	Classes, Math, Types, Graphics, Windows;

type
	TClsCanvasWriter = class(TObject)
	private
		FCanvas: TCanvas;
		FPageWidth: integer;
    FPageHeight: integer;

		FFontSize: Integer;
		PrinterY: integer;	//last line printed
		FLineHeight: integer;
		FBoldOn: boolean;
    FItalicOn: boolean;
    FUnderlineOn: boolean;

		MarginT: Integer;
		MarginL: Integer;
		MarginR: Integer;
		MarginB: Integer;

    FGridAlign: TAlignment;
    FGridTop: Integer;
    FGridLeft: Integer;
		FCellWidth: Integer;
		FCellHeight: Integer;

		function GetFontSize: Integer;
		procedure SetFontSize(const Value: Integer);
		procedure SetTopMargin(const Value: extended);
		procedure SetBottomMargin(const Value: extended);
		procedure SetLeftMargin(const Value: extended);
		procedure SetRightMargin(const Value: extended);
		function GetPageHeight: Integer;
		function GetPageWidth: Integer;
		function GetBottomMargin: extended;
		function GetLeftMargin: extended;
		function GetRightMargin: extended;
		function GetTopMargin: extended;
    function GetLineHeight: integer;
    function GetPPI: integer;
    function GetCharWidth: integer;
    procedure SetGridCell(ARow, ACol: Integer; const Value: string);
    procedure SetGridCellPos(ARow, ACol, x: Integer; const Value: string);
    procedure SetGridAlign(Align: TAlignment);
	public

		constructor Create();
		procedure SetCanvas( ACanvas: TCanvas; APageWidth, APageHeight: Integer);
    procedure SetFont( AFontName: string);
    function TextWidth( AString: string): integer;
    
		procedure Center( AString: string );
		procedure Write( AString: string );
		procedure WriteRight(AString: string );

		procedure HR;
		procedure Line( AWidth, StartAt, StopAt: integer);

		function PenPos: TPoint;
		procedure MoveTo(pt: TPoint);
		procedure Bold;
		procedure Italic;
		procedure Underline;

    procedure MakeGrid( CellWidth, CellHeight: integer; Align: TAlignment);


    //
		property FontSize: Integer read GetFontSize write SetFontSize;

		property TopMargin: extended  read GetTopMargin write SetTopMargin;
		property LeftMargin: extended read GetLeftMargin write SetLeftMargin;
		property BottomMargin: extended read GetBottomMargin write SetBottomMargin;
		property RightMargin: extended read GetRightMargin write SetRightMargin;

    property PPI: integer read GetPPI;
    property CharWidth: integer read GetCharWidth;
    property LineHeight: integer read GetLineHeight;
		property PageWidth: Integer read GetPageWidth;
		property PageHeight: Integer read GetPageHeight;

    property Cell[Row, Col: Integer]: string write SetGridCell;
    property CellPos[Row, Col, x: Integer]: string write SetGridCellPos;
    property GridAlign:TAlignment write SetGridAlign;
	end;

implementation

{ TClsCanvasWriter }

constructor TClsCanvasWriter.Create;
begin
  FCanvas 		:= nil;
  FPageWidth	:= 0;
  FPageHeight := 0;
  FBoldOn 		:= false;
  FItalicOn		:= false;
  FUnderlineOn:= false;
end;

procedure TClsCanvasWriter.SetCanvas(ACanvas: TCanvas; APageWidth, APageHeight: Integer);
begin
  FCanvas := ACanvas;

  FPageWidth := APageWidth;
  FPageHeight := APageHeight;

  SetFontSize( 10 );

  SetTopMargin( 1 );
  SetBottomMargin( 1 );
  SetLeftMargin( 1 );
  SetRightMargin( 1 );
end;

function TClsCanvasWriter.GetFontSize: Integer;
begin
	Result := FFontSize;
end;

procedure TClsCanvasWriter.SetFontSize(const Value: Integer);
begin
	FFontSize := Value;

	FCanvas.Font.Size := Value;
	FLineHeight := FCanvas.TextHeight('T');
end;

procedure TClsCanvasWriter.Bold;
begin
		FBoldOn := not FBoldOn;

		if FBoldOn then
			FCanvas.Font.Style := FCanvas.Font.Style + [fsBold]
		else
			FCanvas.Font.Style := FCanvas.Font.Style - [fsBold];
end;

procedure TClsCanvasWriter.Italic;
begin
  FItalicOn := not FItalicOn;

  if FItalicOn then
    FCanvas.Font.Style := FCanvas.Font.Style + [fsItalic]
  else
    FCanvas.Font.Style := FCanvas.Font.Style - [fsItalic];
end;

procedure TClsCanvasWriter.Underline;
begin
  FUnderlineOn := not FUnderlineOn;

  if FUnderlineOn then
    FCanvas.Font.Style := FCanvas.Font.Style + [fsUnderline]
  else
    FCanvas.Font.Style := FCanvas.Font.Style - [fsUnderline];
end;

procedure TClsCanvasWriter.Write(AString: string);
var
	LineStart, LineEnd: integer;
	tw: integer;
	LineWidth: integer;
	stmp: string;
	CanPrint: boolean;
	LengthStr: integer;
	itmp: integer;
const
	WhiteSpaceSet=[#0..#32];
begin
	with FCanvas do begin
		LineWidth := MarginR -MarginL;
		FLineHeight:= TextHeight('T');
		LengthStr :=Length(AString);

		LineStart := 1;
		LineEnd		:= 1;
		CanPrint	:= false;

		while LineStart < LengthStr do begin

			if ( (LineStart +LineEnd -1) > LengthStr ) then
				CanPrint := true
			else begin
				stmp:= System.Copy( AString, LineStart, LineEnd);
				tw := TextWidth( stmp );

				if (tw < LineWidth ) then
					inc(LineEnd)
				else
				if (tw = LineWidth ) then
					CanPrint := true
				else
				if (tw > LineWidth ) then begin
					CanPrint := true;
				end;
			end;

			if CanPrint then begin
				CanPrint := false;

				//check for work break
				itmp := LineStart+LineEnd; //point to next char in AString
				if( itmp < LengthStr ) then
					if not (AString[itmp] in WhiteSpaceSet) then begin //is it a whitespace char
						itmp := LineEnd;
						while (itmp>0) and (not (stmp[itmp] in WhiteSpaceSet)) do
								dec(itmp);
						if itmp > 1 then begin
							LineEnd := itmp;
							stmp:= System.Copy( AString, LineStart, LineEnd);
						end;
					end;

				//TextRect(	Rect(MarginL, MarginT,MarginR, MarginB),
				TextOut(MarginL, PrinterY,
									stmp);

				//inc
				PrinterY := PrinterY +FLineHeight;
				FCanvas.MoveTo( PenPos.X, PrinterY);
				LineStart := LineStart +LineEnd;
				LineEnd := 1;
			end;
		end;
	end;
end;

procedure TClsCanvasWriter.Center(AString: string);
var
	len, itmp: integer;
	//OldMarginR,
  OldMarginL: integer;
begin
	//OldMarginR := MarginR;
	OldMarginL := MarginL;
	try
		len  := FCanvas.TextWidth(AString);
		if len < FPageWidth then begin
			itmp := FPageWidth - len;
			MarginL := itmp div 2;
			//MarginR :=  MarginR +len;
		end else begin
			//MarginR := OldMarginR;
			MarginL := OldMarginL;
		end;
		Write(AString);
	finally
		//MarginR := OldMarginR;
		MarginL := OldMarginL;
	end;
end;

procedure TClsCanvasWriter.WriteRight(AString: string);
var
	len: integer;
	lft: integer;
begin
	len  := FCanvas.TextWidth(AString);
	if len < MarginR then
		lft := MarginR -len
	else
		lft := MarginL;

	FCanvas.TextOut(lft, PenPos.Y, AString);
end;

procedure TClsCanvasWriter.HR;
begin
	PrinterY := PrinterY + FLineHeight;
	with FCanvas do
		MoveTo( PenPos.X, PrinterY);
end;

procedure TClsCanvasWriter.SetTopMargin(const Value: extended);
begin
		MarginT := Floor(FCanvas.Font.PixelsPerInch *Value);
		PrinterY := MarginT;
		with FCanvas do
			MoveTo( PenPos.X, PrinterY);
end;


procedure TClsCanvasWriter.SetBottomMargin(const Value: extended);
begin
	{with Printer do begin
		if not Printing then exit;}

		MarginB := PageHeight -Floor(FCanvas.Font.PixelsPerInch *Value);
	//end;
end;

procedure TClsCanvasWriter.SetLeftMargin(const Value: extended);
begin
	MarginL := Floor(FCanvas.Font.PixelsPerInch *Value);
end;

procedure TClsCanvasWriter.SetRightMargin(const Value: extended);
begin
	MarginR := FPageWidth -Floor(FCanvas.Font.PixelsPerInch *Value);
end;


procedure TClsCanvasWriter.Line(AWidth, StartAt, StopAt: integer);
var
	pt: TPoint;
begin
	with FCanvas do begin
		Pen.Width := AWidth;

		pt := PenPos;
		pt.X := MarginL +StartAt;
		PenPos := pt;

		pt.X := MarginL+StopAt;
		if pt.X > MarginR then
			pt.X := MarginR;

		LineTo(pt.X, pt.Y);

	end;
end;

function TClsCanvasWriter.GetPageHeight: Integer;
begin
	result := FPageHeight;
end;

function TClsCanvasWriter.GetPageWidth: Integer;
begin
	result := FPageWidth;
end;

function TClsCanvasWriter.GetBottomMargin: extended;
begin
	result := MarginB;
end;

function TClsCanvasWriter.GetLeftMargin: extended;
begin
	result := MarginL;
end;

function TClsCanvasWriter.GetRightMargin: extended;
begin
	result := MarginR;
end;

function TClsCanvasWriter.GetTopMargin: extended;
begin
	result := MarginT;
end;


procedure TClsCanvasWriter.MoveTo(pt: TPoint);
begin
	FCanvas.PenPos := pt;
	PrinterY := pt.Y;
end;

function TClsCanvasWriter.PenPos: TPoint;
begin
	result := FCanvas.PenPos;
end;


function TClsCanvasWriter.GetCharWidth: integer;
begin
	result := FCanvas.TextWidth('T');
end;

function TClsCanvasWriter.GetLineHeight: integer;
begin
	result := FLineHeight;
end;

procedure TClsCanvasWriter.SetGridAlign(Align: TAlignment);
begin
	FGridAlign	:= Align;
end;

procedure TClsCanvasWriter.MakeGrid(CellWidth, CellHeight: integer; Align: TAlignment);
begin
	FGridAlign	:= Align;
	FGridTop 		:= PrinterY;
  FGridLeft		:= MarginL;
  
	FCellWidth	:= CellWidth;
	FCellHeight	:= CellHeight;
end;

procedure TClsCanvasWriter.SetGridCell(ARow, ACol: Integer; const Value: string);
var
	top, left, tmp: integer;
begin
  top := FGridTop + (FCellHeight *ARow);
	left:= FGridLeft+ (FCellWidth *ACol);

  //set alignment
  tmp := 0;
  if FGridAlign = taRightJustify then
  	tmp := left +(FCellWidth -FCanvas.TextWidth(Value))
  else
  if FGridAlign = taCenter then
  	tmp := left +( (FCellWidth -FCanvas.TextWidth(Value)) div 2);

  if(tmp > 0)
  and(tmp > left) then
  	left := tmp;

	FCanvas.TextOut(left, top, Value);
end;

procedure TClsCanvasWriter.SetGridCellPos(ARow, ACol, x: Integer;  const Value: string);
var
	top, left, tmp: integer;
begin
  top := FGridTop + (FCellHeight *ARow);
	left:= FGridLeft+ (FCellWidth *ACol) +x;

	FCanvas.TextOut(left, top, Value);
end;

procedure TClsCanvasWriter.SetFont(AFontName: string);
begin
	FCanvas.Font.Name := AFontName;
end;

function TClsCanvasWriter.GetPPI: integer;
begin
	result := FCanvas.Font.PixelsPerInch;
end;

function TClsCanvasWriter.TextWidth(AString: string): integer;
begin
	result  := FCanvas.TextWidth(AString);
end;


end.
