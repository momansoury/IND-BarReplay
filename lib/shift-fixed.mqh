//+------------------------------------------------------------------+
//|fix chart                                                         |
//+------------------------------------------------------------------+
void go_fix()
  {
   ChartNavigate(0,
                 CHART_CURRENT_POS,
                 (iBarShift(NULL, 0, bar_time) - iBarShift(NULL, 0, ibar_fixed())) * -1);
  }

//+------------------------------------------------------------------+
//|return the time of candle that in fixed                           |
//+------------------------------------------------------------------+
datetime ibar_fixed()
  {
   ChartGetDouble(0, CHART_SHIFT_SIZE, 0, var2);
   int aa = WinLast;
   int sss = (int(WindowBarsPerChart() * (var2 / 100)));
   return(Time[aa + sss]);
  }
  
  


