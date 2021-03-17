NB.    J4.01 Windows Programming Examples
NB.    Keith Smillie
NB.    Department of Computing Science
NB.    University of Alberta
NB.    Edmonton, Alberta T6G 2H1
NB.    December 1998


NB. Example 0 - Standard form

WinEx0=: 0 : 0
pc winex0;
menupop "File";
menu new "&New" "" "" "";
menu open "&Open" "" "" "";
menusep ;
menu exit "&Exit" "" "" "";
menupopz;
xywh 100 8 34 14;cc nil button;cn "Nil";
xywh 100 27 34 14;cc cancel button;cn "Cancel";
pas 6 6;pcenter;
rem form end;
)

winex0_run=: 3 : 0
wd WinEx0
wd 'pshow;'
)

winex0_cancel_button=: 3 : 0
wd 'pclose;'
)

winex0_nil_button=: 3 : 0
wdinfo 'Nil pressed'
)


NB. *************************************************


NB. Example 1 - One roll of a die

WinEx1=: 0 : 0
pc winex1;
xywh 100 8 34 14;cc nil button;cn "Nil";
xywh 100 28 34 14;cc cancel button;cn "Cancel";
xywh 25 8 34 14;cc roll button;cn "Roll";
xywh 20 27 34 14;cc face static;cn "";
pas 6 6;pcenter;
rem form end;
)

winex1_run=: 3 : 0
wd WinEx1
wd 'pshow;'
)

winex1_cancel_button=: 3 : 0
wd 'pclose;'
)

winex1_nil_button=: 3 : 0
wd 'psel winex1;'
)

winex1_roll_button=: 3 : 0
wd 'set face *',12.0&":>:?6
)


NB.*************************************************


NB. Example 2 - One roll of a die

WinEx2=: 0 : 0
pc winex2;
xywh 75 6 34 16;cc cancel button;cn "Cancel";
xywh 22 6 34 14;cc roll button;cn "Roll";
xywh 22 25 34 14;cc face edit;
pas 6 6;pcenter;
rem form end;
)

winex2_run=: 3 : 0
wd WinEx2
wd 'setfont face "MS Sans Serif" 18 bold;'
wd 'pshow;'
)

winex2_cancel_button=: 3 : 0
wd 'pclose;'
)

winex2_roll_button=: 3 : 0
wd 'set face *',5.0&":>:?6
)


NB.*************************************************


NB. Example 3 - One roll of a regular polyhedron

WinEx3=: 0 : 0
pc winex3;
xywh 85 68 34 16;cc cancel button;cn "Cancel";
xywh 85 22 34 16;cc roll button;cn "Roll";
xywh 85 47 34 12;cc face static ss_center ws_border;cn "";
xywh 15 10 45 90;cc frame groupbox;cn "Faces ";
xywh 25 20 30 14;cc rb0 radiobutton;cn "   4";
xywh 25 35 30 14;cc rb1 radiobutton group;cn "   6";
xywh 25 50 30 14;cc rb2 radiobutton group;cn "   8";
xywh 25 65 30 14;cc rb3 radiobutton group;cn "  12";
xywh 25 80 30 14;cc rb4 radiobutton group;cn "  20";
pas 6 6;pcenter;
rem form end;
)

winex3_run=: 3 : 0
wd WinEx3
wd 'setfont face "MS Sans Serif" 14 bold;'
wd 'pshow;'
)

winex3_cancel_button=: 3 : 0
wd 'pclose;'
)

winex3_roll_button=: 3 : 0
wd 'set face *',":>:?('1' = rb0,rb1,rb2,rb3,rb4) # 4 6 8 12 20
)


NB.*************************************************


NB. Example 4 - Die frequency distribution

each=: &.>

rfr=: +/"1 @ (=/)
rfrtab=: [ ,. rfr
die=: >: @ ? @ $&6
dietab=: ([: >: [: i. 6:) rfrtab die@]

WDtable=: 3 : 0    
:          
;(<"1 (x. ": y.)), each LF
)

WinEx4=: 0 : 0
pc winex4;
xywh 136 12 34 14;cc roll button;cn "Roll";
xywh 136 31 34 14;cc cancel button;cn "Cancel";
xywh 66 9 40 53;cc frame groupbox;cn " Rolls ";
xywh 75 15 30 14;cc rb0 radiobutton;cn "  50";
xywh 75 30 30 14;cc rb1 radiobutton group;cn " 100";
xywh 75 45 30 14;cc rb2 radiobutton group;cn " 200";
xywh 15 13 35 63;cc frtable listbox;
pas 6 6;pcenter;
rem form end;
)

winex4_run=: 3 : 0
wd WinEx4
wd 'setfont frtable "MS Sans Serif" 14 bold;'
wd 'pshow;'
)

winex4_cancel_button=: 3 : 0
wd 'pclose;'
)

winex4_roll_button=: 3 : 0
r=. ('1'= rb0,rb1,rb2) # 50 100 200 
wd 'set frtable *',6.0 WDtable dietab r
)


NB.*************************************************


NB. Example 5 - Frequency distribution of 1, 2 or 3 dice

each=: &.>
rfr=: +/"1 @ (=/)
rfrtab=: [ ,. rfr
dicefr=: [: +/ [: >: [: ? , $ 6:
dicerng=: ] }. [: i. [: >: 6: * ]
dicetab=: dicerng@[ rfrtab dicefr

WDtable=: 3 : 0    NB. Display table 
:          
;(<"1 (x. ": y.)), each LF
)

WinEx5=: 0 : 0
pc winex5;
xywh 136 12 34 14;cc roll button;cn "Roll";
xywh 136 31 34 14;cc cancel button;cn "Cancel";
xywh 76 9 45 67;cc frame0 groupbox;cn " Rolls ";
xywh 85 15 35 14;cc rb0 radiobutton;cn "  50";
xywh 85 30 35 14;cc rb1 radiobutton group;cn " 100";
xywh 85 45 35 14;cc rb2 radiobutton group;cn " 200";
xywh 85 60 35 14;cc rb3 radiobutton group;cn " 500";
xywh 76 85 45 53;cc frame1 groupbox;cn " Dice ";
xywh 85 91 35 14;cc rb4 radiobutton;cn " 1";
xywh 85 106 35 14;cc rb5 radiobutton group;cn " 2";
xywh 85 121 35 14;cc rb6 radiobutton group;cn " 3";
xywh 15 30 45 60;cc frtable editm ws_border ws_vscroll;
pas 6 6;pcenter;
rem form end;
)

winex5_run=: 3 : 0
wd WinEx5
wd 'setfont frtable "MS Sans Serif" 14 bold;'
wd 'pshow;'
)

winex5_cancel_button=: 3 : 0
wd 'pclose;'
)

winex5_roll_button=: 3 : 0
r=. ('1' = rb0,rb1,rb2,rb3) # 50 100 200 500
n=. ('1' = rb4,rb5,rb6) # 1 2 3
wd 'set frtable *',6.0 WDtable n dicetab r
)


NB.*************************************************


NB. Example 6 - Simple calculator

WinEx6=: 0 : 0
pc winex6;
xywh 13 10 95 16;cc display static ss_center ws_border;cn "";
xywh 13 35 15 15;cc d7 button;cn "7";
xywh 33 35 15 15;cc d8 button;cn "8";
xywh 53 35 15 15;cc d9 button;cn "9";
xywh 73 35 15 15;cc mpy button;cn "*";
xywh 93 35 15 15;cc off button;cn "Off";
xywh 13 55 15 15;cc d4 button;cn "4";
xywh 33 55 15 15;cc d5 button;cn "5";
xywh 53 55 15 15;cc d6 button;cn "6";
xywh 73 55 15 15;cc div button;cn "/";
xywh 93 55 15 14;cc ce button;cn "CE";
xywh 13 75 15 14;cc d1 button;cn "1";
xywh 33 75 15 14;cc d2 button;cn "2";
xywh 53 75 15 14;cc d3 button;cn "3";
xywh 73 75 15 14;cc sub button;cn "-";
xywh 93 75 15 14;cc c button;cn "C";
xywh 13 94 15 14;cc d0 button;cn "0";
xywh 33 94 15 14;cc dec button;cn ".";
xywh 53 94 15 14;cc sign button;cn "+/-";
xywh 73 94 15 14;cc add button;cn "+";
xywh 93 94 15 14;cc is button;cn "=";
pas 6 6;pcenter;
rem form end;
)

winex6_run=: 3 : 0
wd WinEx6
wd 'setfont display "MS Sans Serif" 18 bold;'
('X';'Y';'D';'op')=: '';'';'';''
wd 'pshow;'
)

winex6_d7_button=: 3 : 0
wd 'set display *', D=: D,'7'
)

winex6_d8_button=: 3 : 0
wd 'set display *', D=: D,'8'
)

winex6_d9_button=: 3 : 0
wd 'set display *', D=: D,'9'
)

winex6_mpy_button=: 3 : 0
op=:'*'
X=: D
D=: ''
)

winex6_off_button=: 3 : 0
wd 'pclose;'
)

winex6_d4_button=: 3 : 0
wd 'set display *', D=: D,'4'
)

winex6_d5_button=: 3 : 0
wd 'set display *', D=: D,'5'
)

winex6_d6_button=: 3 : 0
wd 'set display *', D=: D,'6'
)

winex6_div_button=: 3 : 0
op=:'%'
X=: D
D=: ''
)

winex6_ce_button=: 3 : 0
wd 'set display *',D=: ''
)

winex6_d1_button=: 3 : 0
wd 'set display *', D=: D,'1'
)

winex6_d2_button=: 3 : 0
wd 'set display *', D=: D,'2'
)

winex6_d3_button=: 3 : 0
wd 'set display *', D=: D,'3'
)

winex6_sub_button=: 3 : 0
op=:'-'
X=: D
D=: ''
)

winex6_c_button=: 3 : 0
('X';'Y';'D';'op')=: '';'';'';''
wd 'set display *', ''
)

winex6_d0_button=: 3 : 0
wd 'set display *', D=: D,'0'
)

winex6_dec_button=: 3 : 0
wd 'set display *', D=: D,'.'
)

winex6_sign_button=: 3 : 0
if. '_' = {. D do. D=: }. D
    else. D=: '_', D end.
wd 'set display *', D
)

winex6_add_button=: 3 : 0
op=:'+'
X=: D
D=: ''
)

winex6_is_button=: 3 : 0
Y=: D
D=: ": do X,op,Y
wd 'set display *', D
)


NB.*************************************************


NB. Example 7 - Coupon collector's problem

each=: &.>
am=: +/ % #
pos=: >: @ i.

fr=: +/"1 @ (=/)
frtab=: [,.fr
nubfr=: +/"1 @ =
nubtab=:  ~. ,. nubfr

cc=: * +/ @: % @: pos
rnd=: <.@(0.5&+)
sort=: /:~

ccsim=: 3 : 0
n=. y.
r=. i. 0
while. n > # ~. r do.
   r=. r, ?n
end.
>:r
)

ccs=: (#@ccsim)"0 @ #

WDtable=: 3 : 0    NB. Display table 
:          
;(<"1 (x. ": y.)), each LF
)

WinEx7=: 0 : 0
pc winex7;
xywh 5 8 75 52;cc input groupbox;cn " Input ";
xywh 10 20 20 10;cc coupons edit;
xywh 35 20 30 10;cc cname static;cn "Coupons";
xywh 10 40 20 10;cc reps edit;
xywh 35 40 40 10;cc rname static;cn "Repetitions";
xywh 5 70 75 90;cc output groupbox;cn " Output ";
xywh 10 82 30 10;cc exp edit;
xywh 45 82 25 10;cc expname static;cn "Exp. mean";
xywh 10 102 30 10;cc obs edit;
xywh 45 102 30 10;cc obsname static;cn "Obs. mean";
xywh 10 122 30 10;cc min edit;
xywh 45 122 25 10;cc minname static;cn "Minumum";
xywh 10 142 30 10;cc max edit;
xywh 45 142 25 10;cc maxname static;cn "Maximum";
xywh 102 10 50 75;cc frtable editm ws_border ws_vscroll;
xywh 90 90 75 28;cc frame groupbox;cn "Frequencies";
xywh 100 98 30 14;cc rb0 radiobutton;cn "Range";
xywh 133 98 30 14;cc rb1 radiobutton group;cn "Nub";
xywh 110 125 34 14;cc ok button;cn "OK";
xywh 110 145 34 14;cc cancel button;cn "Cancel";
pas 6 6;pcenter;
rem form end;
)

winex7_run=: 3 : 0
wd WinEx7
wd 'set coupons *', '   0 '
wd 'set reps *', '   0 '
wd 'setfont frtable "MS Sans Serif" 14 bold;'
wd 'pshow;'
)

winex7_ok_button=: 3 : 0
Simulation rb1= '1'
)

Simulation=: 3 : 0
('N R')=. ". coupons,' ', reps
wd 'set exp *',''
wd 'set obs *',''
wd 'set min *',''
wd 'set max *',''
wd 'set exp *', 6.1&":cc N
wd 'set frtable *',''
if. R > 0 do.
   S=. R ccs N
   wd 'set obs *',6.1&":am S
   wd 'set min *',6.0&":<./S
   wd 'set max *',6.0&":>./S
   if. y. do.
                CCtable=: nubtab sort S
          else.
                range=: 0, pos >./S
                CCtable=: range frtab S
   end.
   wd 'set frtable *',6.0 WDtable CCtable
end.
)

winex7_cancel_button=: 3 : 0
wd 'pclose;'
)


NB.*************************************************


NB. Example 8 - Rolling 1, 2 or 3 dice with 4 or 6 faces

each=: &.>
EACH=: &>
pos=: >: @ i.
fr=: +/"1 @ (=/)
frtab=: [,.fr

WDtable=: 3 : 0    NB. Display table 
:          
;(<"1 (x. ": y.)), each LF
)

WinEx8=: 0 : 0
pc winex8;
xywh 68 96 34 12;cc ok button;cn "OK";
xywh 68 116 34 12;cc cancel button;cn "Cancel";
xywh 10 9 40 38;cc frame0 groupbox;cn " Faces ";
xywh 20 15 20 14;cc rb0 radiobutton;cn "  4";
xywh 20 30 20 14;cc rb1 radiobutton group;cn "  6";
xywh 10 54 40 53;cc frame1 groupbox;cn " Dice ";
xywh 20 60 20 14;cc rb2 radiobutton;cn "  1";
xywh 20 75 20 14;cc rb3 radiobutton group;cn "  2";
xywh 20 90 20 14;cc rb4 radiobutton group;cn "  3";
xywh 15 120 25 10;cc rolls edit;
xywh 10 135 40 15;cc rollsname static;cn "Rolls (1 to 200)";
xywh 60 10 50 75;cc frtable listbox ws_border ws_vscroll;
pas 6 6;pcenter;
rem form end;
)

winex8_run=: 3 : 0
wd WinEx8
wd 'set rolls *','  0 '
wd 'setfont rolls "MS Sans Serif" 11 bold;'
wd 'setfont frtable "MS Sans Serif" 11 bold;'
NB. DICEtab=:i. 0 2
wd 'pshow;'
)

winex8_ok_button=: 3 : 0
R=: ". rolls
R=. R * R e. pos 200
NB. wd 'set frtable *',''
if. R > 0 do.
   F=. ('1' = rb0,rb1) # 4 6
   D=. ('1' = rb2,rb3,rb4) #  1 2 3
   Range=. (D-1) }. pos F*D
   Sums =. +/ EACH >: each ? each R$<D$F
   DICEtab=: Range frtab Sums
   wd 'set frtable *',6.0 WDtable DICEtab   
end.
)

winex8_cancel_button=: 3 : 0
wd 'pclose;'
)


NB.*************************************************


NB. Example 9 - One-armed bandit simulation

EACH=: &>
DIAL1=: 'CCCCCCCOOOLLLPPPPPBR'
DIAL2=: 'CCCCCCCOOOOOOPBBBRRR'
DIAL3=: 'OOOOOOOLLLLPPPPPBBBR'
DIALS=: DIAL1;DIAL2;DIAL3
WINCOMB=: ;:'RRR BBB BBR PPP PPR OOO OOR CCL CCB CCO CCP CCR'
WinAmt=: 62 18 18 14 14 10 10 5 5 3 3 3 0

WINEX9=: 0 : 0
pc winex9;
xywh 105 25 15 15;cc symbol1 edit ws_border;
xywh 120 25 15 15;cc symbol2 edit ws_border;
xywh 135 25 15 15;cc symbol3 edit ws_border;
xywh 5 10 75 90;cc output groupbox;cn " Summary ";
xywh 10 22 30 10;cc pay edit;
xywh 45 22 25 10;cc payname static;cn "Payoff";
xywh 10 42 30 10;cc totpay edit;
xywh 45 42 30 10;cc totpayname static;cn "Total Payoff";
xywh 10 62 30 10;cc totcost edit;
xywh 45 62 25 10;cc totcostname static;cn "Total Cost";
xywh 10 82 30 10;cc netpay edit;
xywh 45 82 25 10;cc netpayname static;cn "Net Payoff";
xywh 96 48 17 30;cc ok button;cn "OK";
xywh 125 48 34 12;cc reset button;cn "Reset";
xywh 125 67 34 12;cc cancel button;cn "Cancel";
pas 6 6;pcenter;
rem form end;
)

Reset=: 3 : 0
Pay=: 0
TotPay=: 0
TotCost=: 0
NetPay=: 0
wd 'set pay *',8.0&":Pay
wd 'set totpay *',8.0&":TotPay
wd 'set totcost *',8.0&":TotCost
wd 'set netpay *',8.0&":NetPay
wd 'set symbol1 *',' '
wd 'set symbol2 *',' '
wd 'set symbol3 *',' '
)

winex9_run=: 3 : 0
wd WINEX9
Reset ''
wd 'setfont symbol1 "MS Sans Serif" 18 bold;'
wd 'setfont symbol2 "MS Sans Serif" 18 bold;'
wd 'setfont symbol3 "MS Sans Serif" 18 bold;'
wd 'pshow;'
)

winex9_close=: 3 : 0
wd'pclose'
)

winex9_reset_button=: 3 : 0
Reset ''
)

winex9_cancel_button=: 3 : 0
winex9_close''
)

winex9_ok_button=: 3 : 0
'S1 S2 S3'=: S=: (? 3$20) { EACH DIALS
wd 'set symbol1 *',S1
wd 'set symbol2 *',S2
wd 'set symbol3 *',S3
Pay=: ((>WINCOMB) i. S) { WinAmt
TotPay=: TotPay + Pay
TotCost=: >:TotCost
NetPay=: TotPay - TotCost
wd 'set pay *',8.0&":Pay
wd 'set totpay *',8.0&":TotPay
wd 'set totcost *',8.0&":TotCost
wd 'set netpay *',8.0&":NetPay
)


NB.*************************************************


NB. Example 10 - Word search

each=: &.>
EACHLEFT=: 1 : 0             
] x."1 >@[
)

Queries=: (*./@(' '&~:) *. +./@('?'&=))@,: 
Letters=: =/@,:          
Match=: [: *./ Queries +. Letters
Select=:  [ #~ [ Match EACHLEFT ]

WinEx10=: 0 : 0
pc winex10;
xywh 15 91 34 12;cc search button;cn "Search";
xywh 15 111 34 12;cc cancel button;cn "Cancel";
xywh 74 93 34 11;cc clear button;cn "Clear";
xywh 10 9 45 53;cc frame1 groupbox;cn " Dictionary ";
xywh 20 15 30 14;cc rb0 radiobutton;cn "  One";
xywh 20 30 30 14;cc rb1 radiobutton group;cn "  Two";
xywh 20 45 30 14;cc rb2 radiobutton group;cn "  Three";
xywh 12 70 40 12;cc word edit;
xywh 65 10 50 75;cc wordtable listbox ws_border ws_vscroll;
pas 6 6;pcenter;
rem form end;
)

winex10_run=: 3 : 0
wd WinEx10
wd 'setfont word "MS Sans Serif" 11 bold;'
wd 'setfont wordtable "MS Sans Serif" 11 bold;'
wd 'set word *',''
WORDLIST=: ''
wd 'set wordtable ',WORDLIST
wd 'pshow;'
)

winex10_search_button=: 3 : 0
DICTIONARY=: ".'DICT',('1' = rb0,rb1,rb2) # '123' 
WORDLIST=: WORDLIST,DICTIONARY Select word
wd 'set wordtable ',,>WORDLIST,each ' '
)

winex10_clear_button=: 3 : 0
WORDLIST=: ''
wd 'set wordtable ',''
)

winex10_cancel_button=: 3 : 0
wd 'pclose;'
)

DICT1=: ;:'cat horse crop salad elephant coffee trap book mouse'
DICT2=: ;:'table pen pin cut pan picture orange pun fish'
DICT3=: ''


NB.*************************************************


NB. Example 11 - Simplified word search

each=: &.>
EACHLEFT=: 1 : 0             
] x."1 >@[
)

Queries=: (*./@(' '&~:) *. +./@('?'&=))@,: 
Letters=: =/@,:          
Match=: [: *./ Queries +. Letters
Select=:  [ #~ [ Match EACHLEFT ]

WinEx11=: 0 : 0
pc winex11;
xywh 82 14 34 12;cc search button;cn "Search";
xywh 82 30 34 12;cc reset button;cn "Reset";
xywh 82 46 34 12;cc cancel button;cn "Cancel";
xywh 11 8 50 11;cc input edit;
xywh 11 25 50 50;cc wordtable listbox ws_border ws_vscroll;
pas 6 6;pcenter;
rem form end;
)

winex11_run=: 3 : 0
wd WinEx11
wd 'setfont input "MS Sans Serif" 11 bold;'
wd 'setfont wordtable "MS Sans Serif" 11 bold;'
wd 'set input *','?'
wd 'set wordtable ',''
wd 'pshow;'
)

winex11_search_button=: 3 : 0
wd 'set wordtable ',,>(DICTIONARY Select input),each ' '
)

winex11_reset_button=: 3 : 0
wd 'set input *','?'
wd 'set wordtable ',''
)

winex11_cancel_button=: 3 : 0
wd 'pclose;'
)

W1=: ;:'cat horse crop salad elephant coffee trap book mouse'
W2=: ;:'table pen pin cut pan fork picture orange pun fish cake'
W3=: ;:'dart ream gale adds pica coda gace'
DICTIONARY=: W1,W2,W3


NB.*************************************************


NB. Example 12 - Stone, scissors, paper

WINEX12=: 0 : 0
pc winex12;
xywh 115 10 34 12;cc reset button;cn "Reset";
xywh 115 25 34 12;cc cancel button;cn "Cancel";
xywh 10 12 34 12;cc stone button;cn "Stone";
xywh 10 27 34 12;cc scissors button;cn "Scissors";
xywh 10 42 34 12;cc paper button;cn "Paper";
xywh 10 60 34 12;cc computer edit;
xywh 15 75 34 10;cc COMPUTER static;cn "Computer";
xywh 55 5 50 70;cc output groupbox;cn "Summary";
xywh 60 15 20 10;cc win edit;
xywh 85 16 15 10;cc WIN static;cn "Win";
xywh 60 30 20 10;cc lose edit;
xywh 85 31 15 10;cc LOSE static;cn "Lose";
xywh 60 45 20 10;cc draw edit;
xywh 85 46 15 10;cc DRAW static;cn "Draw";
xywh 60 60 20 10;cc total edit;
xywh 85 61 15 10;cc TOTAL static;cn "Total";
xywh 115 42 34 34;cc jicon button bs_ownerdraw;cn "system\examples\data\jb.ico";
pas 6 6;pcenter;
rem form end;
)

Reset=: 3 : 0
Win=: 0
Lose=: 0
Draw=: 0
wd 'set win *', 8.0&":Win
wd 'set lose *', 8.0&":Lose
wd 'set draw *', 8.0&":Draw
wd 'set total *',8.0&":Win+Lose+Draw
wd 'set computer *',''
)

Update=: 3 : 0
R=. ?3
N=. 3&#.y.,R
wd 'set computer *',>R{ '  Stone';'  Scissors';'  Paper'
if. 
   N e. 1 5 6 do. Win=: >:Win 
elseif.
   N e. 2 3 7 do. Lose=: >:Lose
elseif.
   N e. 0 4 8 do. Draw=: >:Draw 
end.
wd 'set win *', 8.0&":Win
wd 'set lose *', 8.0&":Lose
wd 'set draw *', 8.0&":Draw
wd 'set total *', 8.0&":Win+Lose+Draw
)

winex12_run=: 3 : 0
wd WINEX12
Reset ''
wd 'pshow;'
)

winex12_close=: 3 : 0
wd'pclose'
)

winex12_stone_button=: 3 : 0
Update 0
)

winex12_scissors_button=: 3 : 0
Update 1
)

winex12_paper_button=: 3 : 0
Update 2
)
winex12_reset_button=: 3 : 0
Reset ''
)

winex12_cancel_button=: 3 : 0
winex12_close''
)

NB. xywh 328 75 34 34;cc jicon button bs_ownerdraw;cn "examples\data\jb.ico";


NB.   ***** End of script file *****
 
  







 