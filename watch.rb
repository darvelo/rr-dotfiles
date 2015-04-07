#!/bin/ruby
require 'date'
require 'json'
require 'shellwords'

if ARGV.length < 1
  STDERR.puts('Usage: ' + __FILE__ + ' PATH')
  exit(1)
end

remote_log_path = '/srv/www/tmp.sakuya.pl/public_html/mal/watched.lst'
remote_host = 'burza'
local_host = `hostname`.strip!
video_path = File.realpath(ARGV[0])
json = {
  time: Time.now.to_datetime.rfc3339,
  path: video_path,
  host: local_host
}.to_json

ssh_command = format('echo %s >> %s',
  Shellwords.escape(json),
  Shellwords.escape(remote_log_path))

Dir.chdir(Dir.home)
if RUBY_PLATFORM.include?('cygwin')
  `mpv.exe "$(cygpath -w #{Shellwords.escape(video_path)})" --config-dir="$(cygpath -w ~/.mpv)"`
else
  `mpv #{Shellwords.escape(video_path)}`
end
`ssh #{remote_host} #{Shellwords.escape(ssh_command)}`