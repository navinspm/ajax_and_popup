# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(document).bind "ajaxError", "form#new_person", (event, jqxhr, settings, exception) ->
    
    # note: jqxhr.responseJSON undefined, parsing responseText instead
    $(event.data).render_form_errors $.parseJSON(jqxhr.responseText)
    return

  return

(($) ->
  $.fn.modal_success = ->
    
    # close modal
    @modal "hide"
    
    # clear form input elements
    # todo/note: handle textarea, select, etc
    @find("form input[type=\"text\"]").val ""
    
    # clear error state
    @clear_previous_errors()
    return

  $.fn.render_form_errors = (errors) ->
    $form = this
    @clear_previous_errors()
    model = @data("model")
    
    # show error messages in input form-group help-block
    $.each errors, (field, messages) ->
      $input = $("input[name=\"" + model + "[" + field + "]\"]")
      $input.closest(".form-group").addClass("has-error").find(".help-block").html messages.join(" & ")
      return

    return

  $.fn.clear_previous_errors = ->
    $(".form-group.has-error", this).each ->
      $(".help-block", $(this)).html ""
      $(this).removeClass "has-error"
      return

    return

  return
  ) jQuery

jQuery ->
  $('#new_painting').fileupload