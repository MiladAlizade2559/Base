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
//| Vaiables working with variables flags                            |
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
//| Vaiables working with variables flags                            |
//+------------------------------------------------------------------+
int CBase::Variables(string &array[])
   {
//--- copy m_values array to array
    ArrayCopy(array,m_values);
//--- return values size
    return(m_values_total);
   }
//+------------------------------------------------------------------+
