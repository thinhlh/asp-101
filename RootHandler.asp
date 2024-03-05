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

            res.Status = 400
            throw new Error("Missing query")
        } else {
                var resp = {
                    parsedQueries: queries,
                    message: "Hello " + name +", you gonna turn " + (age+1) + " next year!",
                    activities: activities,
                    books: books,
                    rawQuery: req.QueryString().item
                }

                res.Status = 200
                return resp
            }
        }

    RestWrapper(Request,Response, handler)
%>