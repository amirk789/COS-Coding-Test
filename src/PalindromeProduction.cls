// Ensemble Production that reads input, finds the longest palidromes, and outputs the results
// Should contain instances of each of the Palidrome business hosts (Service, Process, Operation)
/// Do ##class(Ens.Director).StartProduction("src.PalindromeProduction")
/// Do ##class(Ens.Director).StopProduction()
Class src.PalindromeProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="src.PalindromeProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="PalindromeService" Category="" ClassName="src.Hosts.PalindromeService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="ArchivePath">C:\ObjScriptCode\COS-Coding-Test\Archive\</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\ObjScriptCode\COS-Coding-Test\Inbound\</Setting>
  </Item>
  <Item Name="PalindromeProcess" Category="" ClassName="src.Hosts.PalindromeProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="PalindromeOperation" Category="" ClassName="src.Hosts.PalindromeOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\ObjScriptCode\COS-Coding-Test\Outbound\</Setting>
  </Item>
 </Production>
}

}
