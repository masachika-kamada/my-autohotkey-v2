^+v::
{
    ; クリップボードの内容を変更: \ を / に置換
    A_Clipboard := StrReplace(A_Clipboard, "\", "/")
    ; 置換された内容をペースト
    Send("^v")
    return
}