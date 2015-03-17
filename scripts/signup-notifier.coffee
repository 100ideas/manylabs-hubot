# Description:
#   let us know when someone has signed up for the mailing list.
#
# Examples:
#   post json {"email":"name@example.com", "source":"manylabs.org mailing list"} to the url
#
# URLs: 
#   manylabs-hubot.heroku.com/hubot/signup-notifier
#  
# Notes:
#
#   Post data as application/json
#     curl -X POST -H "Content-Type: application/json" -d '{"email":"name@example.com", "source":"mailing list name via RAW JSON"}' http://127.0.0.1:8080/hubot/signup-notifier
#
#   Post data as application/x-www-form-urlencoded
#     curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d ''email=name%40example.com&source=mailing+list+name+via+X-WWW-FORM'' http://127.0.0.1:8080/hubot/signup-notifier
#
#   Post data as multipart/form-data
#     curl -X POST -H "Content-Type: multipart/form-data" -F "email=name@example.com" -F "source=manylabs.org mailing list via FORM-DATA" http://127.0.0.1:8080/hubot/signup-notifier

module.exports = (robot) ->
  robot.router.post "/hubot/signup-notifier", (req, res) ->
    #data = req.body.payload ? req.body # POSTed as form-data or application/json?
    data = req.body.payload ? req.body.json ? req.body # POSTed as form-data or application/json?
  
    robot.messageRoom 'general', "Oooo! \<#{data.email}\> just signed up for #{data.source}."
    robot.logger.info data

    res.send 'OK'
