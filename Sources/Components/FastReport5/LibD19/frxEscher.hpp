﻿// CodeGear C++Builder
// Copyright (c) 1995, 2013 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'frxEscher.pas' rev: 26.00 (Windows)

#ifndef FrxescherHPP
#define FrxescherHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.Types.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Frxescher
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TEscherStream;
class DELPHICLASS TEscherRec;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TEscherStream : public System::Classes::TMemoryStream
{
	typedef System::Classes::TMemoryStream inherited;
	
private:
	System::Classes::TList* Records;
	
public:
	__fastcall TEscherStream(void);
	__fastcall virtual ~TEscherStream(void);
	virtual void __fastcall Flush(System::Classes::TStream* Stream);
	void __fastcall WriteVal(unsigned Value, unsigned Count);
	TEscherRec* __fastcall Add(void)/* overload */;
	TEscherRec* __fastcall Add(System::Byte Version, System::Word Instance, System::Word Kind)/* overload */;
	TEscherRec* __fastcall AddCont(System::Word Instance, System::Word Kind)/* overload */;
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TEscherRec : public TEscherStream
{
	typedef TEscherStream inherited;
	
public:
	System::Byte Version;
	System::Word Instance;
	System::Word Kind;
	virtual void __fastcall Flush(System::Classes::TStream* Stream);
	unsigned __fastcall GetESize(void);
public:
	/* TEscherStream.Create */ inline __fastcall TEscherRec(void) : TEscherStream() { }
	/* TEscherStream.Destroy */ inline __fastcall virtual ~TEscherRec(void) { }
	
};

#pragma pack(pop)

typedef System::Byte TEscherBlipKind;

typedef System::Word TEscherBlipSign;

class DELPHICLASS TEscherPicture;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TEscherPicture : public System::Classes::TMemoryStream
{
	typedef System::Classes::TMemoryStream inherited;
	
public:
	System::Byte Kind;
	virtual unsigned __fastcall GetESize(void) = 0 ;
	virtual void __fastcall Flush(System::Classes::TStream* Stream) = 0 ;
public:
	/* TMemoryStream.Destroy */ inline __fastcall virtual ~TEscherPicture(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TEscherPicture(void) : System::Classes::TMemoryStream() { }
	
};

#pragma pack(pop)

class DELPHICLASS TEscherBitmap;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TEscherBitmap : public TEscherPicture
{
	typedef TEscherPicture inherited;
	
public:
	virtual unsigned __fastcall GetESize(void);
	virtual void __fastcall Flush(System::Classes::TStream* Stream);
public:
	/* TMemoryStream.Destroy */ inline __fastcall virtual ~TEscherBitmap(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TEscherBitmap(void) : TEscherPicture() { }
	
};

#pragma pack(pop)

class DELPHICLASS TEscherMetafile;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TEscherMetafile : public TEscherPicture
{
	typedef TEscherPicture inherited;
	
public:
	System::Types::TRect Bounds;
	System::Types::TPoint MFSize;
	bool Compr;
	virtual unsigned __fastcall GetESize(void);
	virtual void __fastcall Flush(System::Classes::TStream* Stream);
public:
	/* TMemoryStream.Destroy */ inline __fastcall virtual ~TEscherMetafile(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TEscherMetafile(void) : TEscherPicture() { }
	
};

#pragma pack(pop)

typedef System::StaticArray<System::Byte, 16> TEscherBlipHash;

class DELPHICLASS TEscherBlip;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TEscherBlip : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	TEscherBlipHash Hash;
	unsigned RefCount;
	TEscherPicture* Pict;
	unsigned Index;
	__fastcall TEscherBlip(TEscherPicture* Pict);
	__fastcall virtual ~TEscherBlip(void);
	void __fastcall Flush(TEscherStream* Stream);
};

#pragma pack(pop)

class DELPHICLASS TEscherProp;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TEscherProp : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	System::Word Id;
	bool Blip;
	bool Complex;
	int Value;
	__fastcall TEscherProp(System::Word Id);
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TEscherProp(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS TEscherPropList;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TEscherPropList : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	System::Classes::TList* FS;
	
public:
	__fastcall TEscherPropList(void);
	__fastcall virtual ~TEscherPropList(void);
	TEscherProp* __fastcall Add(System::Word Id);
	void __fastcall Flush(TEscherStream* Stream);
};

#pragma pack(pop)

class DELPHICLASS TEscherShapePos;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TEscherShapePos : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	int Left;
	int Top;
	int Right;
	int Bottom;
	int LeftOffset;
	int TopOffset;
	int RightOffset;
	int BottomOffset;
	void __fastcall Flush(TEscherStream* Stream);
public:
	/* TObject.Create */ inline __fastcall TEscherShapePos(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TEscherShapePos(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS TEscherShape;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TEscherShape : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	unsigned Id;
	unsigned Flags;
	unsigned Image;
	TEscherShapePos* Pos;
	__fastcall TEscherShape(void);
	__fastcall virtual ~TEscherShape(void);
	void __fastcall Flush(TEscherStream* Stream);
};

#pragma pack(pop)

class DELPHICLASS TEscherGroup;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TEscherGroup : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	TEscherShape* operator[](int Index) { return Items[Index]; }
	
private:
	unsigned SId;
	System::Classes::TList* Shapes;
	TEscherShape* __fastcall GetShape(int Index);
	unsigned __fastcall GetSId(void);
	unsigned __fastcall GetRId(void);
	
public:
	unsigned Id;
	__fastcall TEscherGroup(void);
	__fastcall virtual ~TEscherGroup(void);
	void __fastcall Flush(TEscherStream* Stream);
	unsigned __fastcall Count(void);
	TEscherShape* __fastcall Add(void);
	unsigned __fastcall GetMaxSId(void);
	__property TEscherShape* Items[int Index] = {read=GetShape/*, default*/};
};

#pragma pack(pop)

class DELPHICLASS TEscherStorage;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TEscherStorage : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	System::Classes::TList* Groups;
	System::Classes::TList* Images;
	TEscherGroup* __fastcall GetGroup(int Index);
	TEscherBlip* __fastcall GetImage(int Index);
	
public:
	TEscherPropList* Props;
	__fastcall TEscherStorage(void);
	__fastcall virtual ~TEscherStorage(void);
	TEscherGroup* __fastcall AddGroup(void);
	TEscherBlip* __fastcall AddImage(TEscherPicture* Pict);
	bool __fastcall Empty(void);
	void __fastcall Flush(TEscherStream* Stream);
	__property TEscherBlip* Image[int Index] = {read=GetImage};
	__property TEscherGroup* Group[int Index] = {read=GetGroup};
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
static const System::Word EscherRkBse = System::Word(0xf007);
static const System::Word EscherRkBlip = System::Word(0xf018);
static const System::Word EscherRkDggc = System::Word(0xf000);
static const System::Word EscherRkDgg = System::Word(0xf006);
static const System::Word EscherRkBstore = System::Word(0xf001);
static const System::Word EscherRkSpCont = System::Word(0xf004);
static const System::Word EscherRkSp = System::Word(0xf00a);
static const System::Word EscherRkOpts = System::Word(0xf00b);
static const System::Word EscherRkAnchor = System::Word(0xf00e);
static const System::Word EscherRkDgCont = System::Word(0xf002);
static const System::Word EscherRkDg = System::Word(0xf008);
static const System::Word EscherRkSpgrCont = System::Word(0xf003);
static const System::Word EscherRkSpgr = System::Word(0xf009);
static const System::Word EscherRkSMC = System::Word(0xf11e);
static const System::Word EscherRkCData = System::Word(0xf011);
static const System::Word EscherRkCAnchor = System::Word(0xf010);
static const System::Int8 EscherBkEMF = System::Int8(0x2);
static const System::Int8 EscherBkWMF = System::Int8(0x3);
static const System::Int8 EscherBkJPEG = System::Int8(0x5);
static const System::Int8 EscherBkPNG = System::Int8(0x6);
static const System::Int8 EscherBkDIB = System::Int8(0x7);
static const System::Int8 EscherBkTIFF = System::Int8(0x8);
static const System::Int8 EscherBsUnknown = System::Int8(0x0);
static const System::Word EscherBsWMF = System::Word(0x216);
static const System::Word EscherBsEMF = System::Word(0x3d4);
static const System::Word EscherBsPNG = System::Word(0x6e0);
static const System::Word EscherBsJPEG = System::Word(0x46a);
static const System::Word EscherBsDIB = System::Word(0x7a8);
static const System::Word EscherBsTIFF = System::Word(0x6e4);
static const System::Int8 EscherBuDefault = System::Int8(0x0);
static const System::Int8 EscherBuTexture = System::Int8(0x1);
static const System::Int8 EscherMcDeflate = System::Int8(0x0);
static const System::Byte EscherMcNone = System::Byte(0xfe);
static const System::Int8 EscherSfGroup = System::Int8(0x1);
static const System::Int8 EscherSfChild = System::Int8(0x2);
static const System::Int8 EscherSfRoot = System::Int8(0x4);
static const System::Int8 EscherSfDeleted = System::Int8(0x8);
static const System::Int8 EscherSfOle = System::Int8(0x10);
static const System::Int8 EscherSfMaster = System::Int8(0x20);
static const System::Int8 EscherSfFlipHor = System::Int8(0x40);
static const System::Byte EscherSfFlipVer = System::Byte(0x80);
static const System::Word EscherSfConn = System::Word(0x100);
static const System::Word EscherSfAnchor = System::Word(0x200);
static const System::Word EscherSfBg = System::Word(0x400);
static const System::Word EscherSfShape = System::Word(0x800);
static const System::Int8 EscherStNone = System::Int8(0x0);
static const System::Int8 EscherStPictureFrame = System::Int8(0x4b);
static const System::Word EscherGroupLimit = System::Word(0x400);
extern DELPHI_PACKAGE System::Word __fastcall EscherGetBlipSign(System::Byte Kind);
extern DELPHI_PACKAGE void __fastcall EscherGetBlipHash(/* out */ TEscherBlipHash &Hash, System::Classes::TMemoryStream* Blip);
}	/* namespace Frxescher */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FRXESCHER)
using namespace Frxescher;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FrxescherHPP
