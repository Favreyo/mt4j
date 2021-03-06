//+------------------------------------------------------------------+
//|                                   Wolfgang Flohr-Hochbichler.mq4 |
//|                                       Copyright © 2011, Flohr IT |
//|                                            http://www.flohr-it.de |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2018, Flohr IT"
#property link      "http://www.flohr-it.de"

//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
#define PROCESS_TICK_NONE 0
#define PROCESS_TICK_DO_BUY 1
#define PROCESS_TICK_DO_SELL 2

//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
#import "mt4j.dll"
   int newInstance(string className); 
   int processTick(int jctx, double bid, double ask);
   void addNewBar(int jctx, double high, double low, double open, double close);
   void destroy(int jctx);
   void initObject(int jctx);
   void deinitObject(int jctx);
   void setIntProperty(int jctx, string property, int value);
   void setBoolProperty(int jctx, string property, int value);
   int getBoolProperty(int jctx, string property);
   void setStringProperty(int jctx, string property, string value);
   void setDoubleProperty(int jctx, string property, double value);
   string getStringProperty(int jctx, string property);
   int getIntProperty(int jctx, string property);
   double getDoubleProperty(int jctx, string property);
   void callNoArgsMethod(int jctx, string method_name);
#import


//+------------------------------------------------------------------+
//| EX4 imports                                                      |
//+------------------------------------------------------------------+
void updateBarInfo(int ctx) {
   static int lastBars = 0;
   
   if (lastBars == 0) {
      for (int i=Bars-1; i > 0; i--) {
         addNewBar(ctx, High[i], Low[i], Open[i], Close[i]);
      }
   } else if (lastBars != Bars) {
      addNewBar(ctx, High[1], Low[1], Open[1], Close[1]);
   }
   
   lastBars = Bars;
}
//+------------------------------------------------------------------+