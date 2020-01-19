Attribute VB_Name = "modTest"
Sub testconAry()
    DebugLog.setLog
    ary1 = Array(1, 2, 3)
    ary2 = Array(4, 5, 6, 7)
    ary3 = Array(8, 9, 10)
    x1 = conArys(ary1, ary2)
    x2 = conArys(ary1, ary2, ary3)
    printAry x1
    printAry x2
    Stop
End Sub

Function conStr(a, b, dlm)
    conStr = a & dlm & b
End Function

Sub testReduce()
    x = reduceA("conStr", Array("a", "b", "c"), "-")
    printOut x
End Sub

Sub testFold()
    x = foldA("calc", mkSeq(5), 100, "-")
    printOut x
End Sub

Sub testCollection()
    Dim clc As Collection
    Set clc = New Collection
    ary1 = Array(1, 2, 3)
    ary2 = Array("a", "b", "c")
    For Each elm In ary1
        clc.Add elm
    Next
    For Each elm In ary2
        clc.Add elm
    Next
    x = clcToAry(clc)
    printAry x
End Sub

Sub testSeq()
    printAry mkSameAry(12, 5)
    printAry mkSeq(5)
    printAry mkSeq(3, 5, -1)
    printAry mkSeq(15, 3, 2)
    printAry mkSeq(5, 9, 2)
    printAry mkSeq(3, -3, -2)
End Sub

Sub testToString()
    a = "abc"
    b = Time
    c = "123"
    x = Array(1, Array(1 / 3, 2.5, 3), Array(2, Array(3)), Array(1, 2))
    y = Array(Array(True, False, True), Array(4, 5, 6))
    z = Application.WorksheetFunction.Transpose(y)
    w = Range("A1:C2")
    printOut toString(a)
    printOut toString(b)
    printOut toString(c)
    printOut toString(x)
    printOut toString(y)
    printOut toString(z)
    printOut toString(w)
End Sub

Sub testDrop()
    ary = Array(1, 2, 3, 4, 5, 6, 7, 8, 9)
    Dim ary1(1 To 9)
    For i = 1 To 9
        ary1(i) = i
    Next
    x = dropAry(ary, 3)
    y = dropAry(ary, 0)
    z = dropAry(ary, -3)
    w = dropAry(ary, 9)
    x1 = dropAry(ary1, 3)
    y1 = dropAry(ary1, 0)
    z1 = dropAry(ary1, -3)
    w1 = dropAry(ary1, 9)
    printAry (x)
    printAry (y)
    printAry (z)
    printAry (w)
    printAry (x1)
    printAry (y1)
    printAry (z1)
    printAry (w1)
End Sub

Sub testTake()
    ary = Array(1, 2, 3, 4, 5, 6, 7, 8, 9)
    Dim ary1(1 To 9)
    For i = 1 To 9
        ary1(i) = i
    Next
    y = takeAry(ary, 0)
    z = takeAry(ary, 3)
    w = takeAry(ary, -3)
    y1 = takeAry(ary1, 0)
    z1 = takeAry(ary1, 3)
    w1 = takeAry(ary1, -3)
    printAry (y)
    printAry (z)
    printAry (w)
    printAry (y1)
    printAry (z1)
    printAry (w1)
End Sub
Sub testCon()
    a = mkSeq(10000)
    b = mkSeq(10000, 2, 2)
    c = mkSeq(10000, 3, 3)
    Call printTime("conarys", a, b, c)
    printAry (conArys(a, b, c))
End Sub
Sub testMapA()
    a = mkSeq(10)
    b = mkSeq(10001, 0, 3)
    x = printTime("mapA", "calc", a, 1, "+")
    printAry (x)
    y = printTime("mapA", "calc", a, 2, "*")
    printAry (y)
    t1 = Time
    z0 = mapA("calc", b, 1, "+")
    t2 = Time
    printAry z0
    printOut "mapA: -" & Format(t2 - t1, "hh:nn:ss")
End Sub
Sub testRgt()
    rg = Range("A1:A2")
    printOut TypeName(rg)
    printOut IsArray(rg)
End Sub
Sub testRangeToArys()
    Dim rg                As Range
    Set rg = Range("A1:C2")
    dary = rg
    Dim dr(0 To 1, 0 To 2)
    dr(0, 0) = "a"
    dr(0, 1) = "b"
    dr(0, 2) = "c"
    dr(1, 0) = 1
    dr(1, 1) = 2
    dr(1, 2) = 3
    a = rangeToArys(rg)
    b = rangeToArys(rg, "c")
    Ad = rangeToArys(dary)
    bd = rangeToArys(dary, "c")
    Adr = rangeToArys(dr)
    bdr = rangeToArys(dr, "c")
    printAry (a)
    printAry (b)
    printAry (Ad)
    printAry (bd)
    printAry (Adr)
    printAry (bdr)
End Sub
Sub testElm()
    Dim a(0 To 1, 0 To 2, 0 To 3, 0 To 4)
    vl = 1
    For i = 0 To 1
        For j = 0 To 2
            For k = 0 To 3
                For l = 0 To 4
                    a(i, j, k, l) = vl
                    vl = vl + 1
                Next l
            Next k
        Next j
    Next i
    x = getElm(a, Array(0, 1, 2, 3))
    printOut x
    sp = getAryShape(a)
    lsp = getAryShape(a, "L")
    n = reduceA("calc", sp, "*")
    For i = 0 To n - 1
        idx = mkIndex(i, sp, lsp)
        y = getElm(a, idx)
        printOut y & ","
    Next i
End Sub
Sub testRangeToAry()
    Dim rg                As Range
    Set rg = Range("A1:C2")
    dary = rg
    Dim dr(0 To 1, 0 To 2)
    dr(0, 0) = "a"
    dr(0, 1) = "b"
    dr(0, 2) = "c"
    dr(1, 0) = 1
    dr(1, 1) = 2
    dr(1, 2) = 3
    a = rangeToAry(rg, "r", 2)
    b = rangeToAry(rg, "c", 2)
    Ad = rangeToAry(dary, "r", 2)
    bd = rangeToAry(dary, "c", 2)
    Adr = rangeToAry(dr, "r", 2)
    bdr = rangeToAry(dr, "c", 2)
    printAry (a)
    printAry (b)
    printAry (Ad)
    printAry (bd)
    printAry (Adr)
    printAry (bdr)
End Sub

Sub testAt()
    a = Array(1, 2, 3, 4, 5, 6)
    Dim b(1 To 6)
    For i = 1 To 6
        b(i) = i
    Next
    printOut getAryAt(a, 2)
    printOut getAryAt(b, 2)
    printOut getAryAt(a, -2)
    printOut getAryAt(b, -2)
    Call setAryAt(a, 2, -3)
    Call setAryAt(b, 2, -3)
    Call setAryAt(a, -2, -5)
    Call setAryAt(b, -2, -5)
    printAry (a)
    printAry (b)
    a = Array(1, 2, 3, 4, 5, 6)
    For i = 1 To 6
        b(i) = i
    Next
    printOut getAryAt(a, 2, 0)
    printOut getAryAt(b, 2, 0)
    printOut getAryAt(a, -2, 0)
    printOut getAryAt(b, -2, 0)
    Call setAryAt(a, 2, -3, 0)
    Call setAryAt(b, 2, -3, 0)
    Call setAryAt(a, -2, -5, 0)
    Call setAryAt(b, -2, -5, 0)
    printAry (a)
    printAry (b)
End Sub
Sub testadd()
    x = Array(Null, Null)
    printOut lenAry(x)
    printAry (x)
End Sub
Sub testShape()
    Dim a(1 To 3, 1 To 4, 1 To 5)
    Print ' Dim a(1 To 3, 1 To 4)
    Dim b(0 To 3, 0 To 4, 0 To 5)
    Dim c(1 To 5)
    vl = 1
    fob = mkF(1, "calc", Null, 1, "+")
    Call setAryMByF(a, fob)
    Call setAryMByF(b, fob)
    Call setAryMByF(c, fob)
    x = getAryShape(a)
    y = getAryShape(b)
    z = getAryShape(c)
    printAry (x)
    printAry (y)
    printAry (z)
    x = getAryShape(a, "U")
    y = getAryShape(b, "U")
    z = getAryShape(c, "U")
    printAry (x)
    printAry (y)
    printAry (z)
    x = getAryShape(a, "L")
    y = getAryShape(b, "L")
    z = getAryShape(c, "L")
    printAry (x)
    printAry (y)
    printAry (z)
    Call printTime("printAry", a)
    Call printTime("printAry", b)
    Call printTime("printAry", c)
    Stop
End Sub

Sub testApply()
    a = mkSeq(30)
    e = mapA("applyF", a, mkF(2, "calc", 2, Null, "^"))
    printAry (e)
    fob0 = Array(Array(Array(1), Array("calc", Null, 3, "+")), Array(Array(2), Array("calc", 100, Null, "/")))
    fob1 = Array(mkF(1, "calc", Null, 3, "+"), mkF(2, "calc", 100, Null, "/"))
    b0 = mapA("applyFs", a, fob0)
    b1 = mapA("applyFs", a, fob1)
    printAry (b0)
    printAry (b1)
End Sub

Sub testmkF()
    a = mkF(1, "calc", Null, 3, "%")
    b = mkF(2, 1, "calc", Null, Null, "-")
    printAry (a)
    printAry (b)
End Sub

Sub testPrmAry()
    a = Array(1, 2, 3, Array(4, 5, 6), Array(7, 8, 9))
    b = prmAry(a)
    printAry (a)
    printAry (b)
End Sub

Sub testFoldF()
    fo = mkF(2, 1, "calc", Null, Null, "-")
    sq = mkSeq(5)
    a = foldF(fo, sq, 1)
    printOut a
End Sub

Sub testZipApply()
    fob = mkF(1, 2, "calc", Null, Null, "+")
    z = zipApplyF(fob, mkSeq(5), mkSeq(5, 10, -2))
    printAry (z)
End Sub

Sub testZip()
    x = zip(Array(1, 2, 3, 4), Array(2, 3, 4, 5), Array(3, 4, 5, 6))
    printAry (x)
    a = mkSeq(5)
    b = mkSeq(5, 10, -2)
    c = zip(a, b)
    printAry (c)
    d = Array(Array(1, 2), Array(3, 4), Array(5, 6))
    e = Array(7, 8, 9)
    f = Array("a", "b", "c")
    y = zip(d, e, f)
    printAry (y)
    Stop
End Sub

Sub testAry()
    Dim x(1 To 3, 1 To 3) As String
    For i = 1 To 3
        For j = 1 To 3
            x(i, j) = Chr(65 + (i - 1) + (j - 1) * 3)
        Next j
    Next i
    Set y = Range("a1:c2")
    z = Range("a1:c2")
    printOut TypeName(x)
    printAry (x)
    printOut TypeName(y)
    printAry (y)
    printOut TypeName(z)
    printAry (z)
End Sub

Sub testZipArrayTime()
    a = mkSeq(10)
    b = mkSeq(10, 20, -2)
    c = mkSeq(10, 100, -10)
    a = mkSeq(100000)
    b = mkSeq(100000, 200000, -2)
    c = mkSeq(100000, 1000000, -10)
    x = Array(a, b, c)
    y = printTime("zipary", x)
    z = printTime("zip", a, b, c)
    Call printTime("conarys", x)
    Print ' printAry x
    Print ' printAry y
    Print ' printAry Z
    Print 'Stop
End Sub

Sub testGetAryNum()
    Dim a(3, 4, 5)
    Dim b(1 To 3, 1 To 4, 1 To 5)
    x = getAryNum(a)
    y = getAryNum(b)
    printOut x
    printOut y
End Sub

Sub testMAry()
    Dim a(3, 4)
    Dim b(1 To 3, 1 To 4)
    c = mkSeq(60, 1, 2)
    Call setAryMbyS(a, c)
    Call setAryMbyS(b, c)
    printAry (a)
    printOut
    printAry (b)
    Range("a1").Resize(4, 5) = a
    Range("a6").Resize(3, 4) = b
End Sub

Sub testFlatten()
    Dim a(3, 4, 5)
    b = mkSeq(120)
    Call setAryMbyS(a, b)
    x = flattenAry(a)
    y = getArySbyM(a)
    printAry (a)
    printAry (b)
    printAry (x)
    printAry (y)
    printOut
    Dim f(2, 3)
    g = mkSeq(12, 11)
    Call setAryMbyS(f, g)
    d = Array(1, 2, Array(3, 4, Array(5, 6), 7, Array(8), f), 9, 1)
    w = flattenAry(d)
    printAry (w)
End Sub

Sub testReshape()
    a = reshapeAry(mkSeq(720, 1, 2), Array(3, 4, 5, 6))
    b = reshapeAry(mkSeq(720, 1, 2), Array(3, 4, 5, 6), 1)
    e = printTime("reshapeAry0", mkSeq(1000000), Array(100, 100, 100))
    c = printTime("reshapeAry", mkSeq(1000000), Array(100, 100, 100))
    f = printTime("reshapeAry", mkSeq(1000000), Array(100, 100, 100), 1)
    d = reshapeAry(mkSeq(27000), Array(30, 30, 30), 1)
    Stop
    
    printTime "printAry", a
    printTime "printAry", b
    printTime "printAry", c
    Stop
    printTime "printAry", e
    Stop
    printTime "printAry", d
    
End Sub

Sub testSequence()
    
    t1 = Time
    r = 2000
    c = 100
    y = reshapeAry(mkSeq(r * c), Array(r, c))
    t2 = Time
    printOut Format(t2 - t1, "hh:mm;ss")
    Call printTime("printAry", y)
    Stop
    Call printTime("print2DAry", y)
    Stop
' t3 = Time
' x = Application.WorksheetFunction.Sequence(500, 100)
' t4 = Time
' printOut Format(t4 - t3, "hh:mm;ss")
' Call printTime("printAry", x)
' Stop
    
End Sub

Sub testMaryAccessor()
    
    x = reshapeAry(mkSeq(100), Array(2, 3, 4))
    printAry x
    y = getMAryAt(x, Array(1, 1, 1))
    printOut y
    z = getMAryAt(x, Array(1, 1, 1), 0)
    printOut z
    Call setMAryAt(x, Array(1, 1, 1), -1)
    Call setMAryAt(x, Array(1, 1, 1), -2, 0)
    printAry x
    
    
    x0 = Application.WorksheetFunction.Sequence(4, 5)
    printAry x0
    y0 = getMAryAt(x0, Array(1, 1))
    printOut y0
    z0 = getMAryAt(x0, Array(1, 1), 0)
    printOut z0
    Call setMAryAt(x0, Array(1, 1), -1)
    Call setMAryAt(x0, Array(1, 1), -2, 0)
    printAry x0
    
    
End Sub

Sub testl_()
    Dim x As Variant
    Dim y As Variant
    Dim z As Variant
    
    x = Array(Array(Array(10, 11), Array(20, 21)), Array(Array(30, 31)), Array(Array(40, 41), Array(50, 51), Array(60, 61)))
    y = l_(l_(l_(10, 11), l_(20, 21)), l_(l_(30, 31)), l_(l_(40, 41), l_(50, 51), l_(60, 61)))
    z = l_()
    printAry (x)
    printAry (y)
    printAry (z)
    
    printOut TypeName(x)
    printOut TypeName(y)
    printOut TypeName(z)
    
End Sub

Sub testmMapA()
    x1 = reshapeAry(mkSeq(24), Array(2, 3, 4))
    printAry (x1)
    printOut
    y1 = mMapA("calc", x1, 5, "*")
    printAry (y1)
    
    ReDim x2(1 To 4, 1 To 5)
    
    Call setAryMbyS(x2, mkSeq(20))
    printAry (x2)
    
    printOut
    y2 = mMapA("calc", x2, 5, "-")
    printAry (y2)
    
    fob = mkF(2, "calc", 3, Null, "-")
    fobs = Array(fob, mkF(1, "calc", Null, 3, "*"))
    y3 = mMapA("ApplyF", x2, fob)
    y4 = mMapA("ApplyFs", x2, fobs)
    
    printAry (y3)
    printAry (y4)
    
End Sub

Sub testSpill()
    
    r = 2000
    c = 10000
    
    
    x = reshapeAry(mkSeq(r * c), Array(r, c))
    
    'x = Application.WorksheetFunction.Sequence(2000, 10000)
    
    
    Call LogSetting.setAllFlg(True, True)
    
    printTime "print2DAry", x
    
End Sub

Sub testSimpleAry()
    
    r = 500
    c = 100
    
' r = 1048576
' c = 16384
    
    x = reshapeAry(mkSeq(r * c), Array(r, c))
    
    printTime "print2DAry", x
    Stop
    printTime "printSimpleAry", x
    Stop
    printTime "printAry", x
    Stop
    
    Call LogSetting.setAllFileFlg(True)
    
    printTime "print2DAry", x
    Stop
    printTime "printSimpleAry", x
    Stop
    printTime "printAry", x
    Stop
    
    Call LogSetting.setDic(False, True, "array")
    
    printTime "print2DAry", x
    Stop
    printTime "printSimpleAry", x
    Stop
    printTime "printAry", x
End Sub

Sub test3DArray()
    
    d = 100
    r = 100
    c = 100
    x = reshapeAry(mkSeq(d * r * c), Array(d, r, c))
    LogSetting.setAllFileFlg (True)
    Call LogSetting.setDic(False, True, "array")
    
    printTime "print3DAry", x
    printTime "print3DAry", x
    printTime "print3DAry", x
    
End Sub

Sub test1DArray()
    x = mkSeq(1000000)
    Call LogSetting.setAllFlg(True, True)
    printTime "print1DAry", x
End Sub

Sub testPoly()
    printOut poly(-2, Array(1, 2, 3))
    printOut polyStr(Array(2, -3, 4, 5))
    printOut polyStr(Array(2, 3.2, 0, 5))
    printOut polyStr(Array(1, 3, 0, 0))
    printOut polyStr(Array(1, 1, 0, 1))
    
    printOut polyStr(Array(5))
    printOut polyStr(Array(1))
    printOut polyStr(Array(0))
    
End Sub

Function mk2DSeq1(r, c, Optional first = 1, Optional step = 1, Optional bs = 0)
    sp = Array(r, c)
    ret = mkAry(sp, bs)
    Call setAry2DSeq(ret, first, step)
    mk2DSeq1 = ret
End Function

Sub testmkSeq()
    r = 1000
    c = 10000
    first = -100
    step = 7
    x1 = printTime("mkSequence", r, c, first, step)
    x2 = printTime("mk2DSeq", r, c, first, step)
    x3 = printTime("mk2DSeq1", r, c, first, step)
    x4 = printTime("mkaryMSeq", Array(r, c), first, step)
    t1 = Timer
    x5 = Application.WorksheetFunction.Sequence(r, c, first, step)
    t2 = Timer
    printOut ("worksheetfunction" & " - " & secToHMS(t2 - t1))
    Stop
End Sub
