<!-- #include virtual="\utils\rest\js\BindRequestBody.asp" -->
<%

    Class RequestModelClass
        Public name
        Public age
        Public favorites

        Public Sub MapFromJSON(json)
            name = json.data("name")
            age = json.data("age")
            favorites = array()

            For Each index in json.data("favorites")
                Dim length
                    length = UBound(favorites)
                ReDim Preserve favorites(length + 1)
                favorites(UBound(favorites)) = json.data("favorites")(index)
            Next
        End Sub

        Public Function MapToJSON()
            Set oJSON = New aspJSON
            
            With oJSON.data
                .Add "name", name
                .Add "age", age
                .Add "favorites", oJSON.Collection()
            
                With oJSON.data("favorites")
                    For i = 0 to UBound(favorites)
                        .Add i, favorites(i)
                    Next
                End With
            End With

            MapToJSON = oJSON.JSONoutput()

        End Function

    End Class


    Dim body
    Set body = BindRequestBody(Request)

    Dim result
    Set result = New RequestModelClass

    result.MapFromJSON(body)

    Response.ContentType = "application/json"
    Response.Write(result.MapToJSON())
%>