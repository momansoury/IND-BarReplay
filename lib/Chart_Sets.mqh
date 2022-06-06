




void OnTimer()
   {
    if(Show_TH)
       {
        sym = _Symbol == "BTCUSD";
        Comment(NL, "#1m: ", TH(sym ? 0.26 : 0.026, lprice)
                , NL, "#5m: ", TH(sym ? 0.55 : 0.055, lprice)
                , NL, "#15m: ", TH(sym ? 1.0 :, lprice)
                , NL, "#1h: ", TH(sym ? 2.0 : 0.10, lprice)
                , NL, "#4h: ", TH(sym ? 4.0 : 0.40, lprice)
                , NL, "#1D: ", TH(sym ? 10.0 : 1.00, lprice)
                , NL, "#1W: ", TH(sym ? 26.4 : 2.64, lprice)
                , NL, "#1M: ", TH(sym ? 54.7 : 5.47), lprice);
       }
    else
       {
        Comment("[Running]" + __FILE__);
       }
   }

EventSetTimer(2);






