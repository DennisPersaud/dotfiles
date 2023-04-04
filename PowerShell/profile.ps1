
#        ____             _____ __                 ___
#       / __ \_________  / __(_) /__    ____  ____<  /
#      / /_/ / ___/ __ \/ /_/ / / _ \  / __ \/ ___/ / 
#     / ____/ /  / /_/ / __/ / /  __/ / /_/ (__  ) /  
#    /_/   /_/   \____/_/ /_/_/\___(_) .___/____/_/   
#                                   /_/               
############################################################

#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
(& "C:\Users\dpers\anaconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
#endregion

# IMPORTS
Import-Module _personalfunctions
Import-Module posh-git
Import-Module oh-my-posh
Import-Module -Name Terminal-Icons
Import-Module cd-extras
Import-Module z

# MODULE CONFIGS
Set-PoshPrompt -Theme powerline
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineKeyHandler -Chord "J,K"-ViMode Insert -Function ViCommandMode

# CMDLET ALIASES
Set-Alias -Name lsna -Value Get-NetAdapter
Set-Alias -Name df -Value Get-Volume
Set-Alias -Name ss -Value Select-String
Set-Alias -Name n -Value nvim
Set-Alias -Name c -Value clear
Set-Alias -Name push -Value Push-Location
Set-Alias -Name pop -Value Pop-Location
Set-Alias -Name cb -Value Convert-Book
Set-Alias -Name lg -Value lazygit

# FILE ALIASES
Function CONFIRMMOVE { param ([String]$source, [String]$dest) Move-Item -Confirm $source $dest }
Set-Alias -Name mv -Value CONFIRMMOVE
Function CONFIRMREMOVE { param ([String]$source) Remove-Item -Confirm $source }
Set-Alias -Name rm -Value CONFIRMREMOVE
# Function CONFIRMRECREMOVE { param ([String]$source) Remove-Item -Recurse -Confirm $source }
Function CONFIRMRECREMOVE { param ([String]$source) ls -Recurse $source | % { rm $_.FullName } }
Set-Alias -Name rmr -Value CONFIRMRECREMOVE
Function EXPLORECURDIR { ii . }
Set-Alias -Name e -Value EXPLORECURDIR
Function INVOKEREQUEST { param ([String]$uri) (Invoke-WebRequest "$uri") }
Set-Alias -Name ir -Value INVOKEREQUEST
Function INVOKEREQUESTCONT { param ([String]$uri) (Invoke-WebRequest "$uri").Content }
Set-Alias -Name irc -Value INVOKEREQUESTCONT
Function Get-PubIP { (Invoke-WebRequest http://ifconfig.me/ip).Content }
Set-Alias -Name pubip -Value Get-PubIP
Function STREAMEDIT { param ([String]$file, [String]$exp, [String]$rep) Get-Content $file | % { $_ -Replace "$exp", "$rep" } }
Set-Alias -Name sed -Value STREAMEDIT
Function SEARCHPATTERN { param ([String]$search) Get-ChildItem | Select-String -Pattern "$search" | Select-Object -Unique Filename }
Set-Alias -Name grep -Value SEARCHPATTERN
Function SEARCHPATTERNREC { param ([String]$search) Get-ChildItem -Recurse | Select-String -Pattern "$search" | Select-Object -Unique Filename }
Set-Alias -Name grepr -Value SEARCHPATTERNREC
Function Convert-TitleCase { ls | % { Rename-Item $_.Name -NewName ((Get-Culture).TextInfo.ToTitleCase($_.BaseName.Replace("-", " ")) + $_.Extension.toLower()) } }
Set-Alias -Name ctc -Value Convert-TitleCase

# DIRECTORY ALIASES
Function LISTHIDDEN { Get-ChildItem -Hidden }
Set-Alias -Name la -Value LISTHIDDEN
Function LISTFILTER { param ([String]$search) Get-ChildItem -Filter *$search* }
Set-Alias -Name lf -Value LISTFILTER
Function LISTDIR { Get-ChildItem -directory}
Set-Alias -Name ld -Value LISTDIR
Function SORTSIZE { Get-ChildItem | Sort-Object -Descending "Length" }
Set-Alias -Name lss -Value SORTSIZE
Function SORTLASTWRITE { Get-ChildItem | Sort-Object -Descending "LastWriteTime" }
Set-Alias -Name lw -Value SORTLASTWRITE
Function SORTSIZEFILTER { param ([String]$search) Get-ChildItem -Filter *$search* | Sort-Object -Descending "Length" }
Set-Alias -Name ldf -Value SORTSIZEFILTER
Function LISTFILTERRECURSE { param ([String]$search) Get-ChildItem -Recurse -Filter *$search* }
Set-Alias -Name lfr -Value LISTFILTERRECURSE
Function LISTFILTERMOVE { param ([String]$search, [String]$location) Get-ChildItem -Filter *$search* | Move-Item -Destination $location }
Set-Alias -Name lfm -Value LISTFILTERMOVE
Function LISTFILTERMOVERECURSE { param ([String]$search, [String]$location) Get-ChildItem -Recurse -Filter *$search* | Move-Item -Destination $location }
Set-Alias -Name lfmr -Value LISTFILTERMOVERECURSE
Function COUNT{ Get-ChildItem -Recurse | Measure-Object }
Set-Alias -Name cnt  -Value COUNT
Function LISTAPPS { Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Select-Object -Property DisplayName | Sort-Object -Property DisplayName}
Set-Alias -Name list-apps -Value LISTAPPS

# SPECIAL C DIRECTORY ALIASES
Function HOME { Set-Location "~\" }
Set-Alias -Name hm -Value HOME
Function PROGRAMS { Set-Location "C:\Program Files" }
Set-Alias -Name pg -Value PROGRAMS
Function PROGRAMS32 { Set-Location "C:\Program Files (x86)" }
Set-Alias -Name pg32 -Value PROGRAMS32
Function DOCUMENTS { Set-Location "~\Documents" }
Set-Alias -Name doc -Value DOCUMENTS
Function DESK { Set-Location "~\Desktop" }
Set-Alias -Name dk -Value DESK

# SPECIAL F DIRECTORY ALIASES
Function BOOK { Set-Location "F:\Stuff\Books" }
Set-Alias -Name bk -Value BOOK
Function OVERWRITE { Set-Location "F:\Games\Skyrim\ModOrganizer\Overwrite" }
Set-Alias -Name ovw -Value OVERWRITE
Function MODS { Set-Location "F:\Games\Skyrim\ModOrganizer\mods" }
Set-Alias -Name mod -Value MODS
Function SKYHOME { Set-Location "F:\Games\Skyrim\The Elder Scrolls V Skyrim\" }
Set-Alias -Name sky -Value SKYHOME
Function CLOUDHOME { Set-Location "F:\Stuff\Books\Computer Science\Computer Applications\Cloud Architect" }
Set-Alias -Name clod -Value CLOUDHOME
Function DATAHOME { Set-Location "F:\Stuff\Books\Computer Science\Computer Applications\Data Engineer" }
Set-Alias -Name dat -Value DATAHOME
Function DEVOPSHOME { Set-Location "F:\Stuff\Books\Computer Science\Computer Applications\DevOps Engineer" }
Set-Alias -Name devop -Value DEVOPSHOME
Function SECHOME { Set-Location "F:\Stuff\Books\Computer Science\Computer Applications\Security Engineer" }
Set-Alias -Name sec -Value SECHOME
Function SOFTHOME { Set-Location "F:\Stuff\Books\Computer Science\Computer Applications\Software Engineer" }
Set-Alias -Name soft -Value SOFTHOME
Function WEBHOME { Set-Location "F:\Stuff\Books\Computer Science\Computer Applications\Software Engineer\Web Master" }
Set-Alias -Name web -Value WEBHOME
Function GAMEHOME { Set-Location "F:\Stuff\Books\Computer Science\Computer Applications\Software Engineer\Game Developer" }
Set-Alias -Name game -Value GAMEHOME
Function INTERVIEWHOME { Set-Location "F:\Stuff\Books\Computer Science\Computer Applications\Software Engineer\Interviews" }
Set-Alias -Name inter -Value INTERVIEWHOME
Function SURVIVAL{ Set-Location "F:\Stuff\Books\Random\Survival" }
Set-Alias -Name surv -Value SURVIVAL

# SPECIAL D DIRECTORY ALIASES
Function MUSIC { Set-Location "D:\Music" }
Set-Alias -Name mus -Value MUSIC
Function PICTURES { Set-Location "D:\Pictures" }
Set-Alias -Name pic -Value PICTURES

# PROCESS & SERVICE ALIASES
Function PSCPUGT100 { ps | where CPU -GT 200 | sort -Descending CPU }
Set-Alias -Name psg -Value PSCPUGT100
Function PSWS { ps | where WS -GT 200000000 | sort -Descending WS }
Set-Alias -Name pw  -Value PSWS
Function RUNNINGSERVICES { Get-Service | where status -eq "Running" | sort DisplayName }
Set-Alias -Name rs -Value RUNNINGSERVICES

# PERFORMANCE ALIASES
Function CPUUTIL { param ([String]$ps_name, [String] $ps_prop) Get-Process $ps_name | Measure-Object -Property $ps_prop -AllStats }
Set-Alias -Name pss -Value CPUUTIL

# LIST INSTALLED APPS
Function LISTINSTALLEDAPPS { Get-CimInstance -Class Win32_Product | Format-List -Property Name, InstallLocation }
Set-Alias -Name lia -Value LISTINSTALLEDAPPS

# VLC ALIASES
Function PLAYVIDEO { param ([Int]$index) lw | select -Index $index | % -Process { vlc $_.name } }
Set-Alias -Name pv -Value PLAYVIDEO

# FFMPEG ALIASES
Function date_time() { return (Get-Date -UFormat "%Y.%m.%d_%I.%M.%S.%p").toString() }
Set-Alias -Name gd -Value date_time
Function CUTVIDEO { param ([String]$start, [String]$end, [String]$file) ffmpeg -ss $start -i $file -to $end -c copy ("Cut-" + (date_time) + ".mp4") }
Set-Alias -Name cv -Value CUTVIDEO

# YOUTUBE-DL ALIASES
Set-Alias -Name ytdl -Value youtube-dl

# CALIBRE ALIASES
# Function CONVERTBOOK { param([String]$type) ls *.$type | % { ebook-convert.exe $_.FullName ($_.BaseName + ".pdf") | rm $_.FullName } }
Function CONVERTBOOK { param([String]$type) ls *.$type | % { ebook-convert.exe $_.FullName ($_.BaseName + ".pdf") } }
Set-Alias -Name Convert-Book -Value CONVERTBOOK
Function RECCONVERTBOOK { param([String]$type) ls -Recurse *.$type | % { ebook-convert.exe $_.FullName ($_.DirectoryName + "\" + $_.BaseName + ".pdf") } }
Set-Alias -Name cbr -Value RECCONVERTBOOK

# MPV ALIASES

# GH ALIASES
Function GHREPOCREATE { param ([String]$reponame) gh repo create $reponame }
Set-Alias -Name ghrc -Value GHREPOCREATE 
Function GHREPOCLONE { param ([String]$reponame) gh repo clone $reponame }
Set-Alias -Name ghrcl -Value GHREPOCLONE
Function GHREPODELETE { param ([String]$reponame) gh repo delete $reponame }
Set-Alias -Name ghrd -Value GHREPODELETE

# GIT ALIASES 
Function GITSTATUS { git status }
Set-Alias -Name gs -Value GITSTATUS
Function GITADD { param ([String]$item) git add $item }
Set-Alias -Name ga -Value GITADD
Function GITCOMMIT { param ([String]$msg)git commit -m $msg }
Set-Alias -Name gmc -Value GITCOMMIT
Function GITPUSH { git push origin master }
Set-Alias -Name gpom -Value GITPUSH
Function GITCLONE { param ([String]$repo)git clone $repo }
Set-Alias -Name gcl -Value GITCLONE

# GLAB ALIASES
# BITBUCKET ALIASES

# PYTHON ALIASES VENV
Function CREATEENV { python -m venv venv; .\venv\scripts\activate }
Set-Alias -Name pyv -Value CREATEENV

# DOCKER ALIASES
Set-Alias -Name d -Value docker
Function DOCKERIMAGES {docker images}
Set-Alias -Name di -Value DOCKERIMAGES
Function DOCKERPULL { param ([String]$image)docker pull $image }
Set-Alias -Name dp -Value DOCKERPULL

# KUBERNETES ALIASES
Set-Alias -Name k -Value kubectl

# AWS ALIASES
# AZURE ALIASES
# GCS ALIASES

# HADOOP ALIASES
# KAFKA ALIASES
# SPARK ALIASES
# HIVE ALIASES

# NETSTAT ALIASES (ports:netstat -ab)
Function LISTPORTS { netstat -ab }
Set-Alias -Name lp -Value LISTPORTS

# NMAP ALIASES
Function NMAPVERBOSE { nmap $args -vvvv }
Set-Alias -Name nmv -Value NMAPVERBOSE

# TSHARK ALIASES
Function TSHARKCOLOR { tshark $args --color }
Set-Alias -Name tsk -Value TSHARKCOLOR

# SHO ALIASES
# JTR ALIASES
# MSPLOT ALIASES

# PDF MODULE ALIASES
# HTML MODULE ALIASES

# ############################################################################################
#region Smart Insert/Delete

# The next four key handlers are designed to make entering matched quotes
# parens, and braces a nicer experience.  I'd like to include functions
# in the module that do this, but this implementation still isn't as smart
# as ReSharper, so I'm just providing it as a sample.

# Set-PSReadLineKeyHandler -Key '"', "'" `
# 	-BriefDescription SmartInsertQuote `
# 	-LongDescription "Insert paired quotes if not already on a quote" `
# 	-ScriptBlock {
# 	param($key, $arg)
# 
# 	$quote = $key.KeyChar
# 
# 	$selectionStart = $null
# 	$selectionLength = $null
# 	[Microsoft.PowerShell.PSConsoleReadLine]::GetSelectionState([ref]$selectionStart, [ref]$selectionLength)
# 
# 	$line = $null
# 	$cursor = $null
# 	[Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
# 
# 	# If text is selected, just quote it without any smarts
# 	if ($selectionStart -ne -1) {
# 		[Microsoft.PowerShell.PSConsoleReadLine]::Replace($selectionStart, $selectionLength, $quote + $line.SubString($selectionStart, $selectionLength) + $quote)
# 		[Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($selectionStart + $selectionLength + 2)
# 		return
# 	}
# 
# 	$ast = $null
# 	$tokens = $null
# 	$parseErrors = $null
# 	[Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$ast, [ref]$tokens, [ref]$parseErrors, [ref]$null)
# 
# 	function FindToken {
# 		param($tokens, $cursor)
# 
# 		foreach ($token in $tokens) {
# 			if ($cursor -lt $token.Extent.StartOffset) { continue }
# 			if ($cursor -lt $token.Extent.EndOffset) {
# 				$result = $token
# 				$token = $token -as [StringExpandableToken]
# 				if ($token) {
# 					$nested = FindToken $token.NestedTokens $cursor
# 					if ($nested) { $result = $nested }
# 				}
# 
# 				return $result
# 			}
# 		}
# 		return $null
# 	}
# 
# 	$token = FindToken $tokens $cursor
# 
# 	# If we're on or inside a **quoted** string token (so not generic), we need to be smarter
# 	if ($token -is [StringToken] -and $token.Kind -ne [TokenKind]::Generic) {
# 		# If we're at the start of the string, assume we're inserting a new string
# 		if ($token.Extent.StartOffset -eq $cursor) {
# 			[Microsoft.PowerShell.PSConsoleReadLine]::Insert("$quote$quote ")
# 			[Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
# 			return
# 		}
# 
# 		# If we're at the end of the string, move over the closing quote if present.
# 		if ($token.Extent.EndOffset -eq ($cursor + 1) -and $line[$cursor] -eq $quote) {
# 			[Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
# 			return
# 		}
# 	}
# 
# 	if ($null -eq $token -or
# 		$token.Kind -eq [TokenKind]::RParen -or $token.Kind -eq [TokenKind]::RCurly -or $token.Kind -eq [TokenKind]::RBracket) {
# 		if ($line[0..$cursor].Where{ $_ -eq $quote }.Count % 2 -eq 1) {
# 			# Odd number of quotes before the cursor, insert a single quote
# 			[Microsoft.PowerShell.PSConsoleReadLine]::Insert($quote)
# 		}
# 		else {
# 			# Insert matching quotes, move cursor to be in between the quotes
# 			[Microsoft.PowerShell.PSConsoleReadLine]::Insert("$quote$quote")
# 			[Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
# 		}
# 		return
# 	}
# 
# 	# If cursor is at the start of a token, enclose it in quotes.
# 	if ($token.Extent.StartOffset -eq $cursor) {
# 		if ($token.Kind -eq [TokenKind]::Generic -or $token.Kind -eq [TokenKind]::Identifier -or 
# 			$token.Kind -eq [TokenKind]::Variable -or $token.TokenFlags.hasFlag([TokenFlags]::Keyword)) {
# 			$end = $token.Extent.EndOffset
# 			$len = $end - $cursor
# 			[Microsoft.PowerShell.PSConsoleReadLine]::Replace($cursor, $len, $quote + $line.SubString($cursor, $len) + $quote)
# 			[Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($end + 2)
# 			return
# 		}
# 	}
# 
# 	# We failed to be smart, so just insert a single quote
# 	[Microsoft.PowerShell.PSConsoleReadLine]::Insert($quote)
# }

Set-PSReadLineKeyHandler -Key '(', '{', '[' `
	-BriefDescription InsertPairedBraces `
	-LongDescription "Insert matching braces" `
	-ScriptBlock {
	param($key, $arg)

	$closeChar = switch ($key.KeyChar) {
		<#case#> '(' { [char]')'; break }
		<#case#> '{' { [char]'}'; break }
		<#case#> '[' { [char]']'; break }
	}

	$selectionStart = $null
	$selectionLength = $null
	[Microsoft.PowerShell.PSConsoleReadLine]::GetSelectionState([ref]$selectionStart, [ref]$selectionLength)

	$line = $null
	$cursor = $null
	[Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    
	if ($selectionStart -ne -1) {
		# Text is selected, wrap it in brackets
		[Microsoft.PowerShell.PSConsoleReadLine]::Replace($selectionStart, $selectionLength, $key.KeyChar + $line.SubString($selectionStart, $selectionLength) + $closeChar)
		[Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($selectionStart + $selectionLength + 2)
	}
 else {
		# No text is selected, insert a pair
		[Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)$closeChar")
		[Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
	}
}

Set-PSReadLineKeyHandler -Key ')', ']', '}' `
	-BriefDescription SmartCloseBraces `
	-LongDescription "Insert closing brace or skip" `
	-ScriptBlock {
	param($key, $arg)

	$line = $null
	$cursor = $null
	[Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

	if ($line[$cursor] -eq $key.KeyChar) {
		[Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
	}
	else {
		[Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)")
	}
}

Set-PSReadLineKeyHandler -Key Backspace `
	-BriefDescription SmartBackspace `
	-LongDescription "Delete previous character or matching quotes/parens/braces" `
	-ScriptBlock {
	param($key, $arg)

	$line = $null
	$cursor = $null
	[Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

	if ($cursor -gt 0) {
		$toMatch = $null
		if ($cursor -lt $line.Length) {
			switch ($line[$cursor]) {
				<#case#> '"' { $toMatch = '"'; break }
				<#case#> "'" { $toMatch = "'"; break }
				<#case#> ')' { $toMatch = '('; break }
				<#case#> ']' { $toMatch = '['; break }
				<#case#> '}' { $toMatch = '{'; break }
			}
		}

		if ($toMatch -ne $null -and $line[$cursor - 1] -eq $toMatch) {
			[Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor - 1, 2)
		}
		else {
			[Microsoft.PowerShell.PSConsoleReadLine]::BackwardDeleteChar($key, $arg)
		}
	}
}

#endregion Smart Insert/Delete
############################################################################################
#
# Ctrl+Shift+j then type a key to mark the current directory.
# Ctrj+j then the same key will change back to that directory without
# needing to type cd and won't change the command line.
#
$global:PSReadLineMarks = @{}

Set-PSReadLineKeyHandler -Key Ctrl+J `
	-BriefDescription MarkDirectory `
	-LongDescription "Mark the current directory" `
	-ScriptBlock {
	param($key, $arg)

	$key = [Console]::ReadKey($true)
	$global:PSReadLineMarks[$key.KeyChar] = $pwd
}

Set-PSReadLineKeyHandler -Key Ctrl+j `
	-BriefDescription JumpDirectory `
	-LongDescription "Goto the marked directory" `
	-ScriptBlock {
	param($key, $arg)

	$key = [Console]::ReadKey()
	$dir = $global:PSReadLineMarks[$key.KeyChar]
	if ($dir) {
		cd $dir
		[Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
	}
}

Set-PSReadLineKeyHandler -Key Alt+j `
	-BriefDescription ShowDirectoryMarks `
	-LongDescription "Show the currently marked directories" `
	-ScriptBlock {
	param($key, $arg)

	$global:PSReadLineMarks.GetEnumerator() | % {
		[PSCustomObject]@{Key = $_.Key; Dir = $_.Value } } |
	Format-Table -AutoSize | Out-Host

	[Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
}

# Auto correct 'git cmt' to 'git commit'
Set-PSReadLineOption -CommandValidationHandler {
	param([CommandAst]$CommandAst)

	switch ($CommandAst.GetCommandName()) {
		'git' {
			$gitCmd = $CommandAst.CommandElements[1].Extent
			switch ($gitCmd.Text) {
				'cmt' {
					[Microsoft.PowerShell.PSConsoleReadLine]::Replace(
						$gitCmd.StartOffset, $gitCmd.EndOffset - $gitCmd.StartOffset, 'commit')
				}
			}
		}
	}
}

# `ForwardChar` accepts the entire suggestion text when the cursor is at the end of the line.
# This custom binding makes `RightArrow` behave similarly - accepting the next word instead of the entire suggestion text.
Set-PSReadLineKeyHandler -Key RightArrow `
	-BriefDescription ForwardCharAndAcceptNextSuggestionWord `
	-LongDescription "Move cursor one character to the right in the current editing line and accept the next word in suggestion when it's at the end of current editing line" `
	-ScriptBlock {
	param($key, $arg)

	$line = $null
	$cursor = $null
	[Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

	if ($cursor -lt $line.Length) {
		[Microsoft.PowerShell.PSConsoleReadLine]::ForwardChar($key, $arg)
	}
 else {
		[Microsoft.PowerShell.PSConsoleReadLine]::AcceptNextSuggestionWord($key, $arg)
	}
}

# This is an example of a macro that you might use to execute a command.
# This will add the command to history.
Set-PSReadLineKeyHandler -Key Ctrl+Shift+b `
	-BriefDescription BuildCurrentDirectory `
	-LongDescription "Build the current directory" `
	-ScriptBlock {
	[Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
	[Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet build")
	[Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadLineKeyHandler -Key Ctrl+Shift+t `
	-BriefDescription BuildCurrentDirectory `
	-LongDescription "Build the current directory" `
	-ScriptBlock {
	[Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
	[Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet test")
	[Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
############################################################################################

