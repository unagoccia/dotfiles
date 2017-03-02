
'WithEventsにてApplicationオブジェクト(Excel全体を示すオブジェクト)に発生するイベントを拾える様にする
Public WithEvents xlAPP As Application

'Excelブックが開いた時に自動実行する。
Private Sub workbook_open()
    'アプリケーションオブジェクトを取得
    Set xlAPP = Application

    '標準モジュールの呼出し
    '直接呼び出すとエラーになるため、実行時間をずらして呼び出す。
    Application.OnTime Now + TimeSerial(0, 0, 1), "RegisterShortcut"
End Sub
