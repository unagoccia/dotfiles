
'マクロの実行メニューにPublicプロシージャが表示されないようにする。
Option Private Module


'Excel起動時に自動実行するプロシージャ
Public Sub RegisterShortcut()
    'ファイル読込みに時間がかかるとエラーになるためスキップする
    On Error GoTo nextProc

    '自動実行処理（ショートカットの登録）を以下に記述する
    Application.OnKey "^%m", "セル結合"
    Application.OnKey "^%+m", "セル結合解除"
    Application.OnKey "^%r", "罫線_外枠"
    Application.OnKey "^%g", "罫線_格子"
    Application.OnKey "^%+g", "罫線なし"
    Application.OnKey "^%+v", "値のみペースト"

nextProc:

End Sub
