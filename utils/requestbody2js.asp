<%
function BindJSONToObject(req){

    var lngBytesCount = req.TotalBytes
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