system "d .VWAP";
.VWAP.trades:("DTSFJ"; enlist ",") 0: `:kxscm/module/.VWAP/file/trades.csv
.VWAP.getData:{[time1;time2;symbol]
    select currency:first sym, VWAP:sum (price*size)%(sum size) 
    from .VWAP.trades 
    where (date+time)>time1, (date+time)<time2,sym=symbol}
.VWAP.wap:{[time1;time2;symbols]m:.VWAP.getData[time1;time2;];(,/)(m each symbols)}
system "d .";