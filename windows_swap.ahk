F1::
{
    MonitorCount := MonitorGetCount()
    if (MonitorCount > 1) {
        oid := WinGetlist(,,,)
        aid := Array()
        id := oid.Length
        For v in oid
        {   aid.Push(v)
        }
        right_id := 0
        left_id := 0
        Loop aid.Length
        {
            this_id := aid[A_Index]
            WinGetPos(&this_x, &this_y, &this_width, &this_height, "ahk_id " this_id)
            this_process := WinGetProcessName("ahk_id " this_id)
            ; 適宜自分の環境に合わせて調整する
            ; 以下のコメントを外してパラメータの値を確認する
            ; MsgBox("window ID: " this_id ", process: " this_process
            ;        ", x: " this_x ", y: " this_y ", w: " this_width ", h: " this_height)
            if (this_x > -10 and this_x < 0 and this_y > -10 and this_y < 0
                and this_process != "explorer.exe") {
                right_id := this_id
                break
            }
        }
        Loop aid.Length
        {
            this_id := aid[A_Index]
            WinGetPos(&this_x, &this_y, &this_width, &this_height, "ahk_id " this_id)
            this_process := WinGetProcessName("ahk_id " this_id)
            if (this_x < -1920 and this_x > -1930 and this_y > -10 and this_y < 0
                and this_width > 1920 and this_height > 1080
                and this_process != "explorer.exe") {
                left_id := this_id
                break
            }
        }
        if (right_id) {
            right_process := WinGetProcessName("ahk_id " right_id)
            ; なぜかわからないけど、WinMoveを2回呼ぶと最大化できる
            WinMove(-1500, 100, 1000, 500, "ahk_id " right_id)
            WinMove(-1500, 100, 1000, 500, "ahk_id " right_id)
        }
        if (left_id) {
            left_process := WinGetProcessName("ahk_id " left_id)
            WinMove(100, 100, 1000, 500, "ahk_id " left_id)
            WinMove(100, 100, 1000, 500, "ahk_id " left_id)
        }
    }
}