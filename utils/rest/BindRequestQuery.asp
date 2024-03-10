<%
    ' Bind Request Query to VB Dictionary
    Function BindRequestQuery(req)
        Dim queries
        Set queries = Server.CreateObject("Scripting.Dictionary")

        Dim rawQueries
            rawQueries = Split(req.QueryString(), "&")


        For Each rawQuery in rawQueries
            Dim keyPair
                keyPair = Split(rawQuery, "=")

            queries.Add keyPair(0), keyPair(1)
        Next
        
        Set BindRequestQuery = queries
    End Function
%>