<cfscript>
component extends="org.lucee.cfml.test.LuceeTestCase"	{
	
	
	variables.updateProvider = server.getTestService("updateProvider");
	
	//public function afterTests(){}
	
	public function setUp(){}

	public function testName() {
		cfexecute(name="curl #variables.updateProvider#/rest/update/provider/echoGet" ,variable="local.x");
		assertTrue(find('"session"',x)>0);
	}

	public function testNameStringArg() {
		cfexecute(name="curl", arguments="#variables.updateProvider#/rest/update/provider/echoGet" ,variable="variables.x");
		assertTrue(find('"session"',x)>0);
	}
	
	public function testNameStringArrayArg() {
		cfexecute(name="curl", arguments=["#variables.updateProvider#/rest/update/provider/echoGet"] ,variable="variables.x");
		assertTrue(find('"session"',x)>0);
	}
	
	public function testDirectoryArg() {
		cfexecute(name="curl", arguments=["#variables.updateProvider#/rest/update/provider/echoGet"] ,variable="variables.x", directory=getTempDirectory());
		assertTrue(find('"session"',x)>0);
	}

	public function testDirectoryTagClosed() {
		```
		<cfexecute name="curl" arguments="#variables.updateProvider#/rest/update/provider/echoGet" variable="variables.x" directory=#getTempDirectory()#></cfexecute>
		```
		assertTrue(find('"session"',x)>0);
	}

	public function testDirectoryTagWithoutClosingTag() {
		```
		<cfexecute name="curl" arguments="#variables.updateProvider#/rest/update/provider/echoGet" variable="variables.x" directory=#getTempDirectory()#/>
		```
		assertTrue(find('"session"',x)>0);
	}
	
	public function testTimeout() {
		try {
			cfexecute(name="curl", timeout="0.1", arguments="#variables.updateProvider#/rest/update/provider/echoGet" ,variable="variables.x");
		}
		catch(e) {
			expect(e.message).toInclude('expired', e.message); // this fails sometimes on CI
		}
	}

} 
</cfscript>
