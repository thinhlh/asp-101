<!-- #include virtual="\utils\json\json.asp" -->

<%
    Function BindRequestBody(req)
        If req.TotalBytes > 0 Then
            Dim lngBytesCount
                lngBytesCount = req.TotalBytes


            Dim binaryBody, strBody
                binaryBody = req.BinaryRead(lngBytesCount)
                strBody = BytesToStr(binaryBody)
            
            Set BindRequestBody = JsonStringToObject(strBody)
            Exit Function
        End If
    End Function

    Function BytesToStr(bytes)
        Dim Stream
        Set Stream = Server.CreateObject("Adodb.Stream")
            Stream.Type = 1 'adTypeBinary
            Stream.Open
            Stream.Write bytes
            Stream.Position = 0
            Stream.Type = 2 'adTypeText
            Stream.Charset = "iso-8859-1"
            BytesToStr = Stream.ReadText
            Stream.Close
        Set Stream = Nothing
    End Function

    Function JsonStringToObject(jsonString)
        Dim prop
        Set oJSON = New aspJSON

        oJSON.loadJSON(jsonString)

        Set JsonStringToObject = oJSON

        Exit Function
    End Function
%>