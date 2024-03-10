<!-- #include virtual="\utils\json\js\json2js.asp" -->

<script language="JScript" runat="server">
    function RestWrapper(req, res, handler) {
        try {
            var response = handler(req, res)
            res.Write(JSON.stringify(response))
        } catch (e) {
            var errResponse = {
                message: e.message,
                status: e.status ? e.status : 500
            }
            res.Status = errResponse.status
            res.Write(JSON.stringify(errResponse))
        } finally {
            res.ContentType = "application/json"
            res.End()
        }
    }
</script>