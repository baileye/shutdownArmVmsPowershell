$AzureResourceGroup = '<RG name>'

#ARM VMs 
Write-Output "ARM VMs:"; 
Get-AzureRmVM -ResourceGroupName $AzureResourceGroup | ForEach-Object { 
  if($Shutdown -eq $true){ 
    Write-Output "Stopping '$($_.Name)' ..."; 
    Stop-AzureRmVM -ResourceGroupName $AzureResourceGroup -Name $_.Name -Force; 
  } else { 
    Write-Output "Starting '$($_.Name)' ...";             
    Start-AzureRmVM -ResourceGroupName $AzureResourceGroup -Name $_.Name;             
  }             
};
