Attribute VB_Name = "modRng"
Option Base 0
Option Explicit

Public Function TLookup(key, tbl As String, targetCol As String, Optional sourceCol As String = "", Optional otherwise = Empty, Optional bkn = "") As Variant
    Dim num, ret, bkn0
    bkn0 = ActiveWorkbook.Name
    If bkn = "" Then bkn = ThisWorkbook.Name
    Workbooks(bkn).Activate
    Application.Volatile
    On Error GoTo lnError
    If sourceCol = "" Then sourceCol = Range(tbl & "[#headers]")(1, 1)
    num = WorksheetFunction.Match(key, Range(tbl & "[" & sourceCol & "]"), 0)
    If num = 0 Then
        ret = otherwise
    Else
        ret = Range(tbl & "[" & targetCol & "]")(num, 1)
    End If
    TLookup = ret
    Workbooks(bkn0).Activate
    Exit Function
lnError:
    Debug.Print Err.Description
    TLookup = Empty
    Workbooks(bkn).Activate
End Function

Public Sub TSetUp(vl, key, tbl As String, targetCol As String, Optional sourceCol As String = "", Optional bkn = "")
    Dim bkn0
    bkn0 = ActiveWorkbook.Name
    If bkn = "" Then bkn = ThisWorkbook.Name
    Workbooks(bkn).Activate
    Application.Volatile
    On Error GoTo lnError
    If sourceCol = "" Then sourceCol = Range(tbl & "[#headers]")(1, 1)
    Range(tbl & "[" & targetCol & "]")(WorksheetFunction.Match(key, Range(tbl & "[" & sourceCol & "]"), 0), 1).Value = vl
    Workbooks(bkn0).Activate
    Exit Sub
lnError:
    Debug.Print Err.Description
End Sub

Sub layAryAt(ary, r, c, Optional rc = "r", Optional sn = "", Optional bn = "")
    Dim num
    If sn = "" Then sn = ActiveSheet.Name
    If bn = "" Then bn = ActiveWorkbook.Name
    num = lenAry(ary)
    Select Case LCase(rc)
        Case "r"
            Workbooks(bn).Worksheets(sn).Cells(r, c).Resize(1, num) = ary
        Case "c"
            Workbooks(bn).Worksheets(sn).Cells(r, c).Resize(num, 1) = Application.WorksheetFunction.Transpose(ary)
        Case Else
    End Select
End Sub

Function rangeToAry(rg, Optional rc = "r", Optional num = 1)
    Dim ret, tmp
    tmp = rg
    If Not IsArray(tmp) Then
        ret = Array(tmp)
    Else
        With Application.WorksheetFunction
            Select Case LCase(rc)
                Case "r"
                    ret = .Index(tmp, num, 0)
                Case "c"
                    ret = .Transpose(.Index(tmp, 0, num))
                Case Else
            End Select
        End With
        If dimAry(ret) = 0 Then
            ret = Array(tmp)
        End If
    End If
    rangeToAry = ret
End Function

Function rangeToArys(rg, Optional rc = "r")
    Dim ret, tmp
    Dim num As Long, i As Long
    tmp = rg
    If Not IsArray(tmp) Then
        ret = Array(tmp)
    Else
        If rc = "c" Then
            tmp = Application.WorksheetFunction.Transpose(tmp)
        End If
        If dimAry(tmp) <= 1 Then
            ret = Array(tmp)
        Else
            num = lenAry(tmp)
            ReDim ret(1 To num)
            For i = 1 To num
                ret(i) = Application.WorksheetFunction.Index(tmp, i, 0)
            Next i
        End If
    End If
    rangeToArys = ret
End Function
