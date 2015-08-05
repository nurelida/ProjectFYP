function search()
{
    var f=document.search;
    
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServSearch?Option=Search";
    f.submit();
}

function searchPgNum(pgNum)
{
    var f=document.forms[0];
    
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServSearch";
    f.submit();
}

function viewTitle(value)
{
    var f = document.search;
       
        f.metricNo.value=value;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServSearch?Option=viewTitle";
        f.submit();
   
}