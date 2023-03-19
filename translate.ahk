; Ctrl+Shift+X 押下時のスクリプト
;
; ^+x (=Ctrl+Shift+X) を任意のキーバインドに変更できます
; 例えば Ctrl+Shift+Alt+D なら ^+!d です
;
; Ctrl = ^
; Shift = +
; Alt = !
; Windows = #
^+x::
    ; ウィンドウ遷移やキー操作の待機時間(msec)
    ; 上手く機能しないときはこの値を大きくしてください
{ ; V1toV2: Added bracket
    wait_time := "50"

    ; 現在アクティブのウィンドウ（PDF viewer）のIDを取得
    main_id := WinGetID("A")

    ; 改ページや図表で分断された段落を一度に翻訳するためには
    ; 前半部分を先に Ctrl+C でコピーしておき、後半部分を
    ; 選択状態にして Ctrl+Shift+Z を実行してください。

    first_half := A_Clipboard ; Clipboardにテキストがあれば保存
    Send("^c") ; 選択部分をコピー
    Sleep(wait_time)
    if StrLen(first_half) > 0
        target_str := first_half . " " . A_Clipboard ; 文字列を結合
    Else
        target_str := A_Clipboard

    ; 改行コードをすべて空白に置換
    ; StrReplace() is not case sensitive
    ; check for StringCaseSense in v1 source script
    ; and change the CaseSense param in StrReplace() if necessary
    replaced_str := StrReplace(target_str, "`r`n", A_Space)
    A_Clipboard := replaced_str ; クリップボードに代入

    ; 'DeepL...' というtitleのウィンドウを探します（前方一致）
    ; ウィンドウが存在しない場合、エラーメッセージを表示
    if !WinExist("DeepL")
    {
        MsgBox("DeepL window not found.`r`nPlease keep DeepL open first!", "", "")
        A_Clipboard := "" ; クリップボードを空にして終了
        return
    }

    ; 予め開いておいたDeepL翻訳ウィンドウをアクティブに
    WinActivate("DeepL")
    ; アクティブになるまで待機
    WinWaitActive("DeepL", , 2)

    Send("^a") ; 原文のテキストフィールドを選択
    Send("^v") ; 置換されたテキストを貼り付け
    Sleep(wait_time)

    WinActivate("ahk_id " main_id) ;PDF viewerをアクティブに戻す
    Sleep(wait_time)
    A_Clipboard := "" ; 毎回クリップボードを空にしておく
return
} ; V1toV2: Added bracket in the end