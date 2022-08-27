//+------------------------------------------------------------------+
//|                                                 SimpleMacDEA.mq4 |
//|                                                       Tam Nguyen |
//|                                      https://tamnt027.github.io/ |
//+------------------------------------------------------------------+
#property copyright "Tam Nguyen"
#property link      "https://tamnt027.github.io/"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   string signal = "";
   double MACD = iMACD(_Symbol, _Period, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0);
   
   if (MACD > 0 ) {
      signal = "sell";
   }
   
   if (MACD < 0) {
      signal = "buy";
   }
   
   if (signal == "buy" && OrdersTotal() == 0){
      OrderSend(_Symbol, OP_BUY, 0.10, Ask, 3, 0, Ask + 150 * _Point, NULL, 0, 0 , Green);
   }
   
   if (signal == "sell" && OrdersTotal() == 0){
      OrderSend(_Symbol, OP_SELL, 0.10, Bid, 3, 0, Bid - 150 * _Point, NULL, 0, 0 , Red);
   }
   
   Comment("The current signal is: ",signal);
   
  }
//+------------------------------------------------------------------+
