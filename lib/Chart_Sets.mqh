
void OnTimer()
   {
    if(GlobalVariableGet("fixed_chart"))
      {
       ChartGetInteger(0,CHART_SHIFT,0,var1);
       if(var1)
         {
          ChartNavigate(0,CHART_CURRENT_POS,-207)
          
         }
      }
   }


int ibar_fixed()
{

  ChartGetDouble(0,CHART_SHIFT_SIZE,var2);
  return(WinLast+int(WindowBarsPerChart()*(var2/100)));

}




