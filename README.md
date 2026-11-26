# remote-day access bundle

**Access window: Thu 26 Nov 2026, 13:00 – 16:00 IST.** Logins are refused outside that window, and afterwards this bundle is removed.

`day_key` is an encrypted SSH key. It is useless without its passphrase (not stored here) and stops working at the end of the window.

## On the Windows PC (no installs needed)

1. **Code → Download ZIP**, then extract it (right-click → Extract All).
2. Open **Windows Terminal** or **PowerShell** in the extracted folder and run: `.\connect.cmd`
3. Enter the passphrase. You land in a tmux session on the Mac: `cd ~/code/<project>` then `claude`.
   Detach with **Ctrl+b, d**. Reconnect by running `connect.cmd` again.
4. When finished: in the session run `remote-day off`, then delete the ZIP and the folder, empty the Recycle Bin and sign out.

Connection: `tom@bore.pub`, port `59301`, host key `SHA256:MXRFk7O8VNo81e6E2tGeczchhJJ4NZVYtA6fpG3r5lU`.
