/// Custom Ensemble Business Service for reading the input for the Longest Palindrome problem
Class src.Hosts.PalindromeService Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Property Adapter As EnsLib.File.InboundAdapter;

Method FilePathSet(path As %String) As %Status
{
	set i%FilePath = "C:\ObjScriptCode\COS-Coding-Test\Inbound\"
	Return $$$OK
}

Method OnProcessInput(pInput As %Stream.Object, Output pOutput As %RegisteredObject) As %Status
{
	Set ^ZZTEST($Now()) = pInput
	Set tSC = $$$OK
	Try {
		Set tSC = ..SendRequestAsync("PalindromeProcess",.pInput)
	}
	Catch Ex {
		Set tSC = Ex.AsStatus()
	}
	return tSC
}

}
