$(document).on 'turbolinks:load', ->
  window.msg = (string) -> "ok! #{string}"
  console.log(msg(Date.now())) if msg