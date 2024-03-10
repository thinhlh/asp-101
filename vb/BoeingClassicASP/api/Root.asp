<!-- #include file="..\utils\json\json.asp" -->
<!-- #include file="..\utils\rest\Rest.asp" -->

<%

    Class RespModel
        Public Body
        Public Query
    End Class

    Dim resp
    Set resp = New RespModel

    resp.Body = BindJSONBodyToObject(Request)
    resp.Query = BindQueryToObject(Request)
%>