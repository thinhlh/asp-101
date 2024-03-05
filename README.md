# Clasic ASP 101

# Assumption
- Basically, Classic ASP is just like a SSR technology, which allows us to embed some server scripts using <%>, just like we do with <script/> in HTML & NextJS

## Programming language
> You can use either VBScript by default or use Javascript

## How to use
1. Specify Scripting Lang. This must be specified before every route
    ```ASP
    <%@ Language= "Javascript" %>
    ```
2. Import other .asp files
    ```ASP
    <-- #include file="relative\filename.asp" -->
    <-- #include virtual="\absolute\filename.asp" -->
    ```
3. Parsing JSON body
    ```ASP
    <!-- #include file="utils\json.asp" -->
    <%
        var body = BindJSONBodyToObject(Request)
    %>
    ```
4. Parsing QueryString to JS Object
    ```ASP
    var queries = BindQueryToObject(req)
    ```
5. RestWrapper - [Sample Router](./RootHandler.asp)
    - Default Error handling
    - Auto JSON Serialization/Deserialization
    - Parsing Body, Query

    ```ASP
    <!-- #include virtual="\rest\rest.asp" -->
    var handler = function (req,res) {
        var queries = BindQueryToObject(req)

        if(!queries){
            // queries not exists or empty

            throw new HttpError("Missing query", 400)
        } else {
            var responseObj = {
                content: "Rest API server"
            }

            return responseObj
        }
    }
    RestWrapper(Request,Response, handler)
    ```

## References
- [JSON2JS - Customized](https://gist.github.com/atheken/654510)
- [Body2JS](https://stackoverflow.com/a/15818268/12532459)
- [ASPJSON](https://www.aspjson.com/) - Used in case we want to read/write json using VBScript
