<%@ Language= "Javascript" %>
<!-- #include virtual="\rest\rest.asp" -->
<%
    var handler = function (req,res) {
        var responseObj = {
            content: "Rest API server"
        }

        return responseObj
    }
    RestWrapper(Request,Response, handler)
%>