remote-day key bundle — valid until Thu 26 Nov 2026 16:00 IST

1. Copy this folder anywhere on the Windows PC (or run it from the USB stick).
2. Open Windows Terminal or PowerShell, go to this folder, run:   .\connect.cmd
3. Type the passphrase when ssh asks "Enter passphrase for key".
4. You land in tmux on the Mac. Start Claude Code with:   cd ~/your/project ; claude
   Detach (leave it running): Ctrl+b then d. Reconnect: run connect.cmd again.

Manual command (same thing; run from a folder holding day_key and known_hosts):
  ssh -i day_key -o IdentitiesOnly=yes -o HostKeyAlias=remote-day-mac -o UserKnownHostsFile=known_hosts -o StrictHostKeyChecking=yes -p 59301 -t tom@bore.pub remote-day attach

Do NOT run ssh-add on this PC (Windows' ssh-agent keeps keys in the registry).
When finished: delete this folder (and any copy of it), empty the Recycle Bin.
