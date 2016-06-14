# Description:
#   Attempting corgi script
#
# Commands:
#   hubot corgi please - Receive a corgi

# Author:
#   Laura Wynn

images = require './data/images.json'
jargon = require './data/triggers.json'

removeTerm = (term, arrayToDeleteFrom) ->
  index = arrayToDeleteFrom.indexOf term
  if index > -1
    arrayToDeleteFrom.splice index, 1
    return arrayToDeleteFrom

if process.env.HUBOT_BUSINESS_CAT_JARGON?
  additionalJargon = (process.env.HUBOT_BUSINESS_CAT_JARGON).split(',')
  jargon = jargon.concat(additionalJargon)

if process.env.HUBOT_BUSINESS_CAT_OMITTED_JARGON?
  omittedJargon = (process.env.HUBOT_BUSINESS_CAT_OMITTED_JARGON).split(',')
  jargon = removeTerm(term, jargon) for term in omittedJargon

regex = new RegExp jargon.join('|'), 'gi'

module.exports = (robot) ->
  robot.hear regex, (msg) ->
    msg.send msg.random images
