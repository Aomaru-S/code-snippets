Sub maintenaceSerialNumber()
    Debug.Print "=== START ==="

    Dim NO As String: NO = "No"
    Dim NO_COLUMN As Integer: NO_COLUMN = 1
    Dim NO_SEARCH_MAX_ROWS As Integer: NO_SEARCH_MAX_ROWS = 20

    For i = 2 To ThisWorkbook.Worksheets.Count

        Dim ws As Worksheet: Set ws = ThisWorkbook.Worksheets(i)
        Debug.Print ws.Name

        Dim cellIndex As String

        Dim no_row As Integer
        For i = 1 To NO_SEARCH_MAX_ROWS
            If ws.Cells(i, NO_COLUMN).value = NO Then
                no_row = ws.Cells(i, NO_COLUMN).Row
                i = i + 1
                Exit For
            End If
        Next

        Do
            ws.Cells(i, 1).Formula = "=ROW() -" & no_row
            i = i + 1
        Loop While ws.Cells(i, NO_COLUMN).value <> ""

    Next

    Debug.Print "==== END ===="
End Sub
