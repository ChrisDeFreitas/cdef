unit Cls_MathQuestions;

interface

	uses
		Cls_CanvasWriter,
	  StrUtils, ExtCtrls, Math,Windows, SysUtils, Classes, Graphics, Controls, Forms;

type
	TClsMathQuestions = class(TObject)
  public
		constructor Create;
    destructor Destroy; override;

    procedure Make_AdditionLevel( ALevel, AValue: Integer );
    procedure Make_SubtractionLevel( ALevel, AValue: Integer );
    procedure Make_MultiplicationLevel( ALevel, AMinValue: Integer; AMaxValue: Integer = 12);
    
    function Title: string;
    procedure Paint(ACanvas: TCanvas; AWidth, AHeight: integer; ShowAnswer, isPrinter: boolean);

    procedure First;
    procedure Next;
    function EOL: boolean;
    function Count: integer;

    function Op1: string;
    function Op2: string;
    function OpResult: string;
  private
  	QuestionType, QuestionLevel, QuestionIndex: integer;
    QTitle: string;
		FQuestions: TStringList;
    CW: TClsCanvasWriter;
  end;
implementation

{ TClsMathQuestions }

const
  QNONE		= 0;
	QADDITION= 1;
	QSUBTRACTION = 2;
  QMULTIPLICATION = 3;
    
constructor TClsMathQuestions.Create;
begin
  inherited;

 	QuestionType	:= QNONE;
  QuestionLevel	:=0;
  QTitle 				:= 'No Questions defined!';
	FQuestions			:= TStringList.Create;

  CW := nil;
end;

destructor TClsMathQuestions.Destroy;
begin
	FreeAndNil(FQuestions);
  if CW <> nil then
  	FreeAndNil(CW);
end;

function TClsMathQuestions.Title: string;
begin
	result := QTitle;
end;

procedure TClsMathQuestions.First;
begin
	QuestionIndex := 0;
end;

procedure TClsMathQuestions.Next;
begin
	inc(QuestionIndex);
end;

function TClsMathQuestions.EOL: boolean;
begin
	result := QuestionIndex >= FQuestions.Count;
end;

function TClsMathQuestions.Op1: string;
var
	idx: integer;
  stmp: string;
begin
  stmp := FQuestions[QuestionIndex];
	idx := pos( '|', stmp);
	result := copy(stmp, 1, idx-1);
end;

function TClsMathQuestions.Op2: string;
var
	idx: integer;
  stmp: string;
begin
  stmp := FQuestions[QuestionIndex];
	idx := pos( '|', stmp);
	stmp := copy(stmp, idx+1, Length(stmp));
	idx := pos( '=', stmp);
	result := copy(stmp, 1, idx -1);
end;

function TClsMathQuestions.OpResult: string;
var
	idx: integer;
  stmp: string;
begin
  stmp := FQuestions[QuestionIndex];
	idx := pos( '=', stmp);
	result := copy(stmp, idx+1, Length(stmp));
end;

procedure TClsMathQuestions.Make_AdditionLevel(ALevel, AValue: Integer);
var
	idx: integer;
  min,max: integer;
  lft, rht: real;
  stmp: string;
begin
 	QuestionType := QADDITION;
  QuestionLevel := ALevel;
  QuestionIndex := 0;

  FQuestions.Clear;
  Randomize;

	min := 0;
  case ALevel of
  1: begin
		  QTitle := 'Addition, Level 1';
  	  max := 5;
    end;
  2: begin
		  QTitle := 'Addition, Level 2';
  	  max := 9;
    end;
  3: begin
		  QTitle := 'Addition, Level 3';
  	  max := 20;
    end;
  4: begin
		  QTitle := 'Addition, Level 4';
  	  max := 99;
    end;
  5: begin
		  QTitle := 'Addition, Level 5';
  	  max := 2000;
    end;
  else begin
		  QTitle := 'Addition, Focus on '+intToStr(AValue);
			min := AValue;
  	  max := 20;
    end;
  end;

  for idx := 1 to 15 do begin
  	lft := Random(max -1);
    if min = 0 then
	  	rht := Random(max -1)
    else
    	rht := min -1;
    if lft > rht then
    	stmp := intToStr( Floor(lft) +1) +'|'+intToStr( Floor(rht) +1)+'='+intToStr( (Floor(lft) +1) + (Floor(rht) +1) )
		else
    	stmp := intToStr( Floor(rht) +1) +'|'+intToStr( Floor(lft) +1)+'='+intToStr( (Floor(lft) +1) + (Floor(rht) +1) );
    FQuestions.Add(stmp);
  end;
end;

procedure TClsMathQuestions.Make_SubtractionLevel(ALevel, AValue: Integer);
var
	idx: integer;
  min,max: integer;
  lft, rht: real;
  stmp: string;
begin
 	QuestionType := QSUBTRACTION;
  QuestionLevel := ALevel;
  QuestionIndex := 0;

  FQuestions.Clear;
  Randomize;

	min := 0;
  case ALevel of
  1: begin
		  QTitle := 'Subtraction, Level 1';
  	  max := 5;
    end;
  2: begin
		  QTitle := 'Subtraction, Level 2';
  	  max := 9;
    end;
  3: begin
		  QTitle := 'Subtraction, Level 3';
  	  max := 20;
    end;
  4: begin
		  QTitle := 'Subtraction, Level 4';
  	  max := 100;
    end;
  5: begin
		  QTitle := 'Subtraction, Level 5';
  	  max := 2000;
    end;
  else begin
		  QTitle := 'Subtraction, Focus on '+intToStr(AValue);
			min := AValue;
  	  max := 20;
    end;
  end;

  for idx := 1 to 15 do begin
  	lft := Random(max -1);
    if min = 0 then
	  	rht := Random(max -1)
    else
    	rht := min -1;
    if lft > rht then
    	stmp := intToStr( Floor(lft) +1) +'|'+intToStr( Floor(rht) +1)+'='+intToStr( (Floor(lft) +1) - (Floor(rht) +1) )
		else
    	stmp := intToStr( Floor(rht) +1) +'|'+intToStr( Floor(lft) +1)+'='+intToStr( (Floor(rht) +1) - (Floor(lft) +1) );
    FQuestions.Add(stmp);
  end;
end;

procedure TClsMathQuestions.Paint(ACanvas: TCanvas; AWidth, AHeight: integer; ShowAnswer, isPrinter: boolean);
var
	digitspercell, cellheight, cellwidth: integer;
	itmp, row,col: integer;
  op, stmp: string;
  widestOp: integer;
begin

  if CW = nil then
    CW := TClsCanvasWriter.Create;

  case QuestionType of
  QADDITION: 		op := ' +';
  QSUBTRACTION:	op := ' -';
  QMULTIPLICATION: op := ' x';
  end;
  //if QuestionLevel > 3 then


  with CW do begin
  	SetCanvas(ACanvas, AWidth, AHeight);
  	SetFont('Verdana');
    FontSize := 10;

		if not isPrinter then begin
      TopMargin 	:= 0.25;
      BottomMargin:= 0.25;
      LeftMargin 	:= (AWidth / 20) / PPI; //0.25;
      RightMargin := (AWidth / 20) / PPI; //0.25;
		end;

    cellwidth := Floor( ((AWidth * 9/10)) /5);  //width *90% /5 columns

    digitspercell := 10;
    itmp := Floor(cellwidth / digitspercell); // cellwidth / num digits
    FontSize := itmp;

    FontSize := itmp;	//Round(itmp *1.2);
    Bold;
    if isPrinter then Write( 'Math Questions');
    if ShowAnswer then
	    Write( QTitle+' Answers')
    else
	    Write( QTitle);
    if isPrinter then HR;
    Bold;

    FontSize := itmp;
    HR;

    MakeGrid(	cellWidth, LineHeight, taRightJustify);

    //find widest value
    widestOp := 0;
    First;
    while not EOL do begin
    	if TextWidth(Op1) > widestOp then
      	widestOp := TextWidth(Op1);
    	if TextWidth(Op+Op2) > widestOp then
      	widestOp := TextWidth(Op+Op2);
    	if TextWidth(OpResult) > widestOp then
      	widestOp := TextWidth(OpResult);
      Next;
    end;

    row := 0;
    col := 0;
    First;
    while not EOL do begin
    	Cell[row,col] 	:= Op1;
      UnderLine;
    	Cell[row+1,col] := op+Op2;
      UnderLine;

      //write question number
      stmp := '#'+intToStr(QuestionIndex +1)+':';
      itmp := CellWidth - TextWidth(stmp) -widestOp -(CharWidth div 2);
    	CellPos[row,col, itmp] := stmp;

      if ShowAnswer then
	    	Cell[row+2,col] := OpResult;

      inc(col);
      if col = 5 then begin
      	col := 0;
        inc(row,4);
      end;

      Next;
    end;
  end;

end;

procedure TClsMathQuestions.Make_MultiplicationLevel( ALevel, AMinValue: Integer; AMaxValue: Integer = 12);
var
	counter,idx, itmp: integer;
  min,max: integer;
  lft, rht: real;
  stmp: string;
begin
 	QuestionType := QMULTIPLICATION;
  QuestionLevel := ALevel;
  QuestionIndex := 0;

  FQuestions.Clear;
  Randomize;

  min := AMinValue;
  max := AMaxValue;
  case ALevel of
  1: begin
		  QTitle := 'Multiplication, Focus on '+intToStr(AMinValue);
    end;
  2: begin
		  QTitle := 'Multiplication, Practice numbers between '+intToStr(AMinValue)+' and '+intToStr(AMaxValue);
    end;
  end;

	counter := 0;
	while( counter < 15) do begin
//  for counter := 1 to 15 do begin

		if ALevel = 1 then begin
			lft := Random(max) +1;
			rht := min;
		end else begin
			lft := Random(max -min +1) +min;
			rht := Random(max -min +1) +min;
		end;

		if lft > rht then
			stmp := intToStr( Floor(lft)) +'|'+intToStr( Floor(rht))+'='+intToStr( Floor(lft) * Floor(rht) )
		else
			stmp := intToStr( Floor(rht)) +'|'+intToStr( Floor(lft))+'='+intToStr( Floor(rht) * Floor(lft) );

		//if(-1 = FQuestions.IndexOf(stmp) then begin
		idx := FQuestions.Count -1;
		if (idx < 0) then
			FQuestions.AddObject(stmp, TObject(1))
		else
		if (idx = 0) and (FQuestions[idx] <> stmp) then
			FQuestions.AddObject(stmp, TObject(1))
		else
		if (FQuestions[idx] <> stmp)
		and (FQuestions[idx-1] <> stmp) then begin
  		//insure stmp occurs no more than twice
			itmp := FQuestions.IndexOf(stmp);
			if(itmp = -1) then
				FQuestions.AddObject(stmp, TObject(1))
			else begin
				//only allow value to appear twice in list
				itmp := integer(FQuestions.Objects[itmp]) +1;
				if(itmp = 2) then
					FQuestions.AddObject(stmp, TObject(itmp));
			end;
		end;

		if (idx+1) < FQuestions.Count then
			inc(counter);
	end;
end;


function TClsMathQuestions.Count: integer;
begin
	result := FQuestions.Count;
end;

end.
