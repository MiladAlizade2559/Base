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
#define _uchar(var)              UChar(var,#var)
#define _char(var)               Char(var,#var)
#define _ushort(var)             UShort(var,#var)
#define _short(var)              Short(var,#var)
#define _uint(var)               UInt(var,#var)
#define _int(var)                Int(var,#var)
#define _ulong(var)              ULong(var,#var)
#define _long(var)               Long(var,#var)
#define _float(var)              Float(var,#var)
#define _double(var)             Double(var,#var)
#define _bool(var)               Bool(var,#var)
#define _color(var)              Color(var,#var)
#define _datetime(var)           DateTime(var,#var)
#define _string(var)             String(var,#var)
#define _enum(var)               Enum(var,#var)
#define _struct(var)             Object(var,#var)
#define _class(var)              Object(var,#var)
//--- Defines to control working with array variables of any type
#define _uchar_array(var)        UCharArray(var,#var)
#define _char_array(var)         CharArray(var,#var)
#define _ushort_array(var)       UShortArray(var,#var)
#define _short_array(var)        ShortArray(var,#var)
#define _uint_array(var)         UIntArray(var,#var)
#define _int_array(var)          IntArray(var,#var)
#define _ulong_array(var)        ULongArray(var,#var)
#define _long_array(var)         LongArray(var,#var)
#define _float_array(var)        FloatArray(var,#var)
#define _double_array(var)       DoubleArray(var,#var)
#define _bool_array(var)         BoolArray(var,#var)
#define _color_array(var)        ColorArray(var,#var)
#define _datetime_array(var)     DateTimeArray(var,#var)
#define _string_array(var)       StringArray(var,#var)
#define _enum_array(var)         EnumArray(var,#var)
#define _struct_array(var)       ObjectArray(var,#var)
#define _class_array(var)        ObjectArray(var,#var)
//+------------------------------------------------------------------+
