//+------------------------------------------------------------------+
//|                                                         Base.mqh |
//|                                   Copyright 2025, Milad Alizade. |
//|                   https://www.mql5.com/en/users/MiladAlizade2559 |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, Milad Alizade."
#property link      "https://www.mql5.com/en/users/MiladAlizade2559"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Includes                                                         |
//+------------------------------------------------------------------+
#include <../Defines.mqh>
//+------------------------------------------------------------------+
//| Class CBase                                                      |
//| Usage: Base class for storing elements                           |
//+------------------------------------------------------------------+
class CBase
   {
private:
    ENUM_VARIABLES_FLAGS   m_flag;              // flag variables
    string                 m_values[];          // values array for flag variables
    int                    m_values_total;      // values array size
private:
    //--- Functions to control working with m_values array
    int              Add(const string value);
    string           Sub(void);
    //--- Functions to control the work of converting strings to any type
    template<typename T>
    int              StringToArray(const string value,T &array[],const string delimiter = ",");
    int              StringToBoolArray(const string value,bool &array[],const string delimiter = ",");
    template<typename T>
    int              StringToEnumArray(const string value,T &array[],const string delimiter = ",");
    template<typename T>
    int              StringToObject(const string value,T &var,const string delimiter = ",");
    template<typename T>
    int              StringToObjectArray(const string value,T &array[],const string delimiter_obj = ",",const string delimiter = "\n");
    //--- Functions to control the conversion of any type to a string
    template<typename T>
    string           ArrayToString(const T &array[],const string delimiter = ",");
    string           BoolArrayToString(const bool &array[],const string delimiter = ",");
    template<typename T>
    string           EnumArrayToString(const T &array[],const string delimiter = ",");
    template<typename T>
    string           ObjectToString(T &var,const string delimiter = ",");
    template<typename T>
    string           ObjectArrayToString(T &array[],const string delimiter_obj = ",",const string delimiter = "\n");
    //--- Functions to control working with variables
    template<typename T>
    void              Variable(T &var,const string var_name);
    void              VariableBool(bool &var,const string var_name);
    template<typename T>
    void              VariableEnum(T &var,const string var_name);
    template<typename T>
    void              VariableObject(T &var,const string var_name,const string delimiter = ",");
    //--- Functions to control working with array variables
    template<typename T>
    void              VariableArray(T &array[],const string var_name,const string delimiter = ",");
    void              VariableBoolArray(bool &array[],const string var_name,const string delimiter = ",");
    template<typename T>
    void              VariableEnumArray(T &array[],const string var_name,const string delimiter = ",");
    template<typename T>
    void              VariableObjectArray(T &Array[],const string var_name,const string delimiter_obj = ",",const string delimiter = "\n");
public:
                     CBase(void);
                    ~CBase(void);
    //--- Functions to control working with variables
    virtual int      Variables(const ENUM_VARIABLES_FLAGS flag,string &array[]);
    int              Variables(string &array[]);
   };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CBase::CBase(void) : m_values_total(0)
   {
   }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CBase::~CBase(void)
   {
   }
//+------------------------------------------------------------------+
//| Variables working with variables flags                           |
//+------------------------------------------------------------------+
int CBase::Variables(const ENUM_VARIABLES_FLAGS flag,string &array[])
   {
//--- set flag for working
    m_flag = flag;
//--- copy array to m_values array
    ArrayCopy(m_values,array);
//--- set m_values total
    m_values_total = ArraySize(m_values);
//--- return values size
    return(m_values_total);
   }
//+------------------------------------------------------------------+
//| Variables working with variables flags                           |
//+------------------------------------------------------------------+
int CBase::Variables(string &array[])
   {
//--- copy m_values array to array
    ArrayCopy(array,m_values);
//--- return values size
    return(m_values_total);
   }
//+------------------------------------------------------------------+
//| Add value to m_values array                                      |
//+------------------------------------------------------------------+
int CBase::Add(const string value)
   {
//--- resize m_values array
    ArrayResize(m_values,m_values_total + 1);
//--- add value
    m_values[m_values_total] = value;
//--- update m_values_total
    m_values_total ++;
//--- return values size
    return(m_values_total);
   }
//+------------------------------------------------------------------+
//| Sub value from m_values array                                    |
//+------------------------------------------------------------------+
string CBase::Sub(void)
   {
//--- get value
    string value = m_values[0];
//--- remove value from m_values array and update m_values_total
    if(ArrayRemove(m_values,0,1))
        m_values_total --;
//--- return value
    return(value);
   }
//+------------------------------------------------------------------+
//| Convert string to any type except bool, enum and object          |
//+------------------------------------------------------------------+
template<typename T>
int CBase::StringToArray(const string value,T &array[],const string delimiter = ",")
   {
//--- get string between [ and ] from value string
    string values = StringSubstr(value,1,-1);
    values = StringSubstr(values,0,StringLen(values) - 1);
//--- splite value string with delimiter
    string result[];
    int size = StringSplit(values,StringGetCharacter(delimiter,0),result);
//--- resize array
    ArrayResize(array,size);
//--- convert string to T type and add to array
    for(int i = 0;i < size;i++)
       {
        array[i] = (T)result[i];
       }
//--- retutn array size
    return(size);
   }
//+------------------------------------------------------------------+
//| Convert string to type bool                                      |
//+------------------------------------------------------------------+
int CBase::StringToBoolArray(const string value,bool &array[],const string delimiter = ",")
   {
//--- get string between [ and ] from value string
    string values = StringSubstr(value,1,-1);
    values = StringSubstr(values,0,StringLen(values) - 1);
//--- splite value string with delimiter
    string result[];
    int size = StringSplit(values,StringGetCharacter(delimiter,0),result);
//--- resize array
    ArrayResize(array,size);
//--- convert string to T type and add to array
    for(int i = 0;i < size;i++)
       {
        //--- compate result is true or not
        array[i] = StringCompare(result[i],"true",false) == 0 ? true : false;
       }
//--- retutn array size
    return(size);
   }
//+------------------------------------------------------------------+
//| Convert string to any type enumerations                          |
//+------------------------------------------------------------------+
template<typename T>
int CBase::StringToEnumArray(const string value,T &array[],const string delimiter = ",")
   {
//--- get string between [ and ] from value string
    string values = StringSubstr(value,1,-1);
    values = StringSubstr(values,0,StringLen(values) - 1);
//--- splite value string with delimiter
    string result[];
    int size = StringSplit(values,StringGetCharacter(delimiter,0),result);
//--- resize array
    ArrayResize(array,size);
//--- convert string to T type and add to array
    for(int i = 0;i < size;i++)
       {
        //--- get string between ( and ) and convert to T enum type
        array[i] = (T)StringSubstr(result[i],StringFind(result[i],"(",0) + 1,StringLen(result[i]));
       }
//--- retutn array size
    return(size);
   }
//+------------------------------------------------------------------+
//| Convert string to any type objects                               |
//+------------------------------------------------------------------+
template<typename T>
int CBase::StringToObject(const string value,T &var,const string delimiter = ",")
   {
//--- convert value string to array string with delimiter
    string values[];
    int size = StringToArray(value,values,delimiter);
//--- set values array to object values
    return(var.Variables(SET_VALUES,values));
   }
//+------------------------------------------------------------------+
//| Convert string to any type objects array                         |
//+------------------------------------------------------------------+
template<typename T>
int CBase::StringToObjectArray(const string value,T &array[],const string delimiter_obj = ",",const string delimiter = "\n")
   {
//--- convert value string to array string with delimiter
    string values[];
    int size = StringToArray(value,values,delimiter);
//--- resize object array
    ArrayResize(array,size);
//--- converting string to object with delimiter_obj
    for(int i = 0; i < size; i++)
       {
        StringToObject(values[i],array[i],delimiter_obj);
       }
//--- return size array
    return(size);
   }
//+------------------------------------------------------------------+
//| Convert an array of any type except enum and object to string    |
//+------------------------------------------------------------------+
template<typename T>
string CBase::ArrayToString(const T &array[],const string delimiter = ",")
   {
//--- get and check array size
    int size = ArraySize(array);
    if(size <= 0)
        return("");
//--- create value string and add first [ to value
    string value = "[";
//--- converting values array and add to value string + delimiter
    for(int i = 0; i < size - 1; i++)
       {
        value += StringFormat("%s%s",(string)array[i],delimiter);
       }
//--- add values array to value string + ]
    value += StringFormat("%s]",(string)array[size - 1]);
//--- return value string
    return(value);
   }
//+------------------------------------------------------------------+
//| Converting an array from bool type to string                     |
//+------------------------------------------------------------------+
string CBase::BoolArrayToString(const bool &array[],const string delimiter = ",")
   {
//--- convering bool array to value string with delimiter
    return(ArrayToString(array,delimiter));
   }
//+------------------------------------------------------------------+
//| Converting an array from an enumerations type to string          |
//+------------------------------------------------------------------+
template<typename T>
string CBase::EnumArrayToString(const T &array[],const string delimiter = ",")
   {
//--- get and check array size
    int size = ArraySize(array);
    if(size <= 0)
        return("");
//--- create value string and add first [ to value
    string value = "[";
//--- converting values array and add to value string + delimiter
    for(int i = 0; i < size - 1; i++)
       {
        //--- add value enum to between ( )
        value += StringFormat("%s(%d)%s",EnumToString(array[i]),array[i],delimiter);
       }
//--- add values array to value string + ]
    value += StringFormat("%s(%d)]",EnumToString(array[size - 1]),array[size - 1]);
//--- return value string
    return(value);
   }
//+------------------------------------------------------------------+
//| Converting an object type to string                              |
//+------------------------------------------------------------------+
template<typename T>
string CBase::ObjectToString(T &var,const string delimiter = ",")
   {
//--- get values array from object
    string values[];
    var.Variables(GET_VALUES,values);
//--- converting string array to value string with delimiter
    return(ArrayToString(values,delimiter));
   }
//+------------------------------------------------------------------+
//| Converting an array from an object type to string                |
//+------------------------------------------------------------------+
template<typename T>
string CBase::ObjectArrayToString(T &array[],const string delimiter_obj = ",",const string delimiter = "\n")
   {
//--- create values
    string values[];
//--- get array size
    int size = ArraySize(array);
//--- resize values array
    ArrayResize(values,size);
//--- converting object values to string value with delimiter and add to values array
    for(int i = 0; i < size; i++)
       {
        values[i] = ObjectToString(array[i],delimiter_obj);
       }
//--- converting values array to string value with delimiter
    return(ArrayToString(values,delimiter));
   }
//+------------------------------------------------------------------+
//| Working with variables of any type except bool, enum and object  |
//+------------------------------------------------------------------+
template<typename T>
void CBase::Variable(T &var,const string var_name)
   {
//--- check m_flag
    switch(m_flag)
       {
        case GET_TYPES:
           {
            //--- geting var type and add to m_values array
            Add(typename(T));
            break;
           }
        case GET_NAMES:
           {
            //--- adding var name to m_values array
            Add(var_name);
            break;
           }
        case GET_VALUES:
           {
            //--- converting value var to string and add to m_values array
            Add((string)var);
            break;
           }
        case SET_VALUES:
           {
            //--- geting value string from m_values array and converting value to var type
            var = (T)Sub();
            break;
           }
       }
   }
//+------------------------------------------------------------------+
//| Working with variables of type bool                              |
//+------------------------------------------------------------------+
void CBase::VariableBool(bool &var,const string var_name)
   {
//--- check m_flag
    switch(m_flag)
       {
        case GET_TYPES:
           {
            //--- geting var type and add to m_values array
            Add(typename(bool));
            break;
           }
        case GET_NAMES:
           {
            //--- adding var name to m_values array
            Add(var_name);
            break;
           }
        case GET_VALUES:
           {
            //--- converting value var to string and add to m_values array
            Add((string)var);
            break;
           }
        case SET_VALUES:
           {
            //--- geting value string from m_values array and converting value to var type
            var = StringCompare(Sub(),"true",false) == 0 ? true : false;
            break;
           }
       }
   }
//+------------------------------------------------------------------+
//| Working with variables of any type enumeration                   |
//+------------------------------------------------------------------+
template<typename T>
void CBase::VariableEnum(T &var,const string var_name)
   {
//--- check m_flag
    switch(m_flag)
       {
        case GET_TYPES:
           {
            //--- geting var type and add to m_values array
            Add(typename(T));
            break;
           }
        case GET_NAMES:
           {
            //--- adding var name to m_values array
            Add(var_name);
            break;
           }
        case GET_VALUES:
           {
            //--- converting value var to string and add to m_values array
            Add(StringFormat("%s(%d)",EnumToString(var),var));
            break;
           }
        case SET_VALUES:
           {
            //--- geting value string from m_values array
            string value = Sub();
            //--- converting value to var type
            var = (T)StringSubstr(value,StringFind(value,"(",0) + 1,StringLen(value));
            break;
           }
       }
   }
//+------------------------------------------------------------------+
//| Working with variables of any type objects                       |
//+------------------------------------------------------------------+
template<typename T>
void CBase::VariableObject(T &var,const string var_name,const string delimiter = ",")
   {
//--- check m_flag
    switch(m_flag)
       {
        case GET_TYPES:
           {
            //--- geting var type and add to m_values array
            Add(typename(T));
            break;
           }
        case GET_NAMES:
           {
            //--- adding var name to m_values array
            Add(var_name);
            break;
           }
        case GET_VALUES:
           {
            //--- get value string from object and add to m_values array
            Add(ObjectToString(var,delimiter));
            break;
           }
        case SET_VALUES:
           {
            //--- geting value string from m_values array and set to object
            StringToObject(Sub(),var,delimiter);
            break;
           }
       }
   }
//+------------------------------------------------------------------+
//| Working with array variables of any type except bool,            |
//| enum and object                                                  |
//+------------------------------------------------------------------+
template<typename T>
void CBase::VariableArray(T &array[],const string var_name,const string delimiter = ",")
   {
//--- check m_flag
    switch(m_flag)
       {
        case GET_TYPES:
           {
            //--- geting var type and add to m_values array
            Add(typename(T));
            break;
           }
        case GET_NAMES:
           {
            //--- adding var name to m_values array
            Add(var_name);
            break;
           }
        case GET_VALUES:
           {
            //--- converting array to string and add to m_values array
            Add(ArrayToString(array,delimiter));
            break;
           }
        case SET_VALUES:
           {
            //--- geting value string from m_values array and set to array
            StringToArray(Sub(),array,delimiter);
            break;
           }
       }
   }
//+------------------------------------------------------------------+
//| Working with array variables of type bool                        |
//+------------------------------------------------------------------+
void CBase::VariableBoolArray(bool &array[],const string var_name,const string delimiter = ",")
   {
//--- check m_flag
    switch(m_flag)
       {
        case GET_TYPES:
           {
            //--- geting var type and add to m_values array
            Add(typename(bool));
            break;
           }
        case GET_NAMES:
           {
            //--- adding var name to m_values array
            Add(var_name);
            break;
           }
        case GET_VALUES:
           {
            //--- converting bool array to string and add to m_values array
            Add(BoolArrayToString(array,delimiter));
            break;
           }
        case SET_VALUES:
           {
            //--- geting value string from m_values array and converting value to bool array
            StringToBoolArray(Sub(),array,delimiter);
            break;
           }
       }
   }
//+------------------------------------------------------------------+
//| Working with array variables of any type enumeration             |
//+------------------------------------------------------------------+
template<typename T>
void CBase::VariableEnumArray(T &array[],const string var_name,const string delimiter = ",")
   {
//--- check m_flag
    switch(m_flag)
       {
        case GET_TYPES:
           {
            //--- geting var type and add to m_values array
            Add(typename(T));
            break;
           }
        case GET_NAMES:
           {
            //--- adding var name to m_values array
            Add(var_name);
            break;
           }
        case GET_VALUES:
           {
            //--- converting enum array to string and add to m_values array
            Add(EnumArrayToString(array,delimiter));
            break;
           }
        case SET_VALUES:
           {
            //--- geting value string from m_values array and converting value to enum array
            StringToEnumArray(Sub(),array,delimiter);
            break;
           }
       }
   }
//+------------------------------------------------------------------+
//| Working with array variables of any type objects                 |
//+------------------------------------------------------------------+
template<typename T>
void CBase::VariableObjectArray(T &Array[],const string var_name,const string delimiter_obj = ",",const string delimiter = "\n")
   {
//--- check m_flag
    switch(m_flag)
       {
        case GET_TYPES:
           {
            //--- geting var type and add to m_values array
            Add(typename(T));
            break;
           }
        case GET_NAMES:
           {
            //--- adding var name to m_values array
            Add(var_name);
            break;
           }
        case GET_VALUES:
           {
            //--- get value string from object array and add to m_values array
            Add(ObjectArrayToString(var,delimiter_obj,delimiter));
            break;
           }
        case SET_VALUES:
           {
            //--- geting value string from m_values array and set to object array
            StringToObjectArray(Sub(),var,delimiter_obj,delimiter);
            break;
           }
       }
   }
//+------------------------------------------------------------------+
