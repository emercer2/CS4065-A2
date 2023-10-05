import java.util.Stack;
import java.awt.*;
import javax.swing.*;
import de.voidplus.dollar.*;
Stack<Shape> shapeStack;

float yPos = 0.0;
float x = 0.0;
float y = 0.0;
float weight = 4;
int mode = 0;
String[] modeNames = {"Freeform", "Line", "Rectangle", "Oval"};
String[] colorNames = {"Black", "Red", "Green", "Blue"};
color currColor = color(0,0,0);
int colorIndex = 0;
boolean firstShape;

OneDollar one;

JDialog jd = new JDialog();
JPanel jp = new JPanel();
String setting = "";

void setup() {
   size(1280,720);
   frameRate(60);
   background(255,255,255);
   shapeStack = new Stack();
   
   JButton settings1 = new JButton("Gesture App Settings");
   JButton settings2 = new JButton("Shortcut Key App Settings");
   
   settings1.addActionListener(e->setGestures());
   settings2.addActionListener(e->setKeys());
   
   jp.add(settings1);
   jp.add(settings2);
   jd.add(jp);
   
   jd.setSize(1280, 720);
   jd.setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
   jd.setVisible(true); 
   
  one = new OneDollar(this);
  one.setVerbose(true);
  one.disableAutoCheck();
  
  //learn all gestures here
  one.learn("LtoR:cycleShape", new int[] {99,246,100,246,101,246,102,246,103,246,104,246,105,246,106,246,107,246,108,246,109,246,111,246,112,246,113,246,114,246,115,246,116,246,117,246,118,246,119,246,120,246,122,246,123,246,124,246,125,246,126,246,127,246,128,246,129,246,130,246,131,246,132,246,133,246,134,246,135,246,136,246,138,246,139,246,140,246,141,246,142,246,143,246,145,246,146,246,147,246,148,246,149,246,150,246,151,246,152,246,153,246,154,246,155,246,156,246,157,246,158,246,159,246,160,246,161,246,162,246,163,246,164,246,165,246,166,246,168,246,169,246,171,246,172,246,173,246,174,246,175,246,176,246,178,246,178,247,179,247,181,247,182,247,183,247,184,247,186,247,187,247,188,247,189,247,190,247,191,247,193,247,194,248,196,248,198,248,199,248,200,248,201,248,202,248,203,248,205,248,206,248,207,248,208,248,209,248,210,248,211,248,212,248,213,248,214,248,215,248,216,248,217,248,218,248,219,248,220,248,221,249,222,249,223,249,224,249,226,249,227,249,228,249,230,249,231,249,233,249,234,249,236,249,237,249,238,249,239,249,240,249,242,249,243,249,244,249,245,249,246,249,247,249,249,249,250,249,252,249,253,249,254,249,255,249,256,249,257,249,259,249,260,250,261,250,262,250,263,250,264,250,265,250,266,250,267,250,268,250,269,250,270,250,271,250,272,250,273,250,274,250,276,250,277,251,278,251,279,251,280,251,281,251,282,251,283,251,284,251,286,251,287,251,288,251,289,251,290,251,291,252,292,252,294,252,295,252,297,252,298,252,299,252,300,252,301,252,302,252,303,252,304,252,305,252,305,253,307,253,308,253,309,253,310,253,311,253,312,254,313,254,314,254,315,254,317,254,318,254,319,254,320,255,321,255,322,255,323,255,324,255,325,255,326,255,328,255,329,255,330,255,331,255,332,255,333,255,333,256,335,256,336,256,337,256,338,256,339,256,340,256,341,256,342,256,343,256,344,256,345,256,346,256,347,256,348,256,350,256,351,256,352,257,353,257,354,257,356,257,357,257,358,257,359,257,360,257,361,257,362,257,363,257,364,257,365,257,365,258,366,258,367,258,368,258,369,258,370,258,371,258,372,258,373,258,374,258,375,258,376,258,377,258,378,258,379,258,380,258,381,258,382,258,382,259,383,259,384,259,385,259,386,259,387,259,388,259,388,260,389,260,390,260,391,260,392,260,393,260,394,261,395,261,396,261,397,261,398,261,399,261,400,261,401,261,402,261,403,261,});
  one.learn("BtoT:cycleColor", new int[] {243,273,243,272,243,271,243,270,243,269,243,268,243,267,243,266,243,265,243,264,243,263,243,262,243,261,243,260,243,259,243,258,243,257,243,256,243,255,243,254,243,253,243,252,243,251,243,250,243,249,243,248,243,247,243,246,243,245,243,243,244,242,244,241,244,240,244,239,244,238,244,237,244,236,244,235,244,234,244,233,244,232,244,231,244,230,244,229,244,227,245,227,245,226,245,224,245,223,245,221,245,220,245,219,245,218,245,217,245,215,245,214,245,212,245,211,245,209,245,208,245,207,245,206,245,205,245,204,245,203,245,202,245,201,245,200,245,199,245,198,245,197,245,196,245,195,245,193,245,192,245,191,245,190,245,189,245,188,245,187,245,186,245,185,245,183,245,182,245,180,245,179,245,178,245,177,245,176,245,175,245,174,245,173,245,172,245,171,245,170,245,169,245,168,245,167,245,166,245,165,245,164,245,163,245,162,245,161,245,160,245,159,245,158,245,157,245,156,245,155,245,154,245,153,245,152,245,151,245,150,245,149,245,147,245,146,245,145,245,144,245,143,245,142,245,141,245,140,245,139,245,138,245,137,245,136,245,135,245,134,245,133,});
  one.learn("RtoL:cycleWeight", new int[] {346,309,345,309,344,309,343,309,342,309,341,309,340,309,339,309,338,309,337,309,336,309,335,309,333,309,332,309,331,309,330,309,329,309,328,309,326,309,325,309,324,309,323,309,322,309,321,309,320,309,319,309,318,309,317,309,316,309,315,309,313,309,312,309,311,309,310,309,309,309,308,309,307,309,306,309,305,309,304,309,303,309,302,309,300,309,299,309,298,309,297,309,296,309,295,309,294,309,292,309,291,309,290,309,289,309,287,309,285,309,284,309,283,309,282,309,281,309,280,309,279,309,277,309,276,309,274,309,273,309,272,309,271,309,270,309,269,309,267,309,266,309,265,309,264,309,263,309,261,309,260,309,259,309,258,309,257,309,255,309,254,309,253,309,252,309,250,309,249,309,248,309,247,309,245,309,244,309,243,309,241,309,240,309,239,309,237,309,236,309,235,309,234,309,232,309,231,309,230,309,229,309,227,309,226,309,225,309,224,309,222,309,221,309,220,309,218,309,217,309,216,309,215,309,214,309,212,309,211,309,210,309,209,309,207,309,206,309,204,308,203,308,202,308,201,308,200,308,199,308,198,308,198,307,197,307,196,307,195,307,194,307,193,307,192,307,192,306,191,306,190,306,189,305,188,305,188,304,187,304,186,304,186,303,185,303,184,303,183,302,182,302,181,302,181,301,180,301,179,301,178,301,});
   
  one.learn("R:Red", new int[] {182,357,182,356,182,355,182,354,182,353,182,352,183,352,183,351,183,350,183,349,183,348,183,347,183,346,183,345,183,344,183,343,183,342,183,341,183,340,183,339,183,338,183,337,183,336,183,335,183,334,183,333,183,332,183,331,183,330,183,329,183,328,183,327,183,326,183,325,183,324,183,323,183,322,183,321,183,320,184,319,184,318,184,317,184,315,184,314,184,313,184,312,184,311,184,310,184,309,184,308,184,307,184,306,184,305,184,304,185,303,185,302,185,301,185,300,185,299,185,298,185,297,185,296,186,296,186,295,186,294,186,293,186,292,186,291,186,290,186,289,186,288,186,287,186,286,186,285,186,284,186,283,186,282,186,281,186,280,186,279,186,278,186,277,186,276,186,275,186,274,186,273,186,272,186,271,186,270,186,269,186,268,186,267,186,266,186,265,186,264,186,263,186,262,186,261,186,260,186,259,186,258,186,257,186,256,186,255,186,254,186,253,186,252,186,251,186,250,186,249,186,248,186,247,186,246,186,245,186,244,186,243,186,242,186,241,186,240,186,239,186,238,186,237,186,236,186,235,186,234,186,233,186,232,186,231,186,230,186,229,186,228,186,227,186,226,186,225,186,224,186,223,186,222,186,221,186,220,186,219,186,218,186,217,186,216,187,216,187,215,187,214,187,213,188,213,188,212,189,212,190,212,191,212,192,211,193,210,194,209,195,209,196,208,197,208,198,208,198,207,199,207,200,207,201,206,203,206,204,206,204,205,205,205,206,204,207,204,208,204,208,203,209,203,210,203,211,203,212,203,213,203,214,203,215,203,215,204,216,204,217,204,217,205,218,205,219,205,220,205,220,206,221,206,222,207,223,207,224,208,225,208,225,209,226,209,227,209,227,210,228,210,229,210,229,211,230,211,231,211,231,212,232,212,232,213,233,213,234,213,235,213,235,214,236,214,237,215,237,216,237,217,238,217,238,218,239,218,240,218,240,219,241,219,241,220,242,220,242,221,242,222,242,223,243,223,243,224,244,224,245,224,246,224,246,225,246,226,246,227,246,228,247,228,247,229,248,229,248,230,249,231,249,232,249,233,249,234,250,234,250,235,251,235,252,235,252,236,252,237,253,237,253,238,253,239,253,240,253,241,254,241,254,242,254,243,254,244,254,245,254,246,254,247,254,248,255,248,255,249,255,250,256,250,256,251,256,252,256,253,257,253,257,254,257,255,257,256,258,256,258,257,258,258,258,259,258,260,258,261,258,262,258,263,259,263,259,264,259,265,259,266,259,267,259,268,259,269,259,270,259,271,259,272,259,273,259,274,259,275,259,276,259,277,259,278,259,279,258,279,258,280,258,281,257,281,257,282,256,282,256,283,255,283,255,284,254,284,254,285,253,286,253,287,252,287,251,288,250,288,250,289,249,289,249,290,248,290,247,290,246,291,245,291,245,292,244,293,243,293,243,294,242,294,241,294,240,294,240,295,239,295,238,295,237,295,236,296,235,296,234,297,234,298,233,298,232,298,231,298,231,299,230,299,229,299,227,299,226,299,226,300,225,300,224,300,223,300,222,300,221,300,221,301,220,302,219,302,218,302,217,303,216,303,215,304,214,304,213,304,212,304,211,304,210,304,210,305,209,305,208,305,207,305,206,306,205,306,204,306,203,306,202,306,201,306,200,306,199,306,199,307,198,307,197,307,196,307,195,307,194,307,193,307,192,307,191,307,190,307,189,307,188,307,187,307,186,307,185,307,184,307,185,307,186,307,187,308,188,308,188,309,189,309,189,310,190,310,191,310,192,310,193,310,193,311,194,311,194,312,195,312,196,312,196,313,197,313,198,313,199,313,199,314,200,314,200,315,201,315,202,315,203,315,203,316,204,316,205,316,205,317,206,317,206,318,207,318,208,318,208,319,209,319,209,320,210,320,211,320,211,321,212,321,213,321,214,321,215,321,216,321,216,322,216,323,217,323,218,323,219,323,219,324,220,324,221,324,221,325,222,325,223,325,224,325,224,326,225,326,225,327,226,327,227,327,228,327,228,328,229,328,229,329,230,329,231,329,232,329,232,330,233,331,234,331,234,332,235,332,236,332,236,333,237,333,238,333,238,334,239,334,239,335,240,335,241,335,241,336,242,336,242,337,243,337,244,338,244,339,245,339,246,339,247,340,248,340,249,340,249,341,250,341,251,341,251,342,251,343,252,343,253,343,253,344,254,344,254,345,255,345,256,345,257,345,257,346,258,346,258,347,259,347,259,348,260,348,
});
  one.learn("G:Green", new int[] {252,219,253,219,254,219,255,219,256,219,257,219,258,219,259,219,260,219,261,219,262,219,263,219,264,219,265,219,266,219,267,219,268,219,269,219,270,219,271,219,272,219,273,219,274,220,275,220,276,220,277,220,278,220,279,220,280,220,281,220,282,220,283,220,283,221,284,221,285,221,286,221,287,221,288,221,289,221,290,221,291,221,291,222,292,222,293,222,294,222,295,223,296,223,297,223,298,223,299,223,300,223,301,223,302,223,303,223,304,223,305,223,306,223,307,223,308,223,309,223,309,224,310,224,311,224,312,224,313,224,313,225,314,225,314,226,314,227,315,227,315,228,315,229,315,230,315,231,315,232,315,233,316,234,316,235,316,236,316,237,316,238,316,239,316,240,316,241,316,243,316,244,316,245,316,246,316,247,316,248,316,249,316,250,316,251,316,252,316,253,316,254,316,255,316,256,316,257,316,258,316,259,316,260,316,261,316,262,315,262,315,263,315,264,315,265,315,266,315,267,315,268,315,269,314,270,314,271,314,272,314,274,313,275,313,276,313,277,313,278,313,279,312,280,312,281,312,282,311,282,311,283,311,284,311,285,310,286,310,287,309,287,309,288,308,288,308,289,308,290,307,290,307,291,306,291,306,292,305,292,304,292,304,293,303,293,303,294,302,294,301,294,300,294,299,295,298,295,297,295,296,295,296,296,295,296,295,297,294,297,293,297,292,298,291,298,290,298,290,299,289,299,288,299,287,299,286,299,285,299,284,299,283,299,283,300,282,300,281,300,280,300,279,300,278,300,277,300,276,300,275,300,274,300,273,300,272,300,271,300,270,300,269,300,268,300,267,300,266,300,265,300,264,300,263,300,262,300,261,300,260,300,260,299,259,299,258,299,257,299,256,298,255,298,254,297,253,297,252,297,251,296,250,296,249,296,248,295,247,295,246,295,246,294,245,294,244,293,243,293,242,293,241,292,240,292,239,292,239,291,238,291,237,291,237,290,236,289,235,289,234,289,234,288,233,288,233,287,232,287,231,287,230,287,230,286,229,286,229,285,228,285,227,285,226,285,226,284,225,284,225,283,224,283,223,283,223,282,222,282,222,281,221,281,220,281,220,280,219,280,219,279,218,279,217,279,217,278,217,277,216,277,216,276,215,276,215,275,214,275,214,274,214,273,213,273,213,272,212,271,211,271,211,270,210,270,210,269,210,268,210,267,209,267,209,266,209,265,208,265,208,264,208,263,207,263,207,262,206,262,206,261,205,261,205,260,205,259,204,258,204,257,204,256,203,256,202,255,202,254,202,253,201,252,201,251,200,250,200,249,200,248,199,248,199,247,198,247,198,246,198,245,198,244,198,243,197,243,197,242,197,241,197,240,196,239,196,238,196,237,195,236,195,235,195,234,194,233,194,232,193,232,193,231,193,230,193,229,192,229,192,228,192,227,192,226,192,225,192,224,192,223,192,222,192,221,192,220,191,219,191,218,191,217,191,216,191,215,191,214,191,213,191,212,191,211,191,210,191,209,190,208,190,207,190,206,190,205,190,204,190,203,190,202,190,201,190,200,190,199,190,198,190,197,190,196,190,195,190,194,190,193,190,192,190,191,190,190,190,189,190,188,190,187,190,186,190,185,191,185,191,184,191,183,191,182,191,181,191,180,192,179,192,178,193,178,193,177,194,177,194,176,194,175,195,175,195,174,195,173,195,172,196,171,196,170,196,169,197,168,198,167,199,166,199,165,199,164,200,164,200,163,200,162,200,161,201,161,201,160,201,159,201,158,201,157,202,156,203,156,203,155,203,154,203,153,203,152,203,151,204,151,204,150,204,149,205,149,205,148,206,148,207,148,207,147,208,146,208,145,208,144,209,144,209,143,210,143,211,143,211,142,212,142,212,141,213,140,214,140,214,139,214,138,215,137,216,137,217,137,217,136,218,136,219,136,219,135,220,134,220,133,221,133,222,133,222,132,223,132,224,131,225,131,225,130,226,130,227,130,227,129,227,128,228,128,229,127,230,127,231,127,231,126,231,125,232,125,232,124,233,124,234,124,234,123,235,123,235,122,236,122,237,122,238,122,239,122,239,121,240,120,241,120,241,119,242,119,243,119,244,119,245,119,245,118,246,118,247,118,248,118,249,118,249,117,250,117,251,117,251,116,252,116,253,115,254,115,255,115,256,114,257,114,258,114,259,114,259,113,260,113,261,113,261,112,262,112,263,112,264,112,265,112,266,112,267,112,268,112,269,112,270,112,271,112,272,112,273,112,274,112,275,112,275,113,276,113,277,113,278,113,279,113,280,113,280,114,281,114,282,114,283,114,284,114,284,115,285,115,286,115,287,116,287,117,288,117,289,117,289,118,290,118,290,119,290,120,291,121,292,121,292,122,293,122,293,123,294,124,294,125,295,125,295,126,296,126,296,127,296,128,297,128,297,129,298,129,298,130,299,131,299,132,300,132,300,133,300,134,301,135,301,136,302,136,302,137,302,138,302,139,303,139,304,139,304,140,304,142,305,143,305,144,305,145,306,145,306,146,307,147,307,148,308,148,309,149,309,150,309,151,310,151,310,152,310,153,310,154,311,154,311,155,311,156,312,156,313,157,313,158,314,158,314,159,314,160,315,160,315,161,315,162,315,163,315,164,316,164,316,165,316,166,317,166,317,167,318,168,319,169,319,170,319,171,319,172,319,173,319,174,320,174,321,174,321,175,321,176,321,177,321,178,322,178,322,179,322,180,322,181,322,182,322,183,323,183,323,184,323,185,323,186,323,187,324,187,324,188,325,188,325,189,325,190,325,191,325,192,326,192,326,193,
});
  one.learn("B:Blue", new int[] {157,365,157,364,157,363,157,362,157,361,157,360,157,359,157,358,157,357,157,356,157,355,157,354,157,353,157,352,157,351,157,350,157,349,157,348,157,347,156,346,156,345,156,344,156,343,156,342,156,341,156,340,156,339,156,338,156,337,156,336,156,335,156,334,156,333,156,332,155,331,155,330,155,328,155,327,155,326,155,324,155,323,155,322,155,321,155,319,154,319,154,318,154,317,154,316,154,315,154,314,154,312,154,311,154,310,154,309,154,308,154,307,154,306,154,305,154,303,154,302,154,300,154,299,154,298,154,297,154,296,154,295,154,294,154,292,154,291,154,290,154,289,154,288,154,286,154,285,154,284,154,282,154,281,154,280,154,279,154,278,154,277,154,276,154,275,154,274,154,273,154,272,154,271,154,270,154,269,154,268,154,267,154,266,154,265,154,264,154,263,154,262,154,261,154,260,154,259,154,258,154,257,154,256,154,255,154,254,154,253,154,252,154,251,154,250,154,249,154,248,154,247,154,246,154,245,154,244,154,243,154,242,154,241,154,240,154,239,154,238,154,237,154,236,154,235,154,234,154,233,154,232,154,231,154,230,154,229,154,228,154,227,154,226,154,225,154,224,154,223,154,222,154,221,154,220,154,219,154,218,154,217,154,216,154,215,154,214,155,214,155,213,155,212,155,211,155,210,155,209,155,208,155,207,155,206,155,205,155,204,155,203,155,202,155,201,155,200,155,199,155,198,155,197,155,196,155,195,155,194,155,193,155,192,155,191,156,190,156,189,156,188,156,187,156,186,156,185,156,184,157,184,157,183,157,182,157,181,157,180,157,179,158,179,158,178,158,177,159,176,159,175,159,174,159,173,159,172,159,171,159,170,160,169,160,168,160,167,161,167,161,166,161,165,162,164,162,163,162,162,163,161,164,161,164,160,164,159,165,159,165,158,166,157,167,156,168,156,169,155,169,154,170,154,170,153,171,153,172,153,173,153,173,152,174,151,175,151,176,150,177,150,178,150,178,149,180,148,181,148,182,147,183,147,184,147,185,146,186,145,187,145,188,144,189,144,189,143,191,143,191,142,192,142,194,141,196,141,197,140,198,140,198,139,199,139,200,139,200,138,201,138,202,138,203,138,204,137,205,137,206,137,207,137,207,136,208,136,209,136,209,135,210,135,211,135,212,135,212,134,213,134,214,134,215,134,216,134,216,133,217,133,218,133,220,133,221,133,223,132,224,132,225,132,226,132,227,132,228,132,229,132,230,132,231,132,232,132,233,132,233,133,234,133,235,133,235,134,236,134,237,134,237,135,238,135,239,135,239,136,240,136,240,137,241,137,241,138,242,138,243,139,244,140,244,141,245,141,246,141,247,142,248,143,249,143,249,144,249,145,250,145,251,146,252,147,253,147,253,148,253,149,254,149,254,150,255,150,256,151,257,152,258,153,258,154,259,154,259,155,259,156,260,156,260,157,262,157,262,158,263,158,263,159,263,160,263,161,264,161,265,162,265,163,265,164,266,164,266,165,266,166,267,166,267,167,267,168,268,168,268,169,268,170,268,171,269,172,269,173,269,174,269,175,270,176,270,177,270,178,270,179,270,180,270,181,270,182,270,183,270,184,270,185,270,186,270,187,270,188,270,189,270,190,270,191,270,192,270,193,270,194,270,195,270,196,270,197,270,198,270,199,270,200,270,201,270,202,270,203,270,204,270,205,270,206,269,207,269,208,268,208,268,209,268,210,268,211,268,212,267,212,267,213,267,214,266,215,266,216,265,216,264,216,264,217,264,218,263,219,262,220,262,221,262,222,262,223,261,223,260,223,260,224,259,224,259,225,259,226,258,226,258,227,257,227,257,228,256,228,255,229,255,230,254,230,254,231,254,232,253,232,252,232,252,233,251,233,251,234,250,235,250,236,249,236,248,237,247,238,246,239,246,240,245,240,244,241,244,242,243,242,243,243,242,243,241,244,240,244,239,245,238,246,238,247,236,247,236,248,235,248,235,249,234,250,233,250,233,251,232,251,231,251,230,253,229,253,229,254,228,254,227,255,226,255,225,255,225,256,223,257,222,257,222,258,221,258,220,258,219,259,218,259,217,260,216,260,215,261,214,261,213,262,212,262,211,262,210,263,209,263,208,263,208,264,207,265,206,265,205,266,204,266,203,266,202,266,201,266,201,267,200,267,199,267,198,267,197,267,196,268,195,268,195,269,194,269,193,269,192,269,191,269,190,270,189,270,188,270,187,270,186,270,185,270,184,270,183,270,182,270,181,270,181,271,180,271,179,271,178,271,177,271,176,271,175,271,174,271,173,271,172,271,171,271,170,271,169,271,168,271,168,272,167,272,166,272,165,272,165,271,166,271,167,270,168,270,168,269,168,268,169,268,169,267,170,267,170,266,171,266,172,266,173,266,173,265,174,265,174,264,175,264,176,264,176,263,177,263,178,263,179,262,180,262,180,261,181,261,182,260,183,260,184,260,184,259,185,259,186,259,187,258,187,257,188,257,189,257,190,257,190,256,191,256,192,255,193,255,194,255,195,254,196,254,197,253,198,253,198,252,200,252,201,252,202,251,203,251,204,251,205,251,206,251,207,250,208,250,209,250,209,249,210,249,211,249,212,248,213,248,214,248,215,248,216,247,217,247,218,247,219,247,220,247,221,247,221,246,222,246,223,246,224,246,225,246,225,245,226,245,227,245,228,245,229,245,230,245,231,245,232,245,232,244,233,244,234,244,235,244,236,244,237,244,238,244,239,244,240,244,241,244,242,244,243,244,244,244,245,244,246,244,247,244,248,244,249,244,250,244,251,244,252,244,253,244,254,244,255,244,256,244,257,244,258,244,259,244,260,244,261,244,262,244,263,244,264,244,265,244,266,244,267,244,268,244,268,245,269,245,269,246,270,246,271,247,272,247,273,247,274,247,275,247,275,248,276,248,277,248,277,249,278,249,279,249,279,250,280,250,281,251,282,251,283,251,283,252,284,252,285,252,285,253,286,253,287,254,287,255,288,255,289,255,289,256,289,257,290,257,291,257,291,258,292,259,292,260,293,260,293,261,294,261,294,262,294,263,295,263,295,264,296,265,296,266,296,267,296,268,297,268,298,269,298,270,299,270,299,271,300,271,300,272,300,273,300,274,301,274,301,275,301,276,301,277,302,278,302,279,303,280,303,281,303,282,303,283,303,284,304,284,304,285,304,286,304,287,304,288,304,289,304,290,304,291,304,292,304,293,304,294,304,295,304,296,304,297,304,298,304,299,304,300,304,301,304,302,304,303,304,304,304,305,304,306,303,306,303,307,303,308,303,309,303,310,303,311,303,312,303,313,302,313,302,314,302,315,301,316,301,317,301,318,300,319,300,320,299,321,299,322,299,323,298,324,298,325,297,325,297,326,297,327,297,328,297,329,296,329,296,330,295,330,295,331,295,332,294,332,294,333,293,334,293,335,292,336,291,336,291,337,290,337,290,338,290,339,289,340,287,341,287,342,286,343,286,344,285,345,284,346,283,347,282,347,281,348,281,349,280,351,278,352,278,353,277,353,276,354,275,355,275,356,274,356,274,357,274,358,273,358,272,358,271,358,271,359,270,359,270,360,270,361,269,362,268,363,267,363,266,363,265,364,264,364,264,365,263,366,263,367,262,367,262,368,261,368,260,368,260,369,259,370,258,371,257,371,257,372,256,372,256,373,255,374,254,374,254,375,253,375,252,375,252,376,251,376,250,377,249,378,248,378,248,379,247,379,246,379,245,380,244,380,243,380,242,380,241,380,240,380,239,380,238,380,237,380,236,380,235,380,235,381,234,381,233,381,232,381,230,381,229,381,227,382,225,382,223,382,221,382,219,382,218,382,217,383,216,383,215,384,214,384,212,384,211,384,211,385,210,385,208,385,207,385,206,385,206,386,205,386,204,386,203,386,202,386,201,387,200,387,199,387,198,387,197,387,196,387,195,387,195,388,194,388,193,388,192,388,191,388,190,388,189,388,188,388,187,388,186,388,185,388,184,388,183,388,182,388,181,388,180,388,179,388,178,388,177,388,177,387,176,387,175,387,174,386,173,386,172,386,171,386,171,385,170,385,169,385,168,385,167,385,166,385,166,384,165,384,164,384,163,384,163,383,162,383,161,383,161,382,160,382,160,381,159,381,159,380,158,380,157,380,157,379,
});
 
  //bind gestures to methods
  one.bind("LtoR:cycleShape", "cycleShape");
  one.bind("BtoT:cycleColor", "cycleColor");
  one.bind("RtoL:cycleWeight", "cycleWeight");
  one.bind("R:Red", "setRed");
  one.bind("G:Green", "setGreen");
  one.bind("B:Blue", "setBlue");
}

void draw() {
  if(!setting.equals("")){
    background(255);
    for(Shape shape : shapeStack) {
      shape.drawShape();
    }
    stroke(255);
    fill(255);
    rect(1280-125,0,125,75);
    fill(0);
    stroke(255);
    strokeWeight(0);
    textSize(16);
    text("Shape:" + modeNames[mode] + "\nColor:" + colorNames[colorIndex] + "\nThickness:" + weight,1160,25);
  }
}

void mousePressed() {
  if(!setting.equals("") && mouseButton == LEFT){
    x = mouseX;
    y = mouseY;
    firstShape = true;
    if(mode == 0){
       shapeStack.add(new Point(mouseX,mouseY,weight,currColor,firstShape));
    }
  }
}

void mouseReleased(){
  if(setting.equals("gestureMode")){
    one.check();
  }
}

void mouseDragged() {
  if(!setting.equals("") && mouseButton == LEFT){
      if(mode == 0) {
          shapeStack.add(new Point(mouseX,mouseY,weight,currColor,false));
          firstShape = false;
      }
      else if(mode == 1) {
        if(firstShape) {
          shapeStack.add(new Line(mouseX,mouseY,x,y,weight,currColor));
          firstShape = false;
        }
        else if(!firstShape && shapeStack.peek() != null) {
          shapeStack.pop();
          shapeStack.add(new Line(mouseX,mouseY,x,y,weight,currColor));
        }
      }
      else if(mode == 2) {
        if(firstShape) {
          shapeStack.add(new Rectangle(x,y,mouseX - x,mouseY - y,weight,currColor));
          firstShape = false;
        }
        else if(!firstShape && shapeStack.peek() != null) {
          shapeStack.pop();
          shapeStack.add(new Rectangle(x,y,mouseX - x,mouseY - y,weight,currColor));
        }
      }
      else {
        if(firstShape) {
          shapeStack.add(new Oval(x,y,mouseX - x,mouseY - y,weight,currColor));
          firstShape = false;
        }
        else if(!firstShape && shapeStack.peek() != null) {
          shapeStack.pop();
          shapeStack.add(new Oval(x,y,mouseX - x,mouseY - y,weight,currColor));
        }
      }
  }
  else if(setting.equals("gestureMode") && mouseButton == RIGHT){
      one.track(mouseX, mouseY);
  }
}

void keyPressed() {
  if(setting.equals("keyMode")){
    if(key == 's') {
        mode++;
        mode = mode%4; 
    }
    else if(key == 'a') {
        colorIndex++;
        colorIndex = colorIndex%4; 
        if(colorIndex == 0){
          currColor = color(0,0,0);
        }
        else if (colorIndex == 1){
          currColor = color(255,0,0);
        }
        else if(colorIndex == 2) {
          currColor = color(0,255,0);
        }
        else {
          currColor = color(0,0,255);
        }
    }
    else if(key == 'w') {
      if(weight == 2){
        weight *= 2;
      }
      else if(weight == 4){
        weight *= 2;
      }
      else {
        weight /= 4;
      }
    }
    else if(key == 'r'){
       currColor = color(255,0,0);
       colorIndex = 1;
    }
    else if(key == 'g'){
       currColor = color(0,255,0);
       colorIndex = 2;
    }
    else if(key == 'b'){
       currColor = color(0,0,255);
       colorIndex = 3;
    }
  }
  if(key == BACKSPACE && !shapeStack.isEmpty()) {
       if(shapeStack.peek().isPoint) {
           while(shapeStack.peek().firstPoint == false) {
             shapeStack.pop();
           }
       }
  shapeStack.pop();
  }
}

void setGestures(){
  setting = "gestureMode";
  jd.dispose();
}

void cycleColor(String gesture, float percent, int startX, int startY, int centroidX, int centroidY, int endX, int endY){
      colorIndex++;
      colorIndex = colorIndex%4; 
      if(colorIndex == 0){
        currColor = color(0,0,0);
      }
      else if (colorIndex == 1){
        currColor = color(255,0,0);
      }
      else if(colorIndex == 2) {
        currColor = color(0,255,0);
      }
      else {
        currColor = color(0,0,255);
      }
}

void cycleShape(String gesture, float percent, int startX, int startY, int centroidX, int centroidY, int endX, int endY){
      mode++;
      mode = mode%4; 
}

void cycleWeight(String gesture, float percent, int startX, int startY, int centroidX, int centroidY, int endX, int endY){
      if(weight == 2){
        weight *= 2;
      }
      else if(weight == 4){
        weight *= 2;
      }
      else {
        weight /= 4;
      }
}

void setRed(String gesture, float percent, int startX, int startY, int centroidX, int centroidY, int endX, int endY){
     currColor = color(255,0,0);
     colorIndex = 1;
}

void setGreen(String gesture, float percent, int startX, int startY, int centroidX, int centroidY, int endX, int endY){
     currColor = color(0,255,0);
     colorIndex = 2;
}

void setBlue(String gesture, float percent, int startX, int startY, int centroidX, int centroidY, int endX, int endY){
     currColor = color(0,0,255);
     colorIndex = 3;
}

void setKeys(){
  setting = "keyMode";
  jd.dispose();
}

abstract class Shape {
  float x;
  float y;
  float weight;
  color shapeColor;
  boolean isPoint;
  boolean firstPoint;

  Shape(float x, float y, float weight, color shapeColor) {
    this.x = x;
    this.y = y;
    this.weight = weight;
    this.shapeColor = shapeColor;
  }

  abstract void drawShape();
}

class Line extends Shape {
   float x2;
   float y2;

   Line(float x,float y,float x2,float y2, float weight, color shapeColor) {
      super(x,y,weight,shapeColor);
      this.x2 = x2;
      this.y2 = y2;
      isPoint = false;
   }

   void drawShape() {
     stroke(shapeColor);
     strokeWeight(weight);
     line(x,y,x2,y2); 
   }
}

class Rectangle extends Shape {
   float width;
   float height;

   Rectangle(float x,float y,float width, float height, float weight, color shapeColor) {
      super(x,y,weight,shapeColor);
      this.width = width;
      this.height = height;
      isPoint = false;
   }

   void drawShape() {
     stroke(shapeColor);
     strokeWeight(weight);
     fill(shapeColor);
     rect(x,y,width,height); 
   }
}

class Oval extends Shape {
   float width;
   float height;

   Oval(float x,float y,float width,float height, float weight, color shapeColor) {
      super(x,y,weight,shapeColor);
      this.width = width;
      this.height = height;
      isPoint = false;
   }

   void drawShape() {
     stroke(shapeColor);
     strokeWeight(weight);
     fill(shapeColor);
     ellipse(x,y,width,height); 
   }
}

class Point extends Shape {
   float size;
   int numPoints;

   Point(float x,float y,float weight, color shapeColor, boolean firstPoint) {
      super(x,y,weight,shapeColor);
      isPoint = true;
      this.firstPoint = firstPoint;
   }

   void drawShape() {
     stroke(shapeColor);
     strokeWeight(weight);
     fill(shapeColor);
     point(x,y); 
   }
}
