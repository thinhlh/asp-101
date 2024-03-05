<!-- #include virtual="\utils\json.asp" -->
<!-- #include file="HttpError.asp" -->
<%
    var Message = {
        EMPTY_BODY: "Body is empty"
    }

    function BindJSONBodyToObject(req) {

        var lngBytesCount = req.TotalBytes

        if (lngBytesCount <= 0) {
            // TODO need to find a way to use throw custom error object here
            throw new HttpError(Message.EMPTY_BODY,400)
        }
        var bytes = req.BinaryRead(lngBytesCount)

        var stream = Server.CreateObject("ADODB.Stream")
        stream.type = 1
        stream.open()
        stream.write(bytes)
        stream.position = 0
        stream.type = 2
        stream.charset = "utf-8"

        var sOut = stream.readtext()
        stream.close()

        return JSON.parse(sOut) 
    }

%>