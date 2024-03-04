<%@ Language= "Javascript" %>
<!-- #include file="utils\json.asp" -->
<%

    var body = BindJSONToObject(Request)

    var name = body.name
    var age = body.age
    var activities = body.activities
    var books = body.books
    var query = Request.QueryString("query").item

    if(!query){
        // parameter exists and non-empty
        Response.Status = 400
        var err = {
            message: "Missing query"
        }
        Response.Write(JSON.stringify(err))
        Response.End()
    } else {
        var resp = {
            query: query.item,
            message: "Hello " + name +", you gonna turn " + (age+1) + " next year!",
            activities: activities,
            books: books
        }

        Response.Status = 202
        Response.Write(JSON.stringify(resp))
        Response.End()
        }
    
%>