//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Create_BigButton()
  {
   long bg_color;
   int x, y;
   go_fix();
   datetime t3 = ibar_fixed();
   int ibart = iBarShift(NULL, 0, ibar_fixed());
   double hh = iHigh(NULL, 0, ibart);
   ChartTimePriceToXY(0, 0, t3, 0, x, y);
   ChartGetInteger(0, CHART_COLOR_BACKGROUND, 0, bg_color);
   ButtonCreate(0, bigbutton_name, 0, x, chart_height, chart_width, chart_height, 2, ANCHOR_RIGHT, "", color(bg_color), 0, clrBlue, color(bg_color));
  }


//+------------------------------------------------------------------+
