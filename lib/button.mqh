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
   if(bar_time)
     {
      DeleteObject(bigbutton_name);
      long bg_color;
      int x1, y1;
      go_fix();
      Sleep(500);
      datetime t3 = ibar_fixed();
      int ibart = iBarShift(NULL, 0, ibar_fixed());
      double hh = iHigh(NULL, 0, ibart);
      ChartTimePriceToXY(0, 0, t3, hh, x1, y1);
      ChartGetInteger(0, CHART_COLOR_BACKGROUND, 0, bg_color);
      //RectangleCreate(0, rec_name, 0, bar_time, Price * 10, TimeCurrent() + (PERIOD_MN1 * 60), Price / 10, color(bg_color));
      //Comment(chart_width, NL, chart_height);
      ButtonCreate(0, bigbutton_name, 0, x1, chart_height, chart_width, chart_height, 2, ANCHOR_RIGHT, "", color(bg_color), 0, clrBlue, color(bg_color));
     }
  }


//+------------------------------------------------------------------+
