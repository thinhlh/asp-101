<!-- #include virtual="\utils\rest\BindRequestBody.asp" -->
<%

    Class RequestModelClass
        Public name
        Public age

    End Class
    Dim body
    Set    body = BindRequestBody(Request)

    Response.ContentType = "application/json"
    Response.Write(body.collection())
%>