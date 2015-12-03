unit winioctl;

interface

function CTL_CODE(aDeviceType: Integer; aFunction: Integer; aMethod: Integer; aAccess:Integer): Integer;

function isalnum(c: Integer): Integer;
function isalpha(c: Integer): Integer;
function isprint(c: Integer): Integer;
function isspace(c: Integer): Integer;
function tolower(c: Integer): Integer;

function isalnumB(c: Integer): Boolean;
function isalphaB(c: Integer): Boolean;
function isprintB(c: Integer): Boolean;
function isspaceB(c: Integer): Boolean;

const
  FILE_DEVICE_DISK = $00000007;
  IOCTL_DISK_BASE = FILE_DEVICE_DISK;
  METHOD_BUFFERED = 0;

  FILE_ANY_ACCESS = 0;
  FILE_SPECIAL_ACCESS = (FILE_ANY_ACCESS);
  FILE_READ_ACCESS = $0001;    // file & pipe
  FILE_WRITE_ACCESS = $0002;    // file & pipe

  FILE_DEVICE_MASS_STORAGE = $0000002d;
  IOCTL_STORAGE_BASE = FILE_DEVICE_MASS_STORAGE;

type
  STORAGE_BUS_TYPE = (
    BusTypeUnknown = $00,
    BusTypeScsi,
    BusTypeAtapi,
    BusTypeAta,
    BusType1394,
    BusTypeSsa,
    BusTypeFibre,
    BusTypeUsb,
    BusTypeRAID,
    BusTypeiScsi,
    BusTypeSas,
    BusTypeSata,
    BusTypeSd,
    BusTypeMmc,
    BusTypeMax,
    BusTypeMaxReserved = $7F);

    MEDIA_TYPE = (
      Unknown,                // Format is unknown
      F5_1Pt2_512,            // 5.25", 1.2MB,  512 bytes/sector
      F3_1Pt44_512,           // 3.5",  1.44MB, 512 bytes/sector
      F3_2Pt88_512,           // 3.5",  2.88MB, 512 bytes/sector
      F3_20Pt8_512,           // 3.5",  20.8MB, 512 bytes/sector
      F3_720_512,             // 3.5",  720KB,  512 bytes/sector
      F5_360_512,             // 5.25", 360KB,  512 bytes/sector
      F5_320_512,             // 5.25", 320KB,  512 bytes/sector
      F5_320_1024,            // 5.25", 320KB,  1024 bytes/sector
      F5_180_512,             // 5.25", 180KB,  512 bytes/sector
      F5_160_512,             // 5.25", 160KB,  512 bytes/sector
      RemovableMedia,         // Removable media other than floppy
      FixedMedia,             // Fixed hard disk media
      F3_120M_512,            // 3.5", 120M Floppy
      F3_640_512,             // 3.5" ,  640KB,  512 bytes/sector
      F5_640_512,             // 5.25",  640KB,  512 bytes/sector
      F5_720_512,             // 5.25",  720KB,  512 bytes/sector
      F3_1Pt2_512,            // 3.5" ,  1.2Mb,  512 bytes/sector
      F3_1Pt23_1024,          // 3.5" ,  1.23Mb, 1024 bytes/sector
      F5_1Pt23_1024,          // 5.25",  1.23MB, 1024 bytes/sector
      F3_128Mb_512,           // 3.5" MO 128Mb   512 bytes/sector
      F3_230Mb_512,           // 3.5" MO 230Mb   512 bytes/sector
      F8_256_128,             // 8",     256KB,  128 bytes/sector
      F3_200Mb_512,           // 3.5",   200M Floppy (HiFD)
      F3_240M_512,            // 3.5",   240Mb Floppy (HiFD)
      F3_32M_512              // 3.5",   32Mb Floppy
    );

  DISK_GEOMETRY = record
    Cylinders: Int64; //LARGE_INTEGER
    MediaType: MEDIA_TYPE;
    TracksPerCylinder: Cardinal;
    SectorsPerTrack: Cardinal;
    BytesPerSector: Cardinal;
  end;
  PDISK_GEOMETRY = ^DISK_GEOMETRY;

implementation

const
  _UPPER    = $01;
  _LOWER    = $02;
  _DIGIT    = $04;
  _SPACE    = $08;
  _PUNCT    = $10;
  _CONTROL  = $20;
  _BLANK    = $40;
  _HEX      = $80;
  _LEADBYTE = $8000;
  _ALPHA    = ($0100 or _UPPER or _LOWER);

  _ctype : packed array[0..255]of Word = (
  //	0,			// <EOF>, 0xFFFF */
    _CONTROL,		// CTRL+@, 0x00 */
    _CONTROL,		// CTRL+A, 0x01 */
    _CONTROL,		// CTRL+B, 0x02 */
    _CONTROL,		// CTRL+C, 0x03 */
    _CONTROL,		// CTRL+D, 0x04 */
    _CONTROL,		// CTRL+E, 0x05 */
    _CONTROL,		// CTRL+F, 0x06 */
    _CONTROL,		// CTRL+G, 0x07 */
    _CONTROL,		// CTRL+H, 0x08 */
    _CONTROL or _SPACE,	// CTRL+I, 0x09 */
    _CONTROL or _SPACE,	// CTRL+J, 0x0a */
    _CONTROL or _SPACE,	// CTRL+K, 0x0b */
    _CONTROL or _SPACE,	// CTRL+L, 0x0c */
    _CONTROL or _SPACE,	// CTRL+M, 0x0d */
    _CONTROL,		// CTRL+N, 0x0e */
    _CONTROL,		// CTRL+O, 0x0f */
    _CONTROL,		// CTRL+P, 0x10 */
    _CONTROL,		// CTRL+Q, 0x11 */
    _CONTROL,		// CTRL+R, 0x12 */
    _CONTROL,		// CTRL+S, 0x13 */
    _CONTROL,		// CTRL+T, 0x14 */
    _CONTROL,		// CTRL+U, 0x15 */
    _CONTROL,		// CTRL+V, 0x16 */
    _CONTROL,		// CTRL+W, 0x17 */
    _CONTROL,		// CTRL+X, 0x18 */
    _CONTROL,		// CTRL+Y, 0x19 */
    _CONTROL,		// CTRL+Z, 0x1a */
    _CONTROL,		// CTRL+[, 0x1b */
    _CONTROL,		// CTRL+\, 0x1c */
    _CONTROL,		// CTRL+], 0x1d */
    _CONTROL,		// CTRL+^, 0x1e */
    _CONTROL,		// CTRL+_, 0x1f */
    _SPACE or _BLANK,	// ` ', 0x20 */
    _PUNCT,			// `!', 0x21 */
    _PUNCT,			// 0x22 */
    _PUNCT,			// `#', 0x23 */
    _PUNCT,			// `$', 0x24 */
    _PUNCT,			// `%', 0x25 */
    _PUNCT,			// `&', 0x26 */
    _PUNCT,			// 0x27 */
    _PUNCT,			// `(', 0x28 */
    _PUNCT,			// `)', 0x29 */
    _PUNCT,			// `*', 0x2a */
    _PUNCT,			// `+', 0x2b */
    _PUNCT,			// `,', 0x2c */
    _PUNCT,			// `-', 0x2d */
    _PUNCT,			// `.', 0x2e */
    _PUNCT,			// `/', 0x2f */
    _DIGIT or _HEX,		// `0', 0x30 */
    _DIGIT or _HEX,		// `1', 0x31 */
    _DIGIT or _HEX,		// `2', 0x32 */
    _DIGIT or _HEX,		// `3', 0x33 */
    _DIGIT or _HEX,		// `4', 0x34 */
    _DIGIT or _HEX,		// `5', 0x35 */
    _DIGIT or _HEX,		// `6', 0x36 */
    _DIGIT or _HEX,		// `7', 0x37 */
    _DIGIT or _HEX,		// `8', 0x38 */
    _DIGIT or _HEX,		// `9', 0x39 */
    _PUNCT,			// `:', 0x3a */
    _PUNCT,			// `;', 0x3b */
    _PUNCT,			// `<', 0x3c */
    _PUNCT,			// `=', 0x3d */
    _PUNCT,			// `>', 0x3e */
    _PUNCT,			// `?', 0x3f */
    _PUNCT,			// `@', 0x40 */
    _UPPER or _HEX,		// `A', 0x41 */
    _UPPER or _HEX,		// `B', 0x42 */
    _UPPER or _HEX,		// `C', 0x43 */
    _UPPER or _HEX,		// `D', 0x44 */
    _UPPER or _HEX,		// `E', 0x45 */
    _UPPER or _HEX,		// `F', 0x46 */
    _UPPER,			// `G', 0x47 */
    _UPPER,			// `H', 0x48 */
    _UPPER,			// `I', 0x49 */
    _UPPER,			// `J', 0x4a */
    _UPPER,			// `K', 0x4b */
    _UPPER,			// `L', 0x4c */
    _UPPER,			// `M', 0x4d */
    _UPPER,			// `N', 0x4e */
    _UPPER,			// `O', 0x4f */
    _UPPER,			// `P', 0x50 */
    _UPPER,			// `Q', 0x51 */
    _UPPER,			// `R', 0x52 */
    _UPPER,			// `S', 0x53 */
    _UPPER,			// `T', 0x54 */
    _UPPER,			// `U', 0x55 */
    _UPPER,			// `V', 0x56 */
    _UPPER,			// `W', 0x57 */
    _UPPER,			// `X', 0x58 */
    _UPPER,			// `Y', 0x59 */
    _UPPER,			// `Z', 0x5a */
    _PUNCT,			// `[', 0x5b */
    _PUNCT,			// 0x5c */
    _PUNCT,			// `]', 0x5d */
    _PUNCT,			// `^', 0x5e */
    _PUNCT,			// `_', 0x5f */
    _PUNCT,			// 0x60 */
    _LOWER or _HEX,		// `a', 0x61 */
    _LOWER or _HEX,		// `b', 0x62 */
    _LOWER or _HEX,		// `c', 0x63 */
    _LOWER or _HEX,		// `d', 0x64 */
    _LOWER or _HEX,		// `e', 0x65 */
    _LOWER or _HEX,		// `f', 0x66 */
    _LOWER,			// `g', 0x67 */
    _LOWER,			// `h', 0x68 */
    _LOWER,			// `i', 0x69 */
    _LOWER,			// `j', 0x6a */
    _LOWER,			// `k', 0x6b */
    _LOWER,			// `l', 0x6c */
    _LOWER,			// `m', 0x6d */
    _LOWER,			// `n', 0x6e */
    _LOWER,			// `o', 0x6f */
    _LOWER,			// `p', 0x70 */
    _LOWER,			// `q', 0x71 */
    _LOWER,			// `r', 0x72 */
    _LOWER,			// `s', 0x73 */
    _LOWER,			// `t', 0x74 */
    _LOWER,			// `u', 0x75 */
    _LOWER,			// `v', 0x76 */
    _LOWER,			// `w', 0x77 */
    _LOWER,			// `x', 0x78 */
    _LOWER,			// `y', 0x79 */
    _LOWER,			// `z', 0x7a */
    _PUNCT,			// `{', 0x7b */
    _PUNCT,			// `|', 0x7c */
    _PUNCT,			// `}', 0x7d */
    _PUNCT,			// `~', 0x7e */
    _CONTROL,		// 0x7f */
    0,			// 0x80 */
    0,			// 0x81 */
    0,			// 0x82 */
    0,			// 0x83 */
    0,			// 0x84 */
    0,			// 0x85 */
    0,			// 0x86 */
    0,			// 0x87 */
    0,			// 0x88 */
    0,			// 0x89 */
    0,			// 0x8a */
    0,			// 0x8b */
    0,			// 0x8c */
    0,			// 0x8d */
    0,			// 0x8e */
    0,			// 0x8f */
    0,			// 0x90 */
    0,			// 0x91 */
    0,			// 0x92 */
    0,			// 0x93 */
    0,			// 0x94 */
    0,			// 0x95 */
    0,			// 0x96 */
    0,			// 0x97 */
    0,			// 0x98 */
    0,			// 0x99 */
    0,			// 0x9a */
    0,			// 0x9b */
    0,			// 0x9c */
    0,			// 0x9d */
    0,			// 0x9e */
    0,			// 0x9f */
    0,			// 0xa0 */
    0,			// 0xa1 */
    0,			// 0xa2 */
    0,			// 0xa3 */
    0,			// 0xa4 */
    0,			// 0xa5 */
    0,			// 0xa6 */
    0,			// 0xa7 */
    0,			// 0xa8 */
    0,			// 0xa9 */
    0,			// 0xaa */
    0,			// 0xab */
    0,			// 0xac */
    0,			// 0xad */
    0,			// 0xae */
    0,			// 0xaf */
    0,			// 0xb0 */
    0,			// 0xb1 */
    0,			// 0xb2 */
    0,			// 0xb3 */
    0,			// 0xb4 */
    0,			// 0xb5 */
    0,			// 0xb6 */
    0,			// 0xb7 */
    0,			// 0xb8 */
    0,			// 0xb9 */
    0,			// 0xba */
    0,			// 0xbb */
    0,			// 0xbc */
    0,			// 0xbd */
    0,			// 0xbe */
    0,			// 0xbf */
    0,			// 0xc0 */
    0,			// 0xc1 */
    0,			// 0xc2 */
    0,			// 0xc3 */
    0,			// 0xc4 */
    0,			// 0xc5 */
    0,			// 0xc6 */
    0,			// 0xc7 */
    0,			// 0xc8 */
    0,			// 0xc9 */
    0,			// 0xca */
    0,			// 0xcb */
    0,			// 0xcc */
    0,			// 0xcd */
    0,			// 0xce */
    0,			// 0xcf */
    0,			// 0xd0 */
    0,			// 0xd1 */
    0,			// 0xd2 */
    0,			// 0xd3 */
    0,			// 0xd4 */
    0,			// 0xd5 */
    0,			// 0xd6 */
    0,			// 0xd7 */
    0,			// 0xd8 */
    0,			// 0xd9 */
    0,			// 0xda */
    0,			// 0xdb */
    0,			// 0xdc */
    0,			// 0xdd */
    0,			// 0xde */
    0,			// 0xdf */
    0,			// 0xe0 */
    0,			// 0xe1 */
    0,			// 0xe2 */
    0,			// 0xe3 */
    0,			// 0xe4 */
    0,			// 0xe5 */
    0,			// 0xe6 */
    0,			// 0xe7 */
    0,			// 0xe8 */
    0,			// 0xe9 */
    0,			// 0xea */
    0,			// 0xeb */
    0,			// 0xec */
    0,			// 0xed */
    0,			// 0xee */
    0,			// 0xef */
    0,			// 0xf0 */
    0,			// 0xf1 */
    0,			// 0xf2 */
    0,			// 0xf3 */
    0,			// 0xf4 */
    0,			// 0xf5 */
    0,			// 0xf6 */
    0,			// 0xf7 */
    0,			// 0xf8 */
    0,			// 0xf9 */
    0,			// 0xfa */
    0,			// 0xfb */
    0,			// 0xfc */
    0,			// 0xfd */
    0,			// 0xfe */
    0			// 0xff */
  );

function CTL_CODE(aDeviceType: Integer; aFunction: Integer; aMethod: Integer; aAccess:Integer): Integer;
begin
    Result := ((aDeviceType) shl 16) or ((aAccess) shl 14) or ((aFunction) shl 2) or (aMethod);
end;

function _isctype(c: Longword; ctypeFlags: Integer): Integer;
begin
  Result:=_ctype[c and $FF] and ctypeFlags;
end;

function isprint(c: Integer): Integer;
begin
  Result:=_isctype(c,_BLANK or _PUNCT or _ALPHA or _DIGIT);
end;

function isspace(c: Integer): Integer;
begin
  Result:=_isctype(c,_SPACE);
end;

function tolower(c: Integer): Integer;
begin
  if _isctype(c,_UPPER)<>0 then
    Result:=(c - ord('A') - ord('a'))
  else
    Result:=c;
end;

function isalpha(c: Integer): Integer;
begin
  Result:=_isctype(c,_ALPHA);
end;

function isalnum(c: Integer): Integer;
begin
  Result:=_isctype(c,_ALPHA or _DIGIT);
end;

function isprintB(c: Integer): Boolean;
begin
  Result:=_isctype(c,_BLANK or _PUNCT or _ALPHA or _DIGIT)<>0;
end;

function isspaceB(c: Integer): Boolean;
begin
  Result:=_isctype(c,_SPACE) <> 0;
end;

function isalphaB(c: Integer): Boolean;
begin
  Result:=_isctype(c,_ALPHA)<>0;
end;

function isalnumB(c: Integer): Boolean;
begin
  Result:=_isctype(c,_ALPHA or _DIGIT)<>0;
end;

end.