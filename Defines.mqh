//+------------------------------------------------------------------+
//|                                                      Defines.mqh |
//|                                   Copyright 2025, Milad Alizade. |
//|                   https://www.mql5.com/en/users/MiladAlizade2559 |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, Milad Alizade."
#property link      "https://www.mql5.com/en/users/MiladAlizade2559"
//+------------------------------------------------------------------+
//| Enumes                                                           |
//+------------------------------------------------------------------+
enum ENUM_VARIABLES_FLAGS
   {
    GET_TYPES,
    GET_NAMES,
    GET_VALUES,
    SET_VALUES,
   };
//+------------------------------------------------------------------+
//| Defines                                                          |
//+------------------------------------------------------------------+
//--- Defines to control working with variables of any type
#define UCHAR(var)              UChar(var,#var)
#define CHAR(var)               Char(var,#var)
#define USHORT(var)             UShort(var,#var)
#define SHORT(var)              Short(var,#var)
#define UINT(var)               UInt(var,#var)
#define INT(var)                Int(var,#var)
#define ULONG(var)              ULong(var,#var)
#define LONG(var)               Long(var,#var)
#define FLOAT(var)              Float(var,#var)
#define DOUBLE(var)             Double(var,#var)
#define BOOL(var)               Bool(var,#var)
#define COLOR(var)              Color(var,#var)
#define DATETIME(var)           DateTime(var,#var)
#define STRING(var)             String(var,#var)
#define ENUM(var)               Enum(var,#var)
#define STRUCT(var)             Object(var,#var)
#define CLASS(var)              Object(var,#var)
//--- Defines to control working with array variables of any type
#define UCHAR_ARRAY(var)        UCharArray(var,#var)
#define CHAR_ARRAY(var)         CharArray(var,#var)
#define USHORT_ARRAY(var)       UShortArray(var,#var)
#define SHORT_ARRAY(var)        ShortArray(var,#var)
#define UINT_ARRAY(var)         UIntArray(var,#var)
#define INT_ARRAY(var)          IntArray(var,#var)
#define ULONG_ARRAY(var)        ULongArray(var,#var)
#define LONG_ARRAY(var)         LongArray(var,#var)
#define FLOAT_ARRAY(var)        FloatArray(var,#var)
#define DOUBLE_ARRAY(var)       DoubleArray(var,#var)
#define BOOL_ARRAY(var)         BoolArray(var,#var)
#define COLOR_ARRAY(var)        ColorArray(var,#var)
#define DATETIME_ARRAY(var)     DateTimeArray(var,#var)
#define STRING_ARRAY(var)       StringArray(var,#var)
#define ENUM_ARRAY(var)         EnumArray(var,#var)
#define STRUCT_ARRAY(var)       ObjectArray(var,#var)
#define CLASS_ARRAY(var)        ObjectArray(var,#var)
//+------------------------------------------------------------------+
