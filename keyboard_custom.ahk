;<single>
sc03A::sc02A	;caps lock -> shift
;+9::+8		;) -> (
sc152::sc153	;insert -> delete
sc14F::sc147	;End -> Home
sc149::sc14F	;PgUp -> End
sc151::sc14F	;PgDn -> End
+0::=		;shift + 0 -> =
sc07D::sc00E	;\ -> back space
;sc079::,	;変換キー -> ,
;sc070::,	;カタカナひらがなキー -> ,
;sc138::,,::m	;右Altキー -> ,
+,::<		;shift + , -> <
"::'		;" -> '
Return

;<double> ←最初の行はscで書かないと2度押しでBSだけ実行されてしまうので注意
; ;は一回押すと:二回押すと;
sc027::
{ ; V1toV2: Added bracket
If (A_PriorHotKey == A_ThisHotKey and A_TimeSincePriorHotkey < 400)
  {
    Send("{BS}")
    Send("{sc027}")
  }
else{
    Send("{sc028}")
}
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

sc028::
{ ; V1toV2: Added bracket
If (A_PriorHotKey == A_ThisHotKey and A_TimeSincePriorHotkey < 400)
  {
    Send("{BS}")
    Send("{sc027}")
  }
else{
    Send("{sc028}")
}
Return

; ^を2回押すと^で1回だと-
} ; V1toV2: Added Bracket before hotkey or Hotstring
sc00D::
{ ; V1toV2: Added bracket
If (A_PriorHotKey == A_ThisHotKey and A_TimeSincePriorHotkey < 300)
  {
    Send("{BS}")
    Send("{sc00D}")
  }
else{
    Send("{-}")
}
Return

; )を2回押すと)で1回だと(
} ; V1toV2: Added Bracket before hotkey or Hotstring
+sc00A::
{ ; V1toV2: Added bracket
If (A_PriorHotKey == A_ThisHotKey and A_TimeSincePriorHotkey < 300)
  {
    Send("{BS}")
    Send("{)}")
  }
else{
    Send("{(}")
}
Return
} ; V1toV2: Added bracket in the end
