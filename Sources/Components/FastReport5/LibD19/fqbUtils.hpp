﻿// CodeGear C++Builder
// Copyright (c) 1995, 2013 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'fqbUtils.pas' rev: 26.00 (Windows)

#ifndef FqbutilsHPP
#define FqbutilsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <fqbZLib.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Fqbutils
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE unsigned __fastcall fqbStringCRC32(const System::AnsiString Str);
extern DELPHI_PACKAGE System::UnicodeString __fastcall fqbGetUniqueFileName(const System::UnicodeString Prefix);
extern DELPHI_PACKAGE System::UnicodeString __fastcall fqbTrim(const System::UnicodeString Input, const System::Sysutils::TSysCharSet &EArray);
extern DELPHI_PACKAGE System::UnicodeString __fastcall fqbParse(System::UnicodeString Char, System::UnicodeString S, int Count, bool Last = false);
extern DELPHI_PACKAGE System::AnsiString __fastcall fqbBase64Decode(const System::AnsiString S);
extern DELPHI_PACKAGE System::AnsiString __fastcall fqbBase64Encode(const System::AnsiString S);
extern DELPHI_PACKAGE System::UnicodeString __fastcall fqbCompress(const System::UnicodeString S);
extern DELPHI_PACKAGE System::UnicodeString __fastcall fqbDeCompress(const System::UnicodeString S);
extern DELPHI_PACKAGE void __fastcall fqbDeflateStream(System::Classes::TStream* Source, System::Classes::TStream* Dest, Fqbzlib::TZCompressionLevel Compression = (Fqbzlib::TZCompressionLevel)(0x2));
extern DELPHI_PACKAGE void __fastcall fqbInflateStream(System::Classes::TStream* Source, System::Classes::TStream* Dest);
}	/* namespace Fqbutils */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FQBUTILS)
using namespace Fqbutils;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FqbutilsHPP
