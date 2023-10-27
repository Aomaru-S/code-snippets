Sub deleteSpecifiedValueRow(value: String)
    Dim MAX_SUPPORT_ROWS As Integer: MAX_SUPPORT_ROWS = 200
    Dim COLUMN_COL As String: COLUMN_COL = "B"

    Debug.Print String(200, vbCrLf)
    Debug.Print "Start"

    For i = 1 To ThisWorkbook.Worksheets.Count
        Dim ws As Worksheet: Set ws = ThisWorkbook.Worksheets(i)

        For r = 1 To MAX_SUPPORT_ROWS
            Dim cellIndex As String: cellIndex = COLUMN_COL & r
            If ws.Range(cellIndex).Value = value Then
                ws.Range(cellIndex).EntireRow.Delete
            End If
        Next
    Next
End Sub
