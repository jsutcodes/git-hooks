<#
   This script ensures the following git commit standards: 
   1. Seperate subject from body with a blank line
   2. Limit the subject line to 50 characters
   3. Capitalize the subject line [automatically do this]
   4. Do not end the subject line with a period [automatically do this (strip it)]
   5. Use the imperative mood in the subject line [ensure uses the imperative mood]
       a) refactor
       b) update
       c) remove
       d) release
       e) merge
   6. Wrap the body at 72 characters???
   7. The body is used to explain what and why vs. how 
   
   A properly formed Git commit subject should always be able to complete the following sentence:
   "If Applied, this commit will <imperative_word> <what_it_does>"
  
  ex: If Applied, this commit will refactor subsystem X for readability
      If Applied, this commit will update getting started documentation
      If Applied, this commit will remove deprocated methods
#>



message_file = $args[0]
#message = File.read(message_file) # not sure if this is needed 
$regex = (refactor|update|remove|release|merge)\s*(\w|\s)* # t his works for now
if message_file -match $regex
 exit 0 
else
  Write-Output "[POLICY] Your message is not formatted correctly"
  Write-Output "[STANDARD] Your message should be in the format: ‘feat(module): commit message’ "
  exit 1

