$(document).on 'turbolinks:load', ->
  moment.locale $('body').data('locale')
  $('time').each ->
    $this = $(this)
    $this.text moment($this.attr('datetime')).fromNow()