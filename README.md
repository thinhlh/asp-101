# Clasic ASP 101

# Assumption
- Basically, ASP is just like HTML but with embedded some scripts using <%>, just like we do with <script/> in HTML

## Programming language
> You can use either VBScript by default or use Javascript

## How to use
1. Specify Scripting Lang
    ```ASP
    <%@ Language= "Javascript" %>
    ```
2. Import other .asp files
    ```ASP
    <-- #include file="relative\filename.asp" -->
    ```
2. Parsing JSON body
    ```ASP
    <!-- #include file="utils\json.asp" -->
    <%
        var body = BindJSONToObject(Request)
    %>
    ```
4. Return JSON body
    ```ASP
    <!-- #include file="utils\json.asp" -->
    Response.Write(JSON.stringify(resp))
    ```

## References
- [JSON2JS - Customized](https://gist.github.com/atheken/654510)
- [Body2JS](https://stackoverflow.com/a/15818268/12532459)
- [ASPJSON](https://www.aspjson.com/) - Used in case we want to read/write json using VBScript
