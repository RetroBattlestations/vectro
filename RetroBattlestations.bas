 100  REM  === Setup graphics and initialize some constants
 110  HGR : HCOLOR= 3
 120 PI = 3.14159265359
 130 SW = 280:SH = 160:SC = SW: IF SH < SC THEN SC = SH
 140 SC = SC / 1000
 150  REM  === Read the vector graphics from DATA and draw the picture
 160  READ P$
 170  IF P$ = "DONE" THEN  END 
 180  IF P$ = "C" OR P$ = "E" THEN  GOSUB 1010
 190  IF P$ = "L" THEN  GOSUB 1510
 200  GOTO 130
 1000  REM    === Draw circle or ellipse
 1010  READ XC,YC,XR:YR = XR: IF P$ = "E" THEN  READ YR
 1020  READ AS,AE
 1030 XC = XC * SC:YC = YC * SC:XR = XR * SC:YR = YR * SC
 1040 A2 = XR * XR:B2 = YR * YR:F2 = 4 * A2
 1050 X = 0:Y = YR:SI = 2 * B2 + A2 * (1 - 2 * YR)
 1060  IF B2 * X > A2 * Y THEN  GOTO 1110
 1070 SP = X / Y:AN =  ATN (SP):DG = 90 - AN * 180 / PI: GOSUB 1180
 1080  IF SI >  = 0 THEN SI = SI + F2 * (1 - Y):Y = Y - 1
 1090 SI = SI + B2 * (4 * X + 6)
 1100 X = X + 1: GOTO 1060
 1110 F2 = 4 * B2
 1120 X = XR:Y = 0:SI = 2 * A2 + B2 * (1 - 2 * XR)
 1130  IF A2 * Y > B2 * X THEN  RETURN 
 1140 SP = Y / X:AN =  ATN (SP):DG = AN * 180 / PI: GOSUB 1190
 1150  IF SI >  = 0 THEN SI = SI + F2 * (1 - X):X = X - 1
 1160 SI = SI + A2 * (4 * Y + 6)
 1170 Y = Y + 1: GOTO 1130
 1180  REM  === Plot point on arc
 1190 NS = AS:NE = AE: IF AS < 0 THEN NS = AS + 360:NE = AE + 360
 1200  IF DG >  = AS AND DG <  = AE THEN  HPLOT XC + X,YC - Y
 1210  IF 180 - DG >  = AS AND 180 - DG <  = AE THEN  HPLOT XC - X,YC - Y
 1220  IF DG >  = NS - 180 AND DG <  = NE - 180 THEN  HPLOT XC - X,YC + Y
 1230  IF 180 - DG >  = NS - 180 AND 180 - DG <  = NE - 180 THEN  HPLOT XC + X,YC + Y
 1240  RETURN 
 1500  REM    === Draw a line
 1510  READ X1,Y1,X2,Y2
 1515 X1 = X1 * SC:Y1 = Y1 * SC:X2 = X2 * SC:Y2 = Y2 * SC
 1520  HPLOT X1,Y1 TO X2,Y2
 1530  RETURN 
 5000  REM    === This is the image data
 5010  DATA   C,579,53,53,0,360
 5020  DATA   L,525,42,391,10
 5025  DATA   L,391,10,342,166
 5030  DATA   E,338,368,302,197,0,360
 5040  DATA   C,67,276,67,40,246
 5050  DATA   C,613,276,67,-69,141
 5060  DATA   C,233,329,49,0,360
 5070  DATA   C,446,329,49,0,360
 5080  DATA   E,340,436,115,54,200,340
 5090  DATA   E,338,651,151,313,142,263
 5095  DATA   E,338,651,151,313,-82,37
 5100  DATA   E,226,686,109,132,104,263
 5110  DATA   E,451,686,109,132,-83,76
 5120  DATA   E,207,939,75,61,62,192
 5130  DATA   E,470,939,75,61,-11,118
 5140  DATA   L,134,954,543,954
 5150  DATA   DONE
