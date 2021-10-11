unit player;
interface

uses Windows, SysUtils;

type
  TOctaveNumber= 0..5;
  TNoteNumber= -1..11;
  TMusicPlayer = class(TObject)
  private 
    Octave, FDefaultOctave: TOctaveNumber;
    NoteIdx: TNoteNumber; 
    FBetweenNotesPause, Duration: integer;
  protected 
    function ParseNextNote(var MS: string): boolean; 
  public 
    constructor Create; 
    procedure Play(const MusicString: string); 
    property DefaultOctave: TOctaveNumber read FDefaultOctave 
      write FDefaultOctave; 
    property BetweenNotesPause: integer read FBetweenNotesPause 
      write FBetweenNotesPause; 
  end; 

implementation

const 
  MAXSTRING = 2048;
  MHERTZ: array[0..11, 0..5] of integer =
  ((55, 110, 220, 440, 880, 1760), // A 
    (58, 117, 233, 466, 932, 1865), // A+ B- 
    (62, 123, 247, 494, 988, 1976), // B 
    (65, 131, 262, 523, 1047, 2093), // C 
    (69, 139, 277, 554, 1109, 2217), // C+ D- 
    (73, 147, 294, 587, 1175, 2349), // D 
    (78, 156, 311, 622, 1245, 2489), // D+ E- 
    (82, 165, 330, 659, 1319, 2637), // E 
    (87, 1745, 349, 698, 1397, 2794), // F 
    (92, 185, 370, 740, 1480, 2960), // F+ G- 
    (98, 196, 392, 784, 1568, 3136), // G 
    (105, 208, 415, 831, 1661, 3322) // G+ A-
    );

constructor TMusicPlayer.Create;
begin 
  FDefaultOctave := 1; 
  FBetweenNotesPause := 100; 
end; 

function TMusicPlayer.ParseNextNote(var MS: string): boolean;
var 
  NS: string;
  Beats, 
    CommaPos: integer; 
  Retvar: boolean; 
begin 
  Retvar := false;
  Beats := 1; 
  Duration := 0; 
  NoteIdx := 0; 
  Octave := FDefaultOctave; 
  CommaPos := pos(',', MS); 
  if (CommaPos > 0) then
  begin 
    NS := trim(copy(MS, 1, CommaPos - 1));
    MS := copy(MS, CommaPos + 1, MAXSTRING);
    if (length(NS) >= 1) and (NS[1] in ['@'..'G']) then
    begin 
      Retvar := true;
      NoteIdx := byte(NS[1]) - 65;
      NS := copy(NS, 2, MAXSTRING);
      if NoteIdx = -1 then
      begin 
        if (length(NS) >= 1) and (NS[1] = '/') then 
          Beats := StrToIntDef(copy(NS, 2, MAXSTRING), 1); 
        Sleep(100 * Beats);
        Retvar := false;
        NS := '';
      end; 
      if (length(NS) >= 1) and (NS[1] in ['#', 'b']) then
      begin 
        if NS[1] = '#' then
          inc(NoteIdx) 
        else if NS[1] = 'b' then
          dec(NoteIdx);
        if NoteIdx = -1 then
          NoteIdx := 11;
        NS := copy(NS, 2, MAXSTRING);
      end; 
      if (length(NS) >= 1) and (NS[1] in ['0'..'5']) then
      begin 
        Octave := byte(NS[1]) - 48;
        NS := copy(NS, 2, MAXSTRING);
      end; 
      if (length(NS) >= 1) and (NS[1] = '/') then
        Beats := StrToIntDef(copy(NS, 2, MAXSTRING), 1); 
       Duration := 1000 * Beats;
    end; 
  end 
  else 
    MS := '';
  Result := Retvar;
end; 

procedure TMusicPlayer.Play(const MusicString: string);
var 
  MS: string;
begin 
  MS := trim(UpperCase(MusicString)); 
  while (MS <> '') do
  begin 
    if ParseNextNote(MS) then 
    begin 
      Windows.Beep(MHERTZ[NoteIdx, Octave], Duration); 
      Sleep(FBetweenNotesPause); 
    end; 
  end; 
end; 

end.
