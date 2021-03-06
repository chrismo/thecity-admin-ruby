# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

require 'ruby-debug'
require File.dirname(__FILE__) + '/../lib/the_city_admin.rb'

require File.dirname(__FILE__) + '/city_keys.rb'
include CityKeys

TheCity::AdminApi.connect(KEY, TOKEN)


puts "------------------------------------"

webhook_list = TheCity::WebHookList.new
if webhook_list.empty?
  puts "No web hooks in list"
else
  puts "Web hooks: #{webhook_list.count}"
end

webhook = TheCity::WebHook.new
webhook.object = TheCity::WebHook::Objects[:group]
webhook.event = TheCity::WebHook::Events[:create]
webhook.callback_uri = 'https://www.example.com/mycallback_url'

if webhook.save
  puts "Web hook created (#{webhook.id})"
else
  puts "Failed to create web hook: #{webhook.error_messages.join(', ')}"
end

webhook_list2 = TheCity::WebHookList.new
if webhook_list2.empty?
  puts "No web hooks in list"
else
  puts "Web hooks: #{webhook_list2.count}"
end

if webhook.delete 
  puts "Web hook #{webhook.id} deleted"
else
  puts "Unable to delete web hook #{webhook.id}: #{webhook.error_messages.join(', ')}"
end

webhook_list3 = TheCity::WebHookList.new
if webhook_list3.empty?
  puts "No web hooks in list"
else
  puts "Web hooks: #{webhook_list3.count}"
end

puts "####################################"
