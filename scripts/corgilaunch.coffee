# Description:
#   Attempting corgi script
#
# Configuration:
#   HUBOT_INSTAGRAM_CLIENT_ID (http://instagram.com/developer/clients/manage/)
#
# Commands:
#   hubot corgi please - Receive a corgi

# Author:
#   Laura Wynn

INSTAGRAM_API = "https://api.instagram.com/v1"
INSTAGRAM_CLIENT = "client_id=#{process.env.HUBOT_INSTAGRAM_CLIENT_ID}"

module.exports = (robot) ->
  msg.http("https://www.instagram.com/corgi_nation/?hl=en")
    .get() (err, res, body) ->
      msg.send JSON.parse(body).corgi
