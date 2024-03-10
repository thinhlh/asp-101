<%@ Language= "Javascript" %>

<!-- #include virtual="\rest\rest.asp" -->

<%
    var handler = function (req,res) {
        var body = BindJSONBodyToObject(req)

        var name = body.name
        var age = body.age
        var activities = body.activities
        var books = body.books
        var queries = BindQueryToObject(req)

        if(!queries){
            // parameter not exists empty

            throw new HttpError("Missing query", 400)
        } else {
                var resp = {
                    rawQuery: req.QueryString().item,
                    parsedQueries: queries,
                    message: "Hello " + name +", you gonna turn " + (age+1) + " next year!",
                    activities: activities,
                    books: books
                }

                res.Status = 200
                return resp
            }
        }

    RestWrapper(Request,Response, handler)
%>