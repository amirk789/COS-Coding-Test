/// Custom Ensemble Business Process for finding the longest palindrome
Class src.Hosts.PalindromeProcess Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
	Set tSC = $$$OK
	Try {
		
		Set (Content,Inc) = ""
		While 'pRequest.AtEnd {
			Set Data = pRequest.ReadLine()
			Set LineCnt = $Increment(LineCnt)
			Set Line = $ListFromString(Data)
			For i=1:1:$ListLength(Line) {
				Set Str = $List(Line,i)
				Set Result = ..CheckPalindrome(Str)
				If $List(Result,1)'="" {
					Set ^ZRESULT(Str) = Result
					Set $Piece(Content,",",$Increment(Inc)) = Str_"|"_$List(Result,1)
				}
			}
		}
		Set FileReq = ##class(Ens.StringRequest).%New()
		Set FileReq.StringValue = Content
		Set tSC = ..SendRequestAsync("PalindromeOperation",FileReq,0)
	}
	Catch Ex {
		Set tSC = Ex.AsStatus()
	}
	return tSC
}

ClassMethod IsPalindrome(Str As %String) As %Boolean
{
	Set Str = $ZConvert(Str,"U")  
	Set RS = ""
	For i=$Length(Str):-1:1 {
		Set $Extract(RS,$Increment(Cnt)) = $Extract(Str,i)
	}
	If RS=Str Return 1
	Return 0
}

ClassMethod CheckPalindrome(Line As %String) As %List
{
	Set Start = 1
	For i=1:1:$Length(Line) {
		Set Cnt=i
		While 1 {
			Set Str = $Extract(Line,Start,Start+Cnt)	
			Quit:$Length(Str)<(Cnt+1)					
			Write !,Start,"  ->",Cnt," -> ",Str
			If ..IsPalindrome(Str) {
				Set Data($Length(Str)) = Str
			}
			Set Start = Start+1
		}
		Set Start = 1
	}
	Set Len = $Order(Data(""),-1,Val)
	Return $ListBuild($Get(Val),Len)
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
