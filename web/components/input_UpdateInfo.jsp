

<%@page import="utlis.GetParam" %>
<%  String value = (String) GetParam.getClientParams(request, request.getParameter("field"), "");
    if (request.getParameter("field").equals("password")) {
        value = "";
    }
    if (request.getParameter("defaultValue") != null && value.equals("")) {
        value = request.getParameter("defaultValue");
    }
    String error = (String) GetParam.getClientAttribute(request, request.getParameter("field") + "Error", "");
    
    
%>

<label>
    <span>${param.placeholder}</span><br>
    <input name="${param.field}" placeholder=" " id="${param.field}" type="${param.type}" value="${param.value}" class="input">
    
    <h6 style="color: red"> <%= error %></h6>
</label>
