<cfscript>

//system internal information leak
<cfscript>
    try { 
        obj = CreateObject("person"); 
    } 
    catch(any excpt) { 
        f = FileOpen("c:\log.txt", "write"); 
        FileWriteLine(f, "#excpt.Message#");
        FileClose(f);
    }
</cfscript>


//cflocation validation
<cflocation url="random.cfm">

//cflocation validation
<cfset  addtoken1 = "true">
      <cflocation url="random.cfm" addtoken="#addtoken1#">

//csrf
<cfset var2 = CSRFGenerateToken2("make-admin")>
            <cfform method="POST"  action='/csrf/dummy.cfm'>

            <cfinput type="hidden" name="token" value="#var2#" />

            <cfinput type="submit" value="Make Administrator" />

            </cfform>

//csrf
<cfform method="POST">
   <cfinput type="submit" value="Make Administrator"/></cfform>

//csrf
<cfform method="POST">
<cfinput type="hidden" name="token" value="#CSRFGenerateToken()#" /> 
<cfinput type="submit" value="Make Administrator" />
</cfform>

//system external information leak
<cfcatch type="Any">
  <cfset exception=getException(myObj)>
  <cfset message=exception.toString()>
  <cfoutput>
    Exception message: #message#
  </cfoutput> 
</cfcatch>

//pdf xss attack
<cfhtmltopdf>
<h1>Hello <cfoutput>#pf2#</cfoutput></h1>
</cfhtmltopdf>

//pdf xss attack
<cfhtmltopdf>
 <h1>Hello <cfoutput>#url.name#</cfoutput></h1>
</cfhtmltopdf>

//pdf xss attack
<cfdocument format="PDF">
            <cfoutput>   #hello#

            </cfoutput>

            <cfdocumentitem type="header" >

            <cfoutput>#abc#</cfoutput>     

            </cfdocumentitem>

      </cfdocument>

//xss
<cfoutput>Hello #url.name#</cfoutput>

//xss
<cfparam name = "id12" default = "my default value" type="string">

//xss
<cfoutput > <b>LINK to URL:</b> <a target="_blank" href="http://#url#">#url#</a> </cfoutput>

//sql injection
<cfset result = QueryExecute("select * from Employees where empid=#id5#")>

//sql injection
<cfset v3="#form.vf#"><cfset employees = ORMExecuteQuery("from Employee where name=#v3#")>

//sql injection
<cfquery name="matchingItems" datasource="cfsnippets">
    SELECT * FROM items 
     WHERE owner='#Form.userName#'   
       AND itemId=#Form.ID#
</cfquery>

//sql injection
<cfquery name="SelectExample"
                datasource="cfdocexamples">

         select FROM Employee

         WHERE Emp_ID=#var#

      </cfquery>


//setting manipulation
<cfset code = SetProfileString(IniPath, 
              Section, "timeout", Form.newTimeout)>


//resource injection
<cfobject action="create" type="java" class="java.net.ServerSocket" name="myObj">
<cfset srvr = myObj.init(#url.port#)>
<cfset socket = srvr.accept()>


//privacy violation
<cflog file="app_log" application="No" Thread="No" 
     text="#Session.uname#:#Session.pword#:#type#:#Now()#">


//possible variable overwrite
<cfset first = "User">
<cfscript>
SetVariable(url.varName, url.varValue);
</cfscript>
<cfoutput>
#first#
</cfoutput>

//path manipulation
<cffile action = "delete"
       file = "C:\\users\\reports\\#Form.reportName#">


//logforging
<cflog file="app_log" application="No" Thread="No" 
       text="Failed to parse val="#Form.val#">


//insecure random
<cfoutput>
Receipt: #baseUrl##Rand()#.cfm
</cfoutput>

//Header Manipulation: Cookies
//Header Manipulation
<cfcookie name = "author"
  value = "#Form.author#"
  expires = "NOW">  


//Cross-Site Scripting: Reflected
//Sending unvalidated data to a web browser can result in the browser executing malicious code.
<cfoutput>
Employee ID: #Form.eid#
</cfoutput>


//ctsec-command injection
<cfset var="#url.cmd#">
<cfexecute name = "C:\windows\System32\cmd.exe"
    arguments = "/c #var#"
    timeout = "1"
    variable="mycmd">
</cfexecute>


//Leftover Debug Code
//The <cfdump> tag can leak sensitive information in a deployed web application.
<cfdump var="">

//ColdFusion Bad Practices: Unauthorized Include
//Allowing unvalidated user input to specify the path of a file included in the page can allow attackers to inject malicious code or view sensitive files on the server.
<cfinclude template =  
              "C:\\custom\\templates\\#Form.username#.cfm">

//Credential Management
//Storing a username in plain text could result in a system compromise.
<cfquery name = "GetCredentials" dataSource = "master">
SELECT   Username, Password
FROM     Credentials
WHERE    DataSource="users"
</cfquery>
<cfquery name = "GetSSNs" dataSource = "users"
 username = "#Username#" password = "#Password#">
SELECT   SSN
FROM     Users
</cfquery>

//Cross-Site Scripting: Persistent
//Sending unvalidated data to a web browser can result in the browser executing malicious code.
<cfquery name="matchingEmployees" datasource="cfsnippets">
  SELECT name
  FROM Employees 
  WHERE eid = '#Form.eid#'
</cfquery>
</cfscript>

//Cross-Site Scripting: Poor Validation
//Relying on HTML, XML, and other types of encoding to validate user input can result in the browser executing malicious code.
"<script>alert('<CFOUTPUT>HTMLCodeFormat(#Form.text#)</CFOUTPUT>')</script>";

//denial of service
Sleep(url.duration);

//xpath injection
query = "/accounts/account[acctID='" & url.acctID & "']/email/text()";
selectedElements = XmlSearch(myxmldoc, query);
