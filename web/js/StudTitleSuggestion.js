function disabledtinymce(){
   
        tinyMCE.get('bgproblem').getBody().setAttribute('contenteditable', false);
        tinyMCE.get('objective').getBody().setAttribute('contenteditable', false);
        tinyMCE.get('scope').getBody().setAttribute('contenteditable', false);
        tinyMCE.get('software').getBody().setAttribute('contenteditable', false);
        tinyMCE.get('hardware').getBody().setAttribute('contenteditable', false);
        tinyMCE.get('technique').getBody().setAttribute('contenteditable', false);
   
}
function submitTitle()
{
   
   
   var f = document.frm_titleSuggestion;
    var proTitle = f.proTitle.value;
    var bgProblem = f.bgProblem.value;
    var objective = f.objective.value;
    var scope = f.scope.value;
    var proTypeValue = "";
    var proField = f.proField.value;    
    var software = f.software.value;
    var hardware = f.hardware.value;  
    var technique = f.technique.value;
    bgProblem=tinyMCE.get('bgproblem').getContent();
    objective=tinyMCE.get('objective').getContent();
    scope=tinyMCE.get('scope').getContent();
    software=tinyMCE.get('software').getContent();
    hardware=tinyMCE.get('hardware').getContent();
    technique=tinyMCE.get('technique').getContent();
    alert(bgProblem);
    for (var i=0; i < f.projectType.length; i++)
        {
          if (f.projectType[i].checked)
           {
               proTypeValue=f.projectType[i].value;
            }
        }
    
    if(proTitle.trim().length == 0)
        {
            alert("Project title cannot be blanked.");
            
            return;
        }
    if(bgProblem.trim().length==0)
        {
            alert("Background of problem cannot be blanked.");
            
            return;
        }
    if(objective.trim().length == 0)
        {
           alert("Objective of project cannot be blanked.");
           //document.getElementById("objective").focus();
           return;
        }
    if(scope.trim().length == 0)
        {
            alert("Scope of project cannot be blanked.");
            
            return;
        }
     if(proField.trim().length == 0)
         {
             alert("Project field must be select.");
            
            return;
         }
     if(software.trim().length == 0 )
         {
             
             alert("Software specification cannot be blanked.");
             
             return;
         }
      
      if(hardware.trim().length == 0)
          {
              alert("Hardware cannot be blanked.");
             
              return;
          }
      if(technique.trim().length == 0)
          {
              alert("Technique / Alogorithm / Technology cannot be blanked.");
              
              return;
          }
  

      
      f.method = "POST";
      f.target = "_self";
      f.action = "./ServStudTitleSuggestion?Option=Submit";
      f.submit();
   
   
    
}

function svChgTitle()
{
    var f = document.frm_titleSuggestion;
    var proTitle = f.proTitle.value;
    var bgProblem = f.bgProblem.value;
    var objective = f.objective.value;
    var scope = f.scope.value;
    var proTypeValue = "";
    var proField = f.proField.value;    
    var software = f.software.value;
    var hardware = f.hardware.value;  
    var technique = f.technique.value;
    bgProblem=tinyMCE.get('bgproblem').getContent();
    objective=tinyMCE.get('objective').getContent();
    scope=tinyMCE.get('scope').getContent();
    software=tinyMCE.get('software').getContent();
    hardware=tinyMCE.get('hardware').getContent();
    technique=tinyMCE.get('technique').getContent();
    alert(bgProblem);
    for (var i=0; i < f.projectType.length; i++)
        {
          if (f.projectType[i].checked)
           {
               proTypeValue=f.projectType[i].value;
            }
        }
    
    if(proTitle.trim().length == 0)
        {
            alert("Project title cannot be blanked.");
            
            return;
        }
    if(bgProblem.trim().length==0)
        {
            alert("Background of problem cannot be blanked.");
            
            return;
        }
    if(objective.trim().length == 0)
        {
           alert("Objective of project cannot be blanked.");
           //document.getElementById("objective").focus();
           return;
        }
    if(scope.trim().length == 0)
        {
            alert("Scope of project cannot be blanked.");
            
            return;
        }
     if(proField.trim().length == 0)
         {
             alert("Project field must be select.");
            
            return;
         }
     if(software.trim().length == 0 )
         {
             
             alert("Software specification cannot be blanked.");
             
             return;
         }
      
      if(hardware.trim().length == 0)
          {
              alert("Hardware cannot be blanked.");
             
              return;
          }
      if(technique.trim().length == 0)
          {
              alert("Technique / Alogorithm / Technology cannot be blanked.");
              
              return;
          }
    
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServStudTitleSuggestion?Option=Edit";
    f.submit();
   
}

function editTitle()
{   
      var f = document.frm_titleSuggestion;
     
    f.proTitle.readOnly = false;
    f.bgProblem.readOnly = false;
    f.objective.readOnly = false;
    f.scope.readOnly = false;
    f.proField.disabled = false;
    f.projectType.disabled = false;
    f.software.readOnly = false;
    f.hardware.readOnly = false;
    f.technique.readOnly = false;
    document.getElementById("savediv").classList.remove("hide");
    document.getElementById("savediv").classList.add("show");
   
    
    
     for (var i=0; i < f.projectType.length; i++)
        {
            f.projectType[i].disabled = false;
        }
    
  
    
   
   
}

function applyAgain()
{
    var f = document.frm_titleSuggestion;
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServStudTitleSuggestion?Option=applyAgain";
    f.submit();
}