$ ->
  console.debug 'Smoke test'

  dialogue = $('#dialogue')
  form = $('#form-how-many')
  penguinBox = $('#penguins')
  penguin = '<img src="images/penguin.png" alt="pengooo">'

  # Make Penguins
  drawPenguin = ->
    penguinBox.append(penguin)

  clearPenguins = () ->
    penguinBox.html ''

  drawPenguins = (qty) ->
    console.log "START: #{qty} penguins!"
    clearPenguins()
    drawPenguin() for [1..qty] if qty
    console.log "DONE: #{qty} penguins!"

  # Talk to the humans
  say = (text) ->
    dialogue.html(text)

  discuss = (qty) ->
    say "#{qty} means no penguins dummy." if qty == 0
    say "Seriously? Don't be a wuss." if 1 <= qty <= 49
    say "#{qty} penguins? That's chump change." if 50 <= qty <= 149
    say "You terrify me." if qty >= 150
    drawPenguins qty

  # Listen to the humans
  form.submit (event) ->
    event.preventDefault()
    qty = parseInt $('.form-control-qty').val()
    if isNaN(qty)
      say "That's not a number you silly goosey."
    else
      discuss qty

