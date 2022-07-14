//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

#define NL        "\n"                                                                //new line
#define WinMid    MathAbs(WindowFirstVisibleBar() - ((int)WindowBarsPerChart() / 2))  //index of middle bar
#define chart_height    ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0)                   //max height of chart
#define chart_width     ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0)                   //max width of chart
#define WinLast   MathAbs(WindowFirstVisibleBar() - (int)WindowBarsPerChart())        //index of last bar
#define Price_Mid ND(WindowPriceMax() - (WindowPriceMax() - WindowPriceMin()) / 2)    //1/2 price in a Win.
#define Price_F   ND((WindowPriceMax() - WindowPriceMin()) / 4)                       //1/4 price in a Win

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DeleteObject(string find)
  {
   for(int i = ObjectsTotal() - 1; i >= 0;  i--)
     {
      string x = ObjectName(i);
      //Print(StringFind(x,find),">>>>> ",x);
      if(StringFind(x,find))
         ObjectDelete(0, x);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VLineCreate(const long            chart_ID = 0,      // chart's ID
                 const string          name = "VLine",    // line name
                 const int             sub_window = 0,    // subwindow index
                 datetime              time = 0,          // line time
                 const color           clr = clrRed,      // line color
                 const ENUM_LINE_STYLE style = STYLE_SOLID, // line style
                 const int             width = 1,         // line width
                 const bool            back = false,      // in the background
                 const bool            selection = true,  // highlight to move
                 const bool            hidden = true,     // hidden in the object list
                 const long            z_order = 0)       // priority for mouse click
  {
//--- if the line time is not set, draw it via the last bar
   if(!time)
      time = TimeCurrent();
//--- reset the error value
   ResetLastError();
//--- create a vertical line
   if(!ObjectCreate(chart_ID, name, OBJ_VLINE, sub_window, time, 0))
     {
      Print(__FUNCTION__,
            ": failed to create a vertical line! Error code = ", GetLastError());
      return(false);
     }
//--- set line color
   ObjectSetInteger(chart_ID, name, OBJPROP_COLOR, clr);
//--- set line display style
   ObjectSetInteger(chart_ID, name, OBJPROP_STYLE, style);
//--- set line width
   ObjectSetInteger(chart_ID, name, OBJPROP_WIDTH, width);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID, name, OBJPROP_BACK, back);
//--- enable (true) or disable (false) the mode of moving the line by mouse
//--- when creating a graphical object using ObjectCreate function, the object cannot be
//--- highlighted and moved by default. Inside this method, selection parameter
//--- is true by default making it possible to highlight and move the object
   ObjectSetInteger(chart_ID, name, OBJPROP_SELECTABLE, selection);
   ObjectSetInteger(chart_ID, name, OBJPROP_SELECTED, selection);
//--- hide (true) or display (false) graphical object name in the object list
   ObjectSetInteger(chart_ID, name, OBJPROP_HIDDEN, hidden);
//--- set the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(chart_ID, name, OBJPROP_ZORDER, z_order);
//--- successful execution
   return(true);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ButtonCreate(const long              chart_ID = 0,             // chart's ID
                  const string            name = "Button",          // button name
                  const int               sub_window = 0,           // subwindow index
                  const int               x = 0,                    // X coordinate
                  const int               y = 0,                    // Y coordinate
                  const int               width = 50,               // button width
                  const int               height = 18,              // button height
                  const ENUM_BASE_CORNER  corner = CORNER_LEFT_LOWER, // chart corner for anchoring
                  const ENUM_ANCHOR_POINT anchor2 = ANCHOR_LOWER,
                  const string            text = "Button",          // text
                  const color             back_clr = C'236,233,216', // background color
                  const bool              state = false,
                  const color             clr = clrBlack,           // text color
                  const color             border_clr = clrNONE,     // border color
                  const string            font = "Arial",           // font
                  const int               font_size = 10,           // font size
                  const bool              back = false,             // in the background
                  const bool              selection = 0,        // highlight to move
                  const bool              hidden = false,            // hidden in the object list
                  const long              z_order = 0)              // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create the button
   if(!ObjectCreate(chart_ID, name, OBJ_BUTTON, sub_window, 0, 0))
     {
      Print(__FUNCTION__,
            ": failed to create the button! Error code = ", GetLastError());
      return(false);
     }
//--- set button coordinates
   ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x);
   ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y);
   ObjectSetInteger(chart_ID, name, OBJPROP_ANCHOR, anchor2);
//--- set button size
   ObjectSetInteger(chart_ID, name, OBJPROP_XSIZE, width);
   ObjectSetInteger(chart_ID, name, OBJPROP_YSIZE, height);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID, name, OBJPROP_CORNER, corner);
//--- set the text
   ObjectSetString(chart_ID, name, OBJPROP_TEXT, text);
//--- set text font
   ObjectSetString(chart_ID, name, OBJPROP_FONT, font);
//--- set font size
   ObjectSetInteger(chart_ID, name, OBJPROP_FONTSIZE, font_size);
//--- set text color
   ObjectSetInteger(chart_ID, name, OBJPROP_COLOR, clr);
//--- set background color
   ObjectSetInteger(chart_ID, name, OBJPROP_BGCOLOR, back_clr);
//--- set border color
   ObjectSetInteger(chart_ID, name, OBJPROP_BORDER_COLOR, border_clr);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID, name, OBJPROP_BACK, back);
//--- set button state
   ObjectSetInteger(chart_ID, name, OBJPROP_STATE, state);
//--- enable (true) or disable (false) the mode of moving the button by mouse
   ObjectSetInteger(chart_ID, name, OBJPROP_SELECTABLE, selection);
   ObjectSetInteger(chart_ID, name, OBJPROP_SELECTED, selection);
//--- hide (true) or display (false) graphical object name in the object list
   ObjectSetInteger(chart_ID, name, OBJPROP_HIDDEN, hidden);
//--- set the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(chart_ID, name, OBJPROP_ZORDER, z_order);
//--- successful execution
   return(true);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ButtonChangeBGColor(const string name = "Button", // button name
                         const color back_clr = C'236,233,216',
                         const long   chart_ID = 0) // text
  {
//--- reset the error value
   ResetLastError();
//--- change object text
   if(!ObjectSetInteger(chart_ID, name, OBJPROP_BGCOLOR, back_clr))
     {
      Print(__FUNCTION__,
            ": failed to change the text! Error code = ", GetLastError());
      return(false);
     }
//--- successful execution
   return(true);
  }








//+------------------------------------------------------------------+
