$env.config.show_banner = false

alias c = clear
alias e = exit
alias x = opencode

def cmt [
  msg: string = ""
] {
  let ts = ( ^date '+%Y%m%d%H%M%S' )
  if ($msg == "") {
    jj new -m $ts
  } else {
    jj new -m $"($ts) ($msg)"
  }
}

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

alias z = zellij

source ~/.zoxide.nu
