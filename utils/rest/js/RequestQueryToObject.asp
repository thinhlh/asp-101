<script language="JScript" runat="server">
    function BindQueryToObject(req) {
        var queryStr = req.QueryString().item
        var res = {}

        if (queryStr == 0) {
            return undefined
        } else {
            var queries =  queryStr.split("&")

            for (var i=0; i< queries.length ; i++) {
                var pair = queries[i].split("=")
                var key =  pair[0]
                var value =  pair[1]

                res[key] = value
            }   
        }

        return res
    }
</script>