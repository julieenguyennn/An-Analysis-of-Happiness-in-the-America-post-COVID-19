
#delimit ;

infix

HRS1    1 - 5
RINCOME    6 - 10
HAPPY    11 - 14
YEAR    15 - 19
ID_    20 - 24
using GSS.dat;


label variable HRS1   "number of hours worked last week";
label variable RINCOME   "respondents income";
label variable HAPPY   "general happiness";
label variable YEAR   "GSS year for this respondent";
label variable ID_   "Respondent id number";


label define  GSP001X
89      "89+ hrs"
-100      ".i:  Inapplicable"
-99      ".n:  No answer"
-98      ".d:  Do not Know/Cannot Choose"
-80      ".x:  Not available in this release"
-97      ".s:  Skipped on Web"
-96      ".z:  Variable-specific reserve code"
-95      ".u:  Uncodable"
-90      ".r:  Refused"
-70      ".y:  Not available in this year"
-60      ".j:  I do not have a job"
-50      ".p:  Not applicable (I have not faced this decision)/Not imputable"
-40      ".m:  DK, NA, IAP"
 ;
label define  GSP002X
98      "DK"
12      "$25000 OR MORE"
11      "$20000 - 24999"
10      "$15000 - 19999"
9      "$10000 - 14999"
8      "$8000 TO 9999"
7      "$7000 TO 7999"
6      "$6000 TO 6999"
5      "$5000 TO 5999"
4      "$4000 TO 4999"
3      "$3000 TO 3999"
2      "$1000 TO 2999"
1      "LT $1000"
-100      ".i:  Inapplicable"
-80      ".x:  Not available in this release"
-99      ".n:  No answer"
-98      ".d:  Do not Know/Cannot Choose"
-90      ".r:  Refused"
13      "Refused"
-97      ".s:  Skipped on Web"
-96      ".z:  Variable-specific reserve code"
-95      ".u:  Uncodable"
-70      ".y:  Not available in this year"
-60      ".j:  I do not have a job"
-50      ".p:  Not applicable (I have not faced this decision)/Not imputable"
-40      ".m:  DK, NA, IAP"
 ;
label define  GSP003X
1      "Very happy"
2      "Pretty happy"
3      "Not too happy"
-100      ".i:  Inapplicable"
-99      ".n:  No answer"
-98      ".d:  Do not Know/Cannot Choose"
-97      ".s:  Skipped on Web"
-96      ".z:  Variable-specific reserve code"
-95      ".u:  Uncodable"
-90      ".r:  Refused"
-80      ".x:  Not available in this release"
-70      ".y:  Not available in this year"
-60      ".j:  I do not have a job"
-50      ".p:  Not applicable (I have not faced this decision)/Not imputable"
-40      ".m:  DK, NA, IAP"
 ;


label values HRS1   GSP001X;
label values RINCOME   GSP002X;
label values HAPPY   GSP003X;

recode * (-100=.i)(-99=.n)(-98=.d)(-97=.s)(-96=.z)(-95=.u)(-90=.r)(-80=.x)(-70=.y)(-60=.j)(-50=.p)(-40=.m);

/*

Descriptions of missing codes (for more information, please refer to the Codebook)

.i: Inapplicable (IAP)

.n: No answer (NA)

.d: Don't know (DK)

.s: Skipped on web

.z: See Codebook for more information.

.u: Uncodeable

.r: Refused

.x: Not available in this release

.y: Not available in this year

.j: I don't have a job

.p: Not applicable/not imputable

.m: DK, NA, IAP

*/ 
