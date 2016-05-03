require 'shellwords'

filename = "data(1).csv"

# this works, but is potentially unsafe
# (we mitigate the risk by escaping singlequotes sometimes, which is probably
# safe but I guess harder to convince a security agency than using shellwords)
system "sh app.sh '#{filename}'"

# this doesn't work because we escape the filename and then put it in quotes, so
# the escape characters \\ are interpreted as literal slashes
system "sh app.sh '#{Shellwords.escape(filename)}'"

# this works and is, I think, the ideal form:
system "sh app.sh #{Shellwords.escape(filename)}"
# I like it because it leverages the ruby standard for escaping

# note that none of them would work if the file had a space in the filename...
