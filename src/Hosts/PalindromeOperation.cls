/// Custom Ensemble Business Operation for outputting the longest palindrome results
Class src.Hosts.PalindromeOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Property Adapter As EnsLib.File.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method WriteFile(pRequest As Ens.StringRequest, Output pResponse As Ens.Response) As %Status
{
	Set tSC = $$$OK
	Try {
		For i=1:1:$Length(pRequest.StringValue,",") {
			Do ..Adapter.PutLine($Translate($ZDateTime($Horolog),"/ :")_".txt",$Piece(pRequest.StringValue,",",i))
		}
	}
	Catch Ex {
		Set tSC = Ex.AsStatus()
	}
	Return tSC
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Ens.Request"> 
		<Method>WriteFile</Method>
	</MapItem>
</MapItems>
}

}
