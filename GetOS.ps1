$HyperVServer = "Your Hyper-V"

Foreach ($VMGuest in get-vm -ComputerName $HyperVServer)
		{
		$NetworkConfig = Get-VMNetworkAdapter -ComputerName $HyperVServer -VMName $VMGuest.Name
		$serverName = $VMGuest.Name
		$IP = $NetworkConfig.ipaddresses | where {$_ -notlike "*:*"}

		if (Test-connection $IP )
			{
			$query = Get-WmiObject -comp $ip -class Win32_OperatingSystem
			$OSver = $query.caption
			Write-Host "$servername IP Address is $ip Running $OSVer"
			}
		}