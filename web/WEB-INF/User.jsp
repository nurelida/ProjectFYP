<%-- 
    Document   : User
    Created on : Feb 6, 2009, 6:52:38 PM
    Author     : rou
--%>

<div id="aTop">Login As</div>
	<div id="aContent" style="text-align:left; padding-left:0px">
            <center>
                
                <table>
                    <tr>
                        <%if (UserType.equals("1"))
                                {%>
                        <td style="font-size:12px">
                            <b class="glyphicon glyphicon-user"></b>&nbsp;<a href="./ServMenu?Page=StudentEditProfile"><%=Name%></a>
                        </td>
                                <%} else if (UserType.equals("2")) {%>
                        <td style="font-size:12px">
                            <b class="glyphicon glyphicon-user"></b>&nbsp; <a href="./ServMenu?Page=LecEditProfile"><%=Name%></a>
                        </td>
                                <%} else {%>
                        <td style="font-size:12px">
                            <%=Name%>
                        </td>
                            <%}%>
                    </tr>
	    	</table>
                
	    </center>   
            
	</div>
